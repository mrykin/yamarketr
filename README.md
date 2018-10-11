
.. _h4d40e3d5260377f6b0165b553c6370:

yandexmarketr - пакет для работы
с Партнёрским API Яндекс.Маркета на языке R
****************************************************************************

.. _h6e734d432868425a222713258633539:

Краткое описание
================

.. _h352c7f455e306d6f777b3b491b674149:

Данный пакет предназначен для получения данных из Яндекс.Маркета в R. С помощью функций пакета вы можете получить доступ к следующей информации:
************************************************************************************************************************************************

* Список кампаний

* Баланс кампаний

* Расход по периодам

* Расход по предложениям

* Параметры кампании

* Список логинов

* Точки продаж

* Список предложений для модели (конкурентная аналитика в карточках)

Функции пакета постепенно будут добавляться и расширяться в описании будет указаны статус разработки и планируемые изменения.

.. _h4667253c17666b24497a21513330695a:

Установка пакета yandexmarketr
==============================

Установка пакета осуществляется из репозитория GitHub, для этого сначала требуется установить и подключить пакет devtools.

install.packages("devtools")

library(devtools)

После чего можно устанавливать пакет yandexmarketr.

install_github('mrykinpavel/yandexmarketr')

.. _h121f4345482c566e7d72177828b177d:

Функции пакета
==============

.. _h5fb171f5a56639226156450631b49:

getCampaigns(token, clientid) - 80% завершено
---------------------------------------------

Данная функция возвращает data.frame со списком всех кампаний доступных в аккаунте которому был выдан токен для доступа к API.

Структура data.frame, возвращаемого функцией getCampaigns:

|REPLACE1|

.. _h2c1d74277104e41780968148427e:




.. _h76232d20683f6a41334275b8019b3d:

Позже будут добавлены функции для получения данных:
===================================================

* \ |LINK1|\ 

* \ |LINK2|\ 

* \ |LINK3|\ 

* \ |LINK4|\ 

* \ |LINK5|\ 

* \ |LINK6|\ 

.. bottom of content


.. |REPLACE1| raw:: html

    <table cellspacing="0" cellpadding="0" style="width:100%">
    <tbody>
    <tr><td style="width:15%;color:#24292e;vertical-align:Top;padding-top:5px;padding-bottom:5px;padding-left:10px;padding-right:10px"><p style="color:#24292e;font-size:12px;margin-bottom:12"><span  style="color:#24292e;font-size:12px">Поле</span></p></td><td style="width:9%;color:#24292e;vertical-align:Top;padding-top:5px;padding-bottom:5px;padding-left:10px;padding-right:10px"><p style="color:#24292e;font-size:12px;margin-bottom:12"><span  style="color:#24292e;font-size:12px">Тип данных</span></p></td><td style="width:76%;color:#24292e;vertical-align:Top;padding-top:5px;padding-bottom:5px;padding-left:10px;padding-right:10px"><p style="color:#24292e;font-size:12px;margin-bottom:12"><span  style="color:#24292e;font-size:12px">Описание</span></p></td></tr>
    <tr><td style="color:#24292e;vertical-align:Top;padding-top:5px;padding-bottom:5px;padding-left:10px;padding-right:10px"><p style="color:#24292e;font-size:12px;margin-bottom:12"><span  style="color:#24292e;font-size:12px">shopid</span></p></td><td style="color:#24292e;vertical-align:Top;padding-top:5px;padding-bottom:5px;padding-left:10px;padding-right:10px"><p style="color:#24292e;font-size:12px;margin-bottom:12"><span  style="color:#24292e;font-size:12px">int</span></p></td><td style="color:#24292e;vertical-align:Top;padding-top:5px;padding-bottom:5px;padding-left:10px;padding-right:10px"><p style="color:#24292e;font-size:12px;margin-bottom:12"><span  style="color:#24292e;font-size:12px">Идентификатор кампании. В интерфейсе он выводится в формате 11-******. В API же используется часть после дефиса. Количество знаков после дефиса может отличаться и зависит от того, как давно вы зарегистрировали кампанию.</span></p></td></tr>
    <tr><td style="color:#24292e;vertical-align:Top;padding-top:5px;padding-bottom:5px;padding-left:10px;padding-right:10px"><p style="color:#24292e;font-size:12px;margin-bottom:12"><span  style="color:#24292e;font-size:12px">domain</span></p></td><td style="color:#24292e;vertical-align:Top;padding-top:5px;padding-bottom:5px;padding-left:10px;padding-right:10px"><p style="color:#24292e;font-size:12px;margin-bottom:12"><span  style="color:#24292e;font-size:12px">chr</span></p></td><td style="color:#24292e;vertical-align:Top;padding-top:5px;padding-bottom:5px;padding-left:10px;padding-right:10px"><p style="color:#24292e;font-size:12px;margin-bottom:12"><span  style="color:#24292e;font-size:12px">URL-адрес кампании</span></p></td></tr>
    <tr><td style="color:#24292e;vertical-align:Top;padding-top:5px;padding-bottom:5px;padding-left:10px;padding-right:10px"><p style="color:#24292e;font-size:12px;margin-bottom:12"><span  style="color:#24292e;font-size:12px">state</span></p></td><td style="color:#24292e;vertical-align:Top;padding-top:5px;padding-bottom:5px;padding-left:10px;padding-right:10px"><p style="color:#24292e;font-size:12px;margin-bottom:12"><span  style="color:#24292e;font-size:12px">Factor</span></p></td><td style="color:#24292e;vertical-align:Top;padding-top:5px;padding-bottom:5px;padding-left:10px;padding-right:10px"><p style="color:#24292e;font-size:12px;margin-bottom:12"><span  style="color:#24292e;font-size:12px">Статус Кампании</span></p><p style="color:#24292e;font-size:12px;margin-bottom:24"><span  style="color:#24292e;font-size:12px">Возможные значения:</span></p><p style="color:#24292e;font-size:12px;margin-bottom:24"><span  style="color:#24292e;font-size:12px">1 — кампания включена.<br/>2 — кампания выключена.<br/>3 — кампания включается.<br/>4 — кампания выключается.</span></p></td></tr>
    <tr><td style="color:#24292e;vertical-align:Top;padding-top:5px;padding-bottom:5px;padding-left:10px;padding-right:10px"><p style="color:#24292e;font-size:12px;margin-bottom:12"><span  style="color:#24292e;font-size:12px">prepayEnabled</span></p></td><td style="color:#24292e;vertical-align:Top;padding-top:5px;padding-bottom:5px;padding-left:10px;padding-right:10px"><p style="color:#24292e;font-size:12px;margin-bottom:12"><span  style="color:#24292e;font-size:12px">logi</span></p></td><td style="color:#24292e;vertical-align:Top;padding-top:5px;padding-bottom:5px;padding-left:10px;padding-right:10px"><p style="color:#24292e;font-size:12px;margin-bottom:24"><span  style="color:#24292e;font-size:12px">Предоплата при приеме заказов с Яндекс.Маркета.</span></p><p style="color:#24292e;font-size:12px;margin-bottom:24"><span  style="color:#24292e;font-size:12px">Возможные значения:</span></p><ul style="list-style:disc;list-style-image:inherit;padding:0px 40px;margin:initial"><li style="list-style:inherit;list-style-image:inherit"><span  style="color:#24292e;font-size:12px">false — предоплата включена.</span></li><li style="list-style:inherit;list-style-image:inherit"><span  style="color:#24292e;font-size:12px">true — предоплата отключена.</span></li></ul></td></tr>
    <tr><td style="color:#24292e;vertical-align:Top;padding-top:5px;padding-bottom:5px;padding-left:10px;padding-right:10px"><p style="color:#24292e;font-size:12px;margin-bottom:12"><span  style="color:#24292e;font-size:12px"><span style="font-weight:bold">stateCpa</span></span></p></td><td style="color:#24292e;vertical-align:Top;padding-top:5px;padding-bottom:5px;padding-left:10px;padding-right:10px"><p style="color:#24292e;font-size:12px;margin-bottom:12"><span  style="color:#24292e;font-size:12px">Factor</span></p></td><td style="vertical-align:Top;padding-top:5px;padding-bottom:5px;padding-left:10px;padding-right:10px"><p style="font-size:12px;margin-bottom:24"><span  style="font-size:12px">Статус программы «<a href="https://yandex.ru/support/partnermarket/purchase/about.html" target="_blank">Заказ на Маркете</a>» для кампании.</span></p><p style="color:#24292e;font-size:12px;margin-bottom:24"><span  style="color:#24292e;font-size:12px">Возможные значения:</span></p><ul style="list-style:disc;list-style-image:inherit;padding:0px 40px;margin:initial"><li style="list-style:inherit;list-style-image:inherit"><span  style="color:#24292e;font-size:12px">OFF — программа отключена.</span></li><li style="list-style:inherit;list-style-image:inherit"><span  style="color:#24292e;font-size:12px">ON — программа подключена.</span></li><li style="list-style:inherit;list-style-image:inherit"><span  style="color:#24292e;font-size:12px">SWITCHING_ON — программа в процессе подключения.</span></li></ul></td></tr>
    <tr><td style="color:#24292e;vertical-align:Top;padding-top:5px;padding-bottom:5px;padding-left:10px;padding-right:10px"><p style="color:#24292e;font-size:12px;margin-bottom:12"><span  style="color:#24292e;font-size:12px"><span style="font-weight:bold">stateCpa</span></span></p></td><td style="color:#24292e;vertical-align:Top;padding-top:5px;padding-bottom:5px;padding-left:10px;padding-right:10px"><p style="color:#24292e;font-size:12px;margin-bottom:12"></td><td style="color:#24292e;vertical-align:Top;padding-top:5px;padding-bottom:5px;padding-left:10px;padding-right:10px"><p style="color:#24292e;font-size:12px;margin-bottom:12"><span  style="color:#24292e;font-size:12px">Будет добавлена позже</span></p></td></tr>
    <tr><td style="color:#24292e;vertical-align:Top;padding-top:5px;padding-bottom:5px;padding-left:10px;padding-right:10px"><p style="color:#24292e;font-size:12px;margin-bottom:12"><span  style="color:#24292e;font-size:12px"><span style="font-weight:bold">stateCpa</span></span></p></td><td style="color:#24292e;vertical-align:Top;padding-top:5px;padding-bottom:5px;padding-left:10px;padding-right:10px"><p style="color:#24292e;font-size:12px;margin-bottom:12"></td><td style="color:#24292e;vertical-align:Top;padding-top:5px;padding-bottom:5px;padding-left:10px;padding-right:10px"><p style="color:#24292e;font-size:12px;margin-bottom:12"><span  style="color:#24292e;font-size:12px">Будет добавлена позже</span></p></td></tr>
    </tbody></table>


.. |LINK1| raw:: html

    <a href="https://tech.yandex.ru/market/partner/doc/dg/reference/get-campaigns-id-balance-docpage/" target="_blank">Баланс кампании</a>

.. |LINK2| raw:: html

    <a href="https://tech.yandex.ru/market/partner/doc/dg/reference/get-campaigns-id-stats-main-docpage/" target="_blank">Расход по периодам</a>

.. |LINK3| raw:: html

    <a href="https://tech.yandex.ru/market/partner/doc/dg/reference/get-campaigns-id-stats-offers-docpage/" target="_blank">Расход по предложениям</a>

.. |LINK4| raw:: html

    <a href="https://tech.yandex.ru/market/partner/doc/dg/reference/get-campaigns-id-settings-docpage/" target="_blank">Параметры кампании</a>

.. |LINK5| raw:: html

    <a href="https://tech.yandex.ru/market/partner/doc/dg/reference/outlet-methods-docpage/" target="_blank">Точки продаж</a>

.. |LINK6| raw:: html

    <a href="https://tech.yandex.ru/market/partner/doc/dg/reference/content-methods-docpage/" target="_blank">Список предложений для модели (конкурентная аналитика в карточках)</a>

