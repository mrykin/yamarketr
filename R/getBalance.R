#Получаем баланс
getBalance <- function(shops = NULL, Token = NULL, client_id = "8943390a15784189a8538ce5c4d57dfb", Login = NULL, TokenPath = getwd()){
  if (is.null(shops)) {
    stop("Укажите список магазинов")
  } else if (is.null(yamtoken)) {
    stop("Введите свой API-токен")
  } else if (is.null(yamclient_id)){
    stop("Введите client_id вашего приложения")
  }
  #Авторизация
  Token <- tech_auth(login = Login, token = Token, TokenPath = TokenPath)

  result <- data.frame(id = character(0), domain = character(0),
                       balance = numeric(0), daysLeft = integer(0), recomendedPayment = numeric(0),
                       stringsAsFactors = FALSE)
  for(i in 1:nrow(shops)){
    query <- paste0("https://api.partner.market.yandex.ru/v2/campaigns/", shops$id[i], "/balance.json")
    raw <- httr::GET(url=query, httr::add_headers(Authorization=paste("OAuth oauth_token=",Token,",oauth_client_id=",client_id)))
    data <- jsonlite::fromJSON(httr::content(raw,type="text", encoding = "UTF-8"), flatten = TRUE)
    if(raw$status_code > 200){
      stop(paste(data$errors$code, "-", data$errors$message))
    }
    if(is.null(data$balance)) next
    result <- rbind(result, data.frame(id = as.character(shops$id[i]),
                                       balance = data$balance$balance,
                                       daysLeft = data$balance$daysLeft,
                                       recommendedPayment = data$balance$recommendedPayment,
                                       stringsAsFactors = FALSE)
    )
    message(paste("Получены данные -", shops$domain[i]))
  }
  return(result)
}
