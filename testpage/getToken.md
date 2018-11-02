---
layout: default
title: getToken
permalink: /getTokenTest/
---

<script>
  function copyCode() {
    var copyText = document.getElementById("txt1");
    copyText.select();
    document.execCommand("copy");
  }
    
  window.onload = function() {
  document.getElementById('txt1').value = window.location.href.slice(window.location.href.indexOf('=') + 1, window.location.href.slice().length);}
</script>
  
  <h1><center>Авторизация для работы с API Яндекс.Маркет с помощью R клиента <b>yamarketr</b></center></h1>
    <h2><center>Ваш Код для получения токена:</center></h2>
    <div class="tok_style">
    <center>
    <p>
      <input type="text" value="в ссылке нет кода" id="txt1">
      </p><p>
      <button onclick="copyCode()">Скопировать код</button>
     </p>
    </center>
    </div>


  <footer class="site-footer">
    {% if site.github.is_project_page %}
      <span class="site-footer-owner"><a href="{{ site.github.repository_url }}">{{ site.github.repository_name }}</a> разработан и поддерживается <a href="https://facebook.com/mrykin.pavel" target="_blank">Павел Мрыкин</a>.
        </br><a href="https://www.mediaguru.ru/" target="_blank">MediaGuru</a>
      </span>
    {% endif %}
  </footer>

