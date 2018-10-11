# yamarketr - пакет для работы с Партнёрским API Яндекс.Маркета на языке R


## Краткое описание

Данный пакет предназначен для получения данных из Яндекс.Маркета в R. С помощью функций пакета вы можете получить доступ к следующей информации:



*   Список кампаний
*   Баланс кампаний
*   Расход по периодам
*   Расход по предложениям
*   Параметры кампании
*   Список логинов
*   Точки продаж
*   Список предложений для модели (конкурентная аналитика в карточках)

Функции пакета постепенно будут добавляться и расширяться в описании будет указаны статус разработки и планируемые изменения.


## Установка пакета yandexmarketr

Установка пакета осуществляется из репозитория GitHub, для этого сначала требуется установить и подключить пакет devtools.


```
install.packages("devtools")
library(devtools)
```


После чего можно устанавливать пакет yandexmarketr.


```
install_github('mrykinpavel/yandexmarketr')
```



## Функции пакета


### getCampaigns(token, clientid) - 80% завершено

Данная функция возвращает data.frame со списком всех кампаний доступных в аккаунте которому был выдан токен для доступа к API.

Структура data.frame, возвращаемого функцией `getCampaigns`:


<table>
  <tr>
   <td>Поле
   </td>
   <td>Тип данных
   </td>
   <td>Описание
   </td>
  </tr>
  <tr>
   <td>shopid
   </td>
   <td>int
   </td>
   <td>Идентификатор кампании. В интерфейсе он выводится в формате 11-******. В API же используется часть после дефиса. Количество знаков после дефиса может отличаться и зависит от того, как давно вы зарегистрировали кампанию.
   </td>
  </tr>
  <tr>
   <td>domain
   </td>
   <td>chr
   </td>
   <td>URL-адрес кампании
   </td>
  </tr>
  <tr>
   <td>state
   </td>
   <td>Factor
   </td>
   <td>Статус Кампании
<p>
Возможные значения:<ul>

<li>1 — кампания включена.
<li>2 — кампания выключена.
<li>3 — кампания включается.
<li>4 — кампания выключается.</li></ul>

   </td>
  </tr>
  <tr>
   <td>prepayEnabled
   </td>
   <td>logi
   </td>
   <td>Предоплата при приеме заказов с Яндекс.Маркета.
<p>
Возможные значения:<ul>

<li>false — предоплата включена.
<li>true — предоплата отключена.</li></ul>

   </td>
  </tr>
  <tr>
   <td><strong>stateCpa</strong>
   </td>
   <td>Factor
   </td>
   <td>Статус программы «<a href="https://yandex.ru/support/partnermarket/purchase/about.html">Заказ на Маркете</a>» для кампании.
<p>
Возможные значения:<ul>

<li>OFF — программа отключена.
<li>ON — программа подключена.
<li>SWITCHING_ON — программа в процессе подключения.</li></ul>

   </td>
  </tr>
</table>



## Позже будут добавлены функции для получения данных:



*   [Баланс кампании](https://tech.yandex.ru/market/partner/doc/dg/reference/get-campaigns-id-balance-docpage/)
*   [Расход по периодам](https://tech.yandex.ru/market/partner/doc/dg/reference/get-campaigns-id-stats-main-docpage/)
*   [Расход по предложениям](https://tech.yandex.ru/market/partner/doc/dg/reference/get-campaigns-id-stats-offers-docpage/)
*   [Параметры кампании](https://tech.yandex.ru/market/partner/doc/dg/reference/get-campaigns-id-settings-docpage/)
*   [Точки продаж](https://tech.yandex.ru/market/partner/doc/dg/reference/outlet-methods-docpage/)
*   [Список предложений для модели (конкурентная аналитика в карточках)](https://tech.yandex.ru/market/partner/doc/dg/reference/content-methods-docpage/)

<!-- GD2md-html version 1.0β13 -->
