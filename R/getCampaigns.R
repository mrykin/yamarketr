getCampaigns <- function(yamtoken, yamclient_id){
  query <- "https://api.partner.market.yandex.ru/v2/campaigns.json"
  answer <- httr::GET(url=query, httr::add_headers(Authorization=paste("OAuth oauth_token=",yamtoken,",oauth_client_id=",yamclient_id)))
  httr::stop_for_status(answer)
  dataRaw <- httr::content(answer, "parsed", "application/json", encoding = "UTF-8")
  if (length(dataRaw$error) > 0) {
    stop(paste(dataRaw$error$code, "-", dataRaw$errors$code, "-",
                dataRaw$errors$message))
  }
  result <- data.frame(id = integer(), domain = character(), state = integer(),
                       prepayEnabled = logical(), stateCpa = factor()
  )
  for(i in 1:dataRaw$pager$total){
  result <- rbind(result, data.frame(
                      id = dataRaw$campaigns[[i]]$id,
                      domain = dataRaw$campaigns[[i]]$domain,
                      state = dataRaw$campaigns[[i]]$state,
                      prepayEnabled = dataRaw$campaigns[[i]]$prepayEnabled,
                      stateCpa = dataRaw$campaigns[[i]]$stateCpa, stringsAsFactors = FALSE)
                  )
  }
  result$domain <- as.character(result$domain)
  result$state <- as.factor(result$state)
  result$stateCpa <- as.factor(result$stateCpa)
  return(result)
}
