# Получаем логины магазинов
getLogins <- function(shops, howmuch = NULL, Token = NULL,
                      client_id = "8943390a15784189a8538ce5c4d57dfb", Login = NULL, TokenPath = getwd()){
  
  #Авторизация
  Token <- tech_auth(login = Login, token = Token, TokenPath = TokenPath)
  result <- data.frame(id = character(0), logins = character(0))

  for(i in 1:nrow(shops)){
    query <- paste0("https://api.partner.market.yandex.ru/v2/campaigns/",shops$id[i],"/logins.json")
    raw <- httr::GET(url=query,
                     httr::add_headers(Authorization=paste0("OAuth oauth_token=",
                                                            Token,",oauth_client_id=",
                                                            client_id)))
    data <- jsonlite::fromJSON(httr::content(raw, type="text", encoding = "UTF-8"), flatten = TRUE)
    if(raw$status_code > 200){
      stop(paste(data$errors$code, "-", data$errors$message))
    }
    result <- rbind(result, data.frame(id = shops$id[i],
                                       logins = ifelse(is.null(howmuch),
                                                       paste(data$logins, collapse = ', '),
                                                       data$logins[1:howmuch]),
                                       stringsAsFactors = FALSE)
    )
  }
  return(result)
}
