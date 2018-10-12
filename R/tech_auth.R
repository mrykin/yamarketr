# тех функция для авторизации в других функциях
tech_auth <-  function(login = NULL, token = NULL, TokenPath = NULL) {

  # Если задан токен то пропускаем проверку
  if (!is.null(token) ) {
    # Определяем класс объекта содержащего токен
    if(class(token) == "list") {
      Token <- token$access_token
    } else {
      Token <- token
    }
    # Если токен не задан то необходимо его получить
  } else {

    # загружаем токен
    Token <- yamarketAuth(Login = login, TokenPath = TokenPath, NewUser = FALSE)$access_token
  }

  # возвращаем токен
  return(Token)
}
