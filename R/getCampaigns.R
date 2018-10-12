# Получаем список магазинов
getCampaigns <- function(Token = NULL, client_id = "8943390a15784189a8538ce5c4d57dfb", Login = NULL, TokenPath = getwd()){
  if (is.null(token)) {
    stop("Введите свой API-токен")
  } else if (is.null(client_id)){
    stop("Введите client_id вашего приложения")
  }
  #Авторизация
  Token <- tech_auth(login = Login, token = Token, TokenPath = TokenPath)
  result <- data.frame(id = character(0), domain = character(0), state = numeric(0), stateReasons = numeric(0))
  while(nrow(result) == 0) {
    query <- "https://api.partner.market.yandex.ru/v2/campaigns.json"
    raw <- httr::GET(url=query, httr::add_headers(Authorization=paste("OAuth oauth_token=",Token,",oauth_client_id=",client_id)))
    data <- jsonlite::fromJSON(httr::content(raw,type="text", encoding = "UTF-8"), flatten = TRUE)

    for(i in 1:data$pager$total){
      result <- rbind(result, data.frame(id = data$campaigns$id[i],
                                         domain = data$campaigns$domain[i],
                                         state = as.factor(data$campaigns$state[i]),
                                         stateReasons = paste(unlist(data$campaigns$stateReasons[i]), collapse=", "),
                                         stringsAsFactors = FALSE)
      )
    }
  }
  return(result)
}
