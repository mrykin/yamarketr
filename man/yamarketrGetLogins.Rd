\name{yamarketrGetLogins}
\alias{yamarketrGetLogins}
\title{Get logins for shops from Yandex Market}
\description{Данная функция возвращает список логинов, которые прикреплены к выбранным магазинам. Может использоваться для группировки магазинов одного клиента.}
\usage{
  yamarketrGetLogins(Campaigns,
                     howmuch = NULL,
                     Login = NULL,
                     TokenPath = getwd())
}

\arguments{
  \item{Campaigns}{data frame, полученный с помощью функции yamarketrGetCampaigns, или составленный вручную, например data.frame(id=c(1111111,2222222),domain=c("shop1.ru","shop2.ru"))}
  \item{howmuch}{атрибут определяет количество логинов, которые нужно вывести.

По умолчанию - возвращаются все логины у которых есть доступ к магазину.

Ограничение задаётся с помощью чисел 1, 2, 3 и т.д.}
  \item{Login}{Логин яндекса, под которым есть доступ к нужным магазинам. В этот вектор необходимо указывать логин в случае если необходимо подключаться к разным аккаунтам. В противном случае при каждом запросе к новому аккаунту - токен будет перезатираться. При указании логина в рабочей директории будет создан отдельный файл под каждый логин, в котором будут хранится нужные для работы учётные данные.}
  \item{TokenPath}{Путь к папке в которой хранятся все файлы с учётными данными.}
}

\value{data frame с id магазинов, и списком логинов, количество которых зависит от параметра howmuch}
\author{Pavel Mrykin}

\seealso{
  Для загрузки списка магазинов используйте \code{\link[yamarketr:yamarketrGetCampaigns]{yamarketrGetCampaigns}}
}

\examples{
  \dontrun{
    # Подключаем пакет
    library(yamarketr)
    # Получаем список магазинов
    campaigns <- yamarketrGetCampaigns(Login = "login", NewUser = FALSE)

    # Получаем список логинов по одному для каждого магазина
    logins <- yamarketrGetLogins(campaigns, howmuch = 1, Login = "login")
  }
}
