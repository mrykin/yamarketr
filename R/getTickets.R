#Получаем ошибки по магазинам
getTickets <- function(shops, actualType = NULL, Token = NULL, client_id = "8943390a15784189a8538ce5c4d57dfb", Login = NULL, TokenPath = getwd()){

  #Авторизация
  Token <- tech_auth(login = Login, token = Token, TokenPath = TokenPath)
  result <- data.frame(id = character(0),
                       ticketId = character(0),
                       offerURL = numeric(0),
                       errorText = character(0),
                       errorCode = numeric(0),
                       errorFoundTime = character(0),
                       feedTime = character(0),
                       checkMethod = numeric(0),
                       status = numeric(0),
                       orderId = character(0)
  )

  for(i in 1:nrow(shops)){
    query <- paste0("https://api.partner.market.yandex.ru/v2/campaigns/",shops$id[i],"/quality/tickets.json",
                    ifelse(exists("actualType"),paste0("?actualType=",actualType), ""))
    raw <- httr::GET(url=query, httr::add_headers(Authorization=paste("OAuth oauth_token=", Token,",oauth_client_id=", client_id))
    )
    data <- jsonlite::fromJSON(httr::content(raw,type="text", encoding = "UTF-8"))
    if(raw$status_code > 200){
      stop(paste(data$errors$code, "-", data$errors$message))
    }
    if(length(data$result$tickets) == 0){
      next
    }
    data$result$tickets$errorFoundTime <- as.character(lubridate::as_datetime(data$result$tickets$errorFoundTime))
    result <- rbind(result, data.frame(id = shops$id[i],
                                       ticketId = data$result$tickets$ticketId,
                                       offerURL = data$result$tickets$offerURL,
                                       errorText = data$result$tickets$errorText,
                                       errorCode = data$result$tickets$errorCode,
                                       errorFoundTime = data$result$tickets$errorFoundTime,
                                       feedTime = ifelse(is.null(data$result$tickets$feedTime), "", data$result$tickets$feedTime),
                                       checkMethod = data$result$tickets$checkMethod,
                                       status = data$result$tickets$status,
                                       orderId = ifelse(is.null(data$result$tickets$orderId), "", data$result$tickets$orderId),
                                       stringsAsFactors = FALSE
    )
    )
  }
  result$feedTime <- as.character(lubridate::as_datetime(result$feedTime))
  result$feedTime[is.na(result$feedTime)] <- ""
  result$orderId[is.na(result$orderId)] <- ""

  return(result)

}
