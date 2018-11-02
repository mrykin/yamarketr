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
  
  <body>
    <section class="page-header">
      <h1 class="project-name">yamarketR</h1>
      <h2 class="project-tagline">Пакет для работы с Партнёрским API Яндекс.Маркета на языке R</h2>
      
        <a href="https://github.com/mrykin/yamarketr" class="btn">Посмотреть на GitHub</a>
      
      
    </section>

    <section class="main-content">
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
        
          <span class="site-footer-owner"><a href="https://github.com/mrykin/yamarketr">yamarketr</a> разработан и поддерживается <a href="https://facebook.com/mrykin.pavel" target="_blank">Павел Мрыкин</a>.
            </br><a href="https://www.mediaguru.ru/" target="_blank">MediaGuru</a>
            </span>
      </footer>
    </section>

    
  </body>
</html>
