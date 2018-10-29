\name{yamarketGetBalance}
\alias{yamarketGetBalance}
\title{Загрузка текущего баланса магазинов}
\description{Данная функция возвращает data frame со списком всех кампаний доступных в аккаунте которому был выдан токен для доступа к API.}
\usage{
yamarketGetBalance(Campaigns = NULL, 
                   Login = NULL, 
                   TokenPath = getwd())
}

\arguments{
  \item{Campaigns}{data frame, полученный с помощью функции yamarketGetCampaigns, или составленный вручную, например data.frame(id=c(1111111,2222222),domain=c("shop1.ru","shop2.ru"))}
  \item{Login}{Логин яндекса, под которым есть доступ к нужным магазинам. В этот вектор необходимо указывать логин в случае если необходимо подключаться к разным аккаунтам. В противном случае при каждом запросе к новому аккаунту - токен будет перезатираться. При указании логина в рабочей директории будет создан отдельный файл под каждый логин, в котором будут хранится нужные для работы учётные данные.}
  \item{TokenPath}{Путь к папке в которой хранятся все файлы с учётными данными.}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{data frame с id магазина, его текущим балансом, прогноз количества дней, оставшихся до полного израсходования средств, рекомендуемая сумма платежа в у.е.}
\author{Pavel Mrykin}

\seealso{
Для загрузки списка магазинов используйте \code{\link[yamarketr:yamarketGetCampaigns]{yamarketGetCampaigns}}	
}

\examples{
\dontrun{
# Подключаем пакет
library(yamarketr)
# Получаем список магазинов
campaigns <- yamarketGetCampaigns(Login = "login", NewUser = TRUE)
# Получаем баланс по магазинам
balance <- yamarketGetBalance(campaigns, Login = "login")
}
}
