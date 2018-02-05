yamGetBalance <- function(shops = NULL, token = NULL, client_id = "f671ea518c1f41968e50e641c3c0a64a"){
  if (is.null(shops)) {
    stop("Укажите список магазинов")
  } else if (is.null(token)) {
    stop("Введите свой API-токен")
  } else (is.null(client_id)){
    stop("Введите client_id вашего приложения")
  }
  result <- data.frame(shopId = integer(0), domain = character(0),
                       balance = numeric(0), daysLeft = integer(0), recommendedPayment = numeric(0),
                       stringsAsFactors = FALSE
  )
  for(i in 1:nrow(shops)){
    query <- paste0("https://api.partner.market.yandex.ru/v2/campaigns/", shops$id[i], "/balance.json")
    answer <- httr::GET(url=query, httr::add_headers(Authorization=paste("OAuth oauth_token=",yamtoken,",oauth_client_id=",yamclient_id)))
    dataRaw <- content(answer, "parsed", "application/json")
    result <- rbind(result, data.frame(shopId = shops$shopId[i],
                                       domain = enc2utf8(shops$domain[i]),
                                       balance = dataRaw$balance$balance,
                                       daysLeft = dataRaw$balance$daysLeft,
                                       recommendedPayment = dataRaw$balance$recommendedPayment,
                                       stringsAsFactors = FALSE)
    )
    packageStartupMessage(".", appendLF = F)
  }
  return(result)
}
