\name{yamarketrGetBalance}
\alias{yamarketrGetBalance}
\title{Get balance for shops from Yandex Market}
\description{Данная функция возвращает data frame со списком всех кампаний доступных в аккаунте которому был выдан токен для доступа к API.}
\usage{
yamarketrGetBalance(Campaigns = NULL, 
                    Login = NULL, 
                    TokenPath = getwd())
}

\arguments{
  \item{Campaigns}{data frame, полученный с помощью функции yamarketrGetCampaigns, или составленный вручную, например data.frame(id=c(1111111,2222222),domain=c("shop1.ru","shop2.ru"))}
  \item{Login}{Логин яндекса, под которым есть доступ к нужным магазинам. В этот вектор необходимо указывать логин в случае если необходимо подключаться к разным аккаунтам. В противном случае при каждом запросе к новому аккаунту - токен будет перезатираться. При указании логина в рабочей директории будет создан отдельный файл под каждый логин, в котором будут хранится нужные для работы учётные данные.}
  \item{TokenPath}{Путь к папке в которой хранятся все файлы с учётными данными.}
}

\value{data frame с id магазина, его текущим балансом, прогноз количества дней, оставшихся до полного израсходования средств, рекомендуемая сумма платежа в у.е.}
\author{Pavel Mrykin}

\seealso{
Для загрузки списка магазинов используйте \code{\link[yamarketr:yamarketrGetCampaigns]{yamarketrGetCampaigns}}  
}

\examples{
\dontrun{
# Подключаем пакет
library(yamarketr)
# Получаем список магазинов
campaigns <- yamarketrGetCampaigns(Login = "login", NewUser = TRUE)
# Получаем баланс по магазинам
balance <- yamarketrGetBalance(campaigns, Login = "login")
}
}
