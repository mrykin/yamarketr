yamGetToken <- function(){
  browseURL("https://oauth.yandex.ru/authorize?response_type=token&client_id=f671ea518c1f41968e50e641c3c0a64a")
  token <- readline(prompt = "Введите ваш токен: ")
  return(token)
}
