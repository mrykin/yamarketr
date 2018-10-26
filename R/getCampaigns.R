# Получаем список магазинов
getCampaigns <- function(Login = NULL, TokenPath = getwd()){
  #Авторизация
  Token <- yamarketAuth(Login = Login, TokenPath = TokenPath, NewUser = FALSE)$access_token
  result <- data.frame(id = character(0), domain = character(0), state = numeric(0), stateReasons = numeric(0))
  while(nrow(result) == 0) {
    query <- "https://api.partner.market.yandex.ru/v2/campaigns.json"
    raw <- httr::GET(url=query, httr::add_headers(Authorization=paste("OAuth oauth_token=",Token,",oauth_client_id=8943390a15784189a8538ce5c4d57dfb")))
    data <- jsonlite::fromJSON(httr::content(raw,type="text", encoding = "UTF-8"), flatten = TRUE)
    if(raw$status_code > 200){
      stop(paste(data$errors$code, "-", data$errors$message))
    }
    if(is.null(data$campaigns)) next
    for(i in 1:data$pager$total){
      result <- rbind(result, data.frame(id = data$campaigns$id[i],
                                         domain = data$campaigns$domain[i],
                                         state = as.factor(data$campaigns$state[i]),
                                         stateReasons = paste(mapvalues(unlist(data$campaigns$stateReasons[i]),
                                                                        from = c(5,6,7,9,11,12,13,15,16,20,21,24,25),
                                                                        to=c("проверяется",
                                                                             "требуется проверка",
                                                                             "выключен или выключается менеджером",
                                                                             "выключен или выключается из-за финансовых проблем",
                                                                             "выключен или выключается из-за ошибок в прайс-листе магазина",
                                                                             "выключен или выключается пользователем",
                                                                             "выключен или выключается за неприемлемое качество",
                                                                             "выключен или выключается из-за обнаружения дублирующих витрин",
                                                                             "выключен или выключается из-за прочих проблем качества",
                                                                             "выключен или выключается по расписанию",
                                                                             "выключен или выключается, так как сайт магазина временно недоступен",
                                                                             "выключен или выключается за недостаток информации о магазине",
                                                                             "выключен или выключается из-за неактуальной информации"),warn_missing=FALSE), collapse=", "),
                                         stringsAsFactors = FALSE)
      )
    }
  }
  result$state <- mapvalues(result$state, from=c(1,2,3,4),
                                 to=c("включен", "выключен", "включается", "выключается"),
                                 warn_missing=FALSE)
  return(result)
}
