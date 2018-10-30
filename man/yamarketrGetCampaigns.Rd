\name{yamarketrGetCampaigns}
\alias{yamarketrGetCampaigns}
\title{Get list of shops from Yandex Market}
\description{Данная функция возвращает data.frame со списком всех кампаний (магазинов), доступных в аккаунте, которому был выдан токен для доступа к API.}
\usage{
  yamarketrGetCampaigns(Login = NULL,
                        TokenPath = getwd())
}

\arguments{
  \item{Login}{Логин яндекса, под которым есть доступ к нужным магазинам. В этот вектор необходимо указывать логин в случае если необходимо подключаться к разным аккаунтам. В противном случае при каждом запросе к новому аккаунту - токен будет перезатираться. При указании логина в рабочей директории будет создан отдельный файл под каждый логин, в котором будут хранится нужные для работы учётные данные.}
  \item{TokenPath}{Путь к папке в которой хранятся все файлы с учётными данными.}
}

\value{data frame с id магазинов, доменом, статусом магазином, причиной статусов "выключен" или "выключается".}
\author{Pavel Mrykin}


\examples{
  \dontrun{
    # Подключаем пакет
    library(yamarketr)
    # Получаем список магазинов
    campaigns <- yamarketrGetCampaigns(Login = "login", NewUser = FALSE)
  }
}
