# Получаем логины магазинов
yamarketrGetLogins <- function(Campaigns, howmuch = NULL,
                      Login = NULL, TokenPath = getwd()){
  
  result <- data.frame(id = character(0), logins = character(0))

  Token <- yamarketrAuth(Login = Login, TokenPath = TokenPath, NewUser = FALSE)$access_token
 
  nrowCampaigns <- ifelse(is.vector(Campaigns), length(Campaigns), nrow(Campaigns))
  pb   <- txtProgressBar(1, nrowCampaigns, style=3)
  #Авторизация
  Token <- yamarketrAuth(Login = Login, TokenPath = TokenPath, NewUser = FALSE)$access_token
  for(i in nrowCampaigns){
    query <- paste0("https://api.partner.market.yandex.ru/v2/campaigns/",Campaigns$id[i],"/logins.json")
    raw <- httr::GET(url=query,
                     httr::add_headers(Authorization=paste0("OAuth oauth_token=",
                                                            Token,",oauth_client_id=8943390a15784189a8538ce5c4d57dfb")))
    data <- jsonlite::fromJSON(httr::content(raw, type="text", encoding = "UTF-8"), flatten = TRUE)
    if(raw$status_code > 200){
      stop(paste(data$errors$code, "-", data$errors$message, "-", campaignId))
    }
    result <- rbind(result, data.frame(id = as.character(campaignId),
                                       logins = ifelse(is.null(howmuch),
                                                       paste(data$logins, collapse = ', '),
                                                       data$logins[1:howmuch]),
                                       stringsAsFactors = FALSE)
    )
    setTxtProgressBar(pb, i)
  }
  message(paste("\nПолучены логины для магазинов:", nrow(Campaigns)))
  return(result)
}
