\name{yamarketrGetTickets}
\alias{yamarketrGetTickets}
\title{Get error tickets for shops from Yandex Market}
\description{Данная функция возвращает данные о текущих ошибках магазина, выявленных службой контроля качества Яндекс.Маркета.}
\usage{
  yamarketrGetTickets(Campaigns,
                      actualType = NULL,
                      Login = NULL,
                      TokenPath = getwd())
}

\arguments{
  \item{Campaigns}{data frame, полученный с помощью функции yamarketrGetCampaigns, или составленный вручную, например data.frame(id=c(1111111,2222222),domain=c("shop1.ru","shop2.ru"))}
  \item{actualType}{Фильтрация актуальных ошибок магазина. Возможные значения:
  \itemize{
    \item 0 — актуальные ошибки (все ошибки, выявленные за последние 30 дней);
    \item 1 — архивные ошибки (все ошибки, выявленные более 30, но менее 90 дней назад).
    }}
  \item{Login}{Логин яндекса, под которым есть доступ к нужным магазинам. В этот вектор необходимо указывать логин в случае если необходимо подключаться к разным аккаунтам. В противном случае при каждом запросе к новому аккаунту - токен будет перезатираться. При указании логина в рабочей директории будет создан отдельный файл под каждый логин, в котором будут хранится нужные для работы учётные данные.}
  \item{TokenPath}{Путь к папке в которой хранятся все файлы с учётными данными.}
}

\value{data frame с:
  \itemize{
      \item id магазинов;
      \item Идентификатор тикета на ошибку в службе контроля качества;
      \item URL-адрес предложения с ошибкой на сайте магазина;
      \item Текстовое описание ошибки;
      \item Код ошибки магазина;
      \item Дата и время выявления ошибки;
      \item Дата и время загрузки прайс-листа;
      \item Тип проверки магазина;
      \item Статус ошибки;
      \item Идентификатор заказа на сайте магазина;
      }
}
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

    # Получаем список актуальных ошибок по магазинам
    tickets <- yamarketrGetTickets(campaigns, actualType = 0, Login = "login")
  }
}
