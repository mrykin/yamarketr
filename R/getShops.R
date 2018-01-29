getShops <- function(yamtoken, yamclient_id){
  get.shops.query <- "https://api.partner.market.yandex.ru/v2/campaigns.json"
  get.shops.data <- httr::GET(url=get.shops.query, add_headers(Authorization=paste("OAuth oauth_token=",yamtoken,",oauth_client_id=",yamclient_id)))
  get.shops.data <- jsonlite::fromJSON(content(get.shops.data,type="text", encoding = "UTF-8"))
  get.shops.data <- data.frame(id = get.shops.data$campaigns$id, domain = get.shops.data$campaigns$domain)
  get.shops.data$domain <- as.character(get.shops.data$domain)
  return(get.shops.data)
}
