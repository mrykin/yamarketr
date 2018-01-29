getBalance <- function(shops = NULL, yamtoken = NULL, yamclient_id = NULL){
  if (is.null(shops)) {
    stop("Укажите список магазинов")
  } else if (is.null(yamtoken)) {
    stop("Введите свой API-токен")
  } else if (is.null(yamclient_id)){
    stop("Введите client_id вашего приложения")
  }
  result <- data.frame(Id = character(0), domain = character(0),
                       balance = numeric(0), daysLeft = integer(0), recomendedPayment = numeric(0),
                       stringsAsFactors = FALSE)
  for(i in 1:nrow(shops)){
    get.balance.query <- paste0("https://api.partner.market.yandex.ru/v2/campaigns/", shops$id[i], "/balance.json")
    get.balance.data <- httr::GET(url=get.balance.query, add_headers(Authorization=paste("OAuth oauth_token=",yamtoken,",oauth_client_id=",yamclient_id)))
    balance <- content(get.balance.data, "parsed", "application/json")
    result <- rbind(result, data.frame(Id = shops$id[i],
                                       domain = shops$domain[i],
                                       balance = balance$balance$balance,
                                       daysLeft = balance$balance$daysLeft,
                                       recommendedPayment = balance$balance$recommendedPayment)
    )
    print(shops$domain[i])
  }
  return(result)
}
