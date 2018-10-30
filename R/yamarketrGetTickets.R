#Получаем ошибки по магазинам
yamarketrGetTickets <- function(Campaigns, actualType = NULL, Login = NULL, TokenPath = getwd()){
  #Авторизация
  Token <- yamarketrAuth(Login = Login, TokenPath = TokenPath, NewUser = FALSE)$access_token
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
  pb   <- txtProgressBar(1, nrow(Campaigns), style=3)
  for(i in 1:nrow(Campaigns)){
    campaignId <- ifelse(is.vector(Campaigns), Campaigns[i], Campaigns$id[i])
    query <- paste0("https://api.partner.market.yandex.ru/v2/campaigns/",Campaigns$id[i],"/quality/tickets.json",
                    ifelse(exists("actualType"),paste0("?actualType=",actualType), ""))
    raw <- httr::GET(url=query, httr::add_headers(Authorization=paste("OAuth oauth_token=", Token,",oauth_client_id=8943390a15784189a8538ce5c4d57dfb"))
    )
    data <- jsonlite::fromJSON(httr::content(raw,type="text", encoding = "UTF-8"))
    if(raw$status_code > 200){
      stop(paste(data$errors$code, "-", data$errors$message, "-", Campaigns$id[i]))
    }
    if(length(data$result$tickets) == 0){
      next
    }
    result <- rbind(result, data.frame(id = as.character(Campaigns$id[i]),
                                       ticketId = data$result$tickets$ticketId,
                                       offerURL = data$result$tickets$offerURL,
                                       errorText = as.factor(data$result$tickets$errorText),
                                       errorCategory = as.factor(plyr::mapvalues(data$result$tickets$errorCode,
                                                                 from = c(1,3,34,35,36,88,
                                                                          13,15,16,17,39,40,55,58,69,70,72,82,94,95,126,
                                                                          23,41,78,80,81,96,
                                                                          30,75,83,111,112,
                                                                          54,59,76,77,90),
                                                                 to = c("Проблемы с ценой товара","Проблемы с ценой товара",
                                                                        "Проблемы с ценой товара","Проблемы с ценой товара",
                                                                        "Проблемы с ценой товара","Проблемы с ценой товара",
                                                                        "Проблемы с оформлением заказа","Проблемы с оформлением заказа",
                                                                        "Проблемы с оформлением заказа","Проблемы с оформлением заказа",
                                                                        "Проблемы с оформлением заказа","Проблемы с оформлением заказа",
                                                                        "Проблемы с оформлением заказа","Проблемы с оформлением заказа",
                                                                        "Проблемы с оформлением заказа","Проблемы с оформлением заказа",
                                                                        "Проблемы с оформлением заказа","Проблемы с оформлением заказа",
                                                                        "Проблемы с оформлением заказа","Проблемы с оформлением заказа",
                                                                        "Проблемы с оформлением заказа",
                                                                        "Проблемы с информацией о товаре или его качеством",
                                                                        "Проблемы с информацией о товаре или его качеством",
                                                                        "Проблемы с информацией о товаре или его качеством",
                                                                        "Проблемы с информацией о товаре или его качеством",
                                                                        "Проблемы с информацией о товаре или его качеством",
                                                                        "Проблемы с информацией о товаре или его качеством",
                                                                        "Проблемы с доставкой товара","Проблемы с доставкой товара",
                                                                        "Проблемы с доставкой товара","Проблемы с доставкой товара",
                                                                        "Проблемы с доставкой товара",
                                                                        "Некритичные ошибки","Некритичные ошибки",
                                                                        "Некритичные ошибки","Некритичные ошибки",
                                                                        "Некритичные ошибки"),warn_missing=FALSE
                                                                  )),
                                       errorCode = as.factor(data$result$tickets$errorCode),
                                       errorFoundTime = anytime::anytime(data$result$tickets$errorFoundTime),
                                       feedTime = anytime::anytime(ifelse(is.null(data$result$tickets$feedTime), "", data$result$tickets$feedTime)),
                                       checkMethod = as.factor(plyr::mapvalues(data$result$tickets$checkMethod,
                                                               from = c(1,2,3,4),
                                                               to=c("проверка по телефону",
                                                                    "проверка с помощью добавления товара в корзину на сайте магазина",
                                                                    "визуальная проверка сайта магазина",
                                                                    "комплексная проверка"),warn_missing=FALSE)),
                                       status = as.factor(plyr::mapvalues(data$result$tickets$status,
                                                                    from = c(0,1),
                                                                    to = c("ошибка выставлена", "магазин исправил ошибку")
                                                                    ,warn_missing=FALSE)),
                                       orderId = ifelse(is.null(data$result$tickets$orderId), "", data$result$tickets$orderId),
                                       stringsAsFactors = FALSE








    )
    )
    setTxtProgressBar(pb, i)
  }
  result$orderId[is.na(result$orderId)] <- ""
  message(paste("\nЗагрузка завершена!"))
  return(result)
}
