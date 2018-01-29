getCosts <- function(shops, fromDate, toDate, yamtoken, yamclient_id){
  costs.data <- list()
  for(i in 1:nrow(shops)){
    get.costs.query <- paste0("https://api.partner.market.yandex.ru/v2/campaigns/", shops$id[i], "/stats/main.json?fromDate=", fromDate, "&fields=shows&toDate=",toDate)
    get.costs.data <- httr::GET(url=get.costs.query, httr::add_headers(Authorization=paste("OAuth oauth_token=",yamtoken,",oauth_client_id=",yamclient_id)))
    costs <- jsonlite::fromJSON(content(get.costs.data,type="text", encoding = "UTF-8"))
    costs.data[[i]] <- data.frame(id = shops$id[i], domain = shops$domain[i], clicks = sum(costs$mainStats$clicks), spending = sum(costs$mainStats$spending), shows = sum(as.numeric(costs$mainStats$shows)))
    if(is.null(costs.data[[i]])) next
    if(exists("result") == FALSE){
      result <- costs.data[[i]]
    } else {
      result <- rbind(result,costs.data[[i]])
    }
  }
  return(result)
}
