#Получаем баланс
yamarketrGetBalance <- function(Campaigns = NULL, Login = NULL, TokenPath = getwd()){
  if (is.null(Campaigns)) {
    stop("Укажите список магазинов")
  }
  #Авторизация
  Token <- yamarketAuth(Login = Login, TokenPath = TokenPath, NewUser = FALSE)$access_token

  result <- data.frame(id = character(0),
                       balance = numeric(0), daysLeft = integer(0), recomendedPayment = numeric(0),
                       stringsAsFactors = FALSE)
  for(i in 1:nrow(Campaigns)){
    campaignId <- ifelse(is.vector(Campaigns), Campaigns[i], Campaigns$id[i])
    query <- paste0("https://api.partner.market.yandex.ru/v2/campaigns/", campaignId, "/balance.json")
    raw <- httr::GET(url=query, httr::add_headers(Authorization=paste("OAuth oauth_token=",Token,",oauth_client_id=8943390a15784189a8538ce5c4d57dfb")))
    data <- jsonlite::fromJSON(httr::content(raw,type="text", encoding = "UTF-8"), flatten = TRUE)
    if(raw$status_code > 200){
      stop(paste(data$errors$code, "-", data$errors$message))
    }
    if(is.null(data$balance)) next
    result <- rbind(result, data.frame(id = as.character(campaignId),
                                       balance = data$balance$balance,
                                       daysLeft = data$balance$daysLeft,
                                       recommendedPayment = data$balance$recommendedPayment,
                                       stringsAsFactors = FALSE)
    )
    message(paste("Получены данные:", campaignId, "-", Campaigns$domain[i]))
  }
  return(result)
}