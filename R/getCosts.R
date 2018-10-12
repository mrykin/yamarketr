#Получаем расход
getCosts <- function(shops,
                     fromDate = format(Sys.Date()-8, "%d-%m-%Y"),
                     toDate = format(Sys.Date()-1, "%d-%m-%Y"),
                     Token = NULL, client_id = "8943390a15784189a8538ce5c4d57dfb", Login = NULL, TokenPath = getwd(), places = 1, fetchBy = "daily"){
  result <- data.frame(date = character(0),
                       id = character(0),
                       placeGroup = numeric(0),
                       clicks = numeric(0),
                       spending = numeric(0),
                       shows = numeric(0)
  )
  #Авторизация
  Token <- tech_auth(login = Login, token = Token, TokenPath = TokenPath)
  for(i in 1:ifelse(is.vector(shops), length(shops), nrow(shops))){
    shopid <- ifelse(is.vector(shops), shops[i], shops$id[i])
    query <- paste0("https://api.partner.market.yandex.ru/v2/campaigns/",
                    shopid,
                    "/stats/main",
                    paste0("-",fetchBy),
                    ".json?fromDate=", fromDate,
                    "&toDate=",toDate,
                    "&fields=shows",
                    ifelse(places == 1, ",model&byPlaces=1", ""))
    raw <- httr::GET(url=query, httr::add_headers(Authorization=paste("OAuth oauth_token=",Token,",oauth_client_id=",client_id)))
    if(raw$status_code > 200){
      stop(paste(data$errors$code, "-", data$errors$message))
    }
    data <- jsonlite::fromJSON(httr::content(raw,type="text", encoding = "UTF-8"))
    if(is.null(data$mainStats$clicks)) next
    result <- rbind(result, data.frame(date = as.Date(data$mainStats$date),
                                       id = as.character(shopid),
                                       placeGroup = data$mainStats$placeGroup,
                                       clicks = data$mainStats$clicks,
                                       spending = data$mainStats$spending,
                                       shows = as.integer(data$mainStats$shows),
                                       stringsAsFactors = FALSE)
    )
  }
  return(result)
}
