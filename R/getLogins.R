# Получаем логины магазинов
getLogins <- function(shops, howmuch = NULL, token = NULL, client_id = NULL){
  if (is.null(token)) {
    stop("Введите свой API-токен")
  } else if (is.null(client_id)){
    stop("Введите client_id вашего приложения")
  }
  result <- data.frame(id = character(0), logins = character(0))

  for(i in 1:nrow(shops)){
    query <- paste0("https://api.partner.market.yandex.ru/v2/campaigns/",shops$id[i],"/logins.json")
    raw <- httr::GET(url=query,
                     httr::add_headers(Authorization=paste0("OAuth oauth_token=",
                                                            token,",oauth_client_id=",
                                                            client_id)))
    data <- jsonlite::fromJSON(httr::content(raw, type="text", encoding = "UTF-8"), flatten = TRUE)
    result <- rbind(result, data.frame(id = shops$id[i],
                                       logins = ifelse(is.null(howmuch),
                                                       paste(data$logins, collapse = ', '),
                                                       data$logins[1:howmuch]),
                                       stringsAsFactors = FALSE)
    )
  }
  return(result)
}
