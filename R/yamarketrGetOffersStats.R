# Получаем расходы по предложениям
yamarketrGetOffersStats <- function (Campaigns, 
                                    fromDate = format(Sys.Date() - 8, "%d-%m-%Y"), 
                                    toDate = format(Sys.Date() - 1, "%d-%m-%Y"), 
                                    Login = NULL, 
                                    TokenPath = getwd(), 
                                    feedId = NULL, 
                                    offerId = NULL, 
                                    fields = "url") 
{
  result <- data.frame(clicks = numeric(0), spending = numeric(0), 
                       offerName = character(0), feedId = character(0), 
                       offerId = character(0), url = character(0))
  nrowCampaigns <- ifelse((is.vector(Campaigns) | is.numeric(Campaigns) | 
                             is.character(Campaigns)), length(Campaigns), nrow(Campaigns))
  if (nrowCampaigns > 1) {
    pb <- txtProgressBar(1, nrowCampaigns, style = 3)
  }
  Token <- yamarketrAuth(Login = Login, TokenPath = TokenPath, 
                         NewUser = FALSE)$access_token
  for (i in 1:nrowCampaigns) {
    if (nrowCampaigns > 1) {
      setTxtProgressBar(pb, i)
    }
    campaignId <- ifelse(is.vector(Campaigns), Campaigns[i], 
                         Campaigns$id[i])
    query <- paste0("https://api.partner.market.yandex.ru/v2/campaigns/", 
                    campaignId, "/stats/offers", 
                    ".json?fromDate=", fromDate, "&toDate=", toDate, 
                    ifelse(is.null(feedId), "", paste("&feedId=",feedId)),
                    ifelse(is.null(offerId), "", paste("&offerId=",offerId)),
                    "&fields=", fields)
    raw <- httr::RETRY("GET", url = query, httr::add_headers(Authorization = paste("OAuth oauth_token=", 
                                                                                   Token, ",oauth_client_id=8943390a15784189a8538ce5c4d57dfb")), 
                       times = 5, pause_min = 20, terminate_on_success = FALSE)
    data <- jsonlite::fromJSON(httr::content(raw, type = "text", 
                                             encoding = "UTF-8"))
    if (raw$status_code > 200) {
      stop(paste(data$errors$code, "-", data$errors$message, 
                 "-", campaignId))
    }
    
    result <- rbind(result, data$offersStats$offerStats)
    
    page <- 2L
    totalOffers <- ceiling(data$offersStats$totalOffersCount/100)
    while(page <= totalOffers){
      
      query <- paste0("https://api.partner.market.yandex.ru/v2/campaigns/", 
                      campaignId, "/stats/offers", 
                      ".json?fromDate=", fromDate, "&toDate=", toDate, 
                      ifelse(is.null(feedId), "", paste("&feedId=",feedId)),
                      ifelse(is.null(offerId), "", paste("&offerId=",offerId)),
                      "&fields=", fields,"&page=",page)
      raw <- httr::RETRY("GET", url = query, httr::add_headers(Authorization = paste("OAuth oauth_token=", 
                                                                                     Token, ",oauth_client_id=8943390a15784189a8538ce5c4d57dfb")), 
                         times = 5, pause_min = 20, terminate_on_success = FALSE)
      data <- jsonlite::fromJSON(httr::content(raw, type = "text", 
                                               encoding = "UTF-8"))
      result <- rbind(result, data$offersStats$offerStats)
      page <- page+1
    }
    
    
    
    # Проверка на пустую статистику
    # if (is.null(data$mainStats$clicks)) 
    #   next
    # result <- rbind(result, data.frame(date = as.Date(data$mainStats$date), 
    #                                    id = as.character(campaignId), placeGroup = data$mainStats$placeGroup, 
    #                                    clicks = data$mainStats$clicks, shows = as.integer(data$mainStats$shows), 
    #                                    spending = data$mainStats$spending, stringsAsFactors = FALSE))
  }

  message(paste("\nЗагрузка завершена!"))
  return(result)
}
