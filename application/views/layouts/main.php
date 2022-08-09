<!DOCTYPE html>
<html lang="ru">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <link rel="shortcut icon" href="public/images/icons/cropped-гибббр1-270x270.jpg" type="image/x-icon" sizes="270x270" />
  <!-- Splide -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@4/dist/css/themes/splide-default.min.css" />
  <!-- Bootstrap -->
  <link rel="stylesheet" href="public/bootstrap/bootstrap.min.css" />
  <link rel="stylesheet" href="public/bootstrap/icons/bootstrap-icons.css" />
  <script src="public/bootstrap/bootstrap.bundle.min.js"></script>

  <link rel="stylesheet" href="public/styles/style.css" />

  <!-- <title>LeoSmagin: Главная страница</title> -->
  <title><?= $title ?></title>

  <script>
    function dd($el) {
      console.log($el)
    }
  </script>
</head>

<body>
  <div class="vh-wrapper">
    <!-- index_menu -->
    <div class="index_menu">
      <div class="container-lg">
        <nav class="navbar navbar-expand-sm navbar-dark">
          <div class="navbar-brand" href="#">
            <span class="mail d-none d-md-inline-block me-sm-4" data-bs-toggle="tooltip" id="menu-mail" data-bs-placement="bottom" title="Copy to clipboard" onclick="emailCpy(this)">leosmagin@gmail.com</span>
            <!--TRANSLATE-->
            <a href="#" class="bi bi-youtube"></a>
            <a href="#" class="bi bi-instagram"></a>
            <a href="#" class="bi bi-envelope"></a>
          </div>

          <div class="small_logo d-md-none" data-bs-toggle="collapse" data-bs-target="#mainMenu" aria-controls="mainMenu" aria-expanded="false" aria-label="Переключить">
            <a class="logo mx-sm-3"></a>
          </div>

          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainMenu" aria-controls="mainMenu" aria-expanded="false" aria-label="Переключить">
            <span class="bi bi-list"></span>
          </button>

          <div class="collapse navbar-collapse" id="mainMenu">
            <ul class="navbar-nav me-auto">
              <li class="nav-item active">
                <a class="nav-link" href="#">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="categoriesMenu" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Список</a>
                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="categoriesMenu">
                  <a class="dropdown-item" href="#">Action 1</a>
                  <a class="dropdown-item" href="#">Action 2</a>
                </div>
              </li>
            </ul>

            <div class="right d-flex my-2 my-lg-0 row justify-content-md-end justify-content-between">
              <div class="dropdown cart col-auto">
                <a class="bi bi-cart" type="button" id="triggerId" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <div class="quantity">9+</div>
                </a>

                <div class="dropdown-menu dropdown-menu-dark dropdown-menu-sm-end" aria-labelledby="triggerId">
                  <a class="dropdown-item" href="#">Action</a>
                  <a class="dropdown-item disabled" href="#">Disabled action</a>
                  <h6 class="dropdown-header">Section header</h6>
                  <a class="dropdown-item" href="#">Action</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="#">After divider action</a>
                </div>
              </div>

              <div class="dropdown language col-auto">
                <a class="bi bi-globe2" href="#" id="LangSwither" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" title="language"></a>
                <!-- translate language -->
                <div class="dropdown-menu dropdown-menu-end dropdown-menu-dark" aria-labelledby="LangSwither">
                  <h6 class="dropdown-header">Язык/Language</h6>
                  <div class="dropdown-item" href="#">
                    <img src="public/images/icons/rus.png" alt="" />Русский
                  </div>
                  <div class="dropdown-item" href="#">
                    <img src="public/images/icons/eng.png" alt="" />English
                  </div>
                </div>
              </div>
            </div>
          </div>
        </nav>
      </div>
    </div>
    <!-- Контент -->
    <?php echo $content; ?>
  </div>
  <!-- FOOTER -->
  <footer>
    <div class="container-lg py-4">
      <div class="row justify-content-center justify-content-md-between">
        <div class="col-12 col-sm-4 col-xl-4 my-3">
          <span>
            ©2020. All rights reserved.<br />
            Designed by leosmagin.com.
          </span>
        </div>
        <div class="col-12 col-sm-4 text-center references my-3">
          <div class="row justify-content-around">
            <div class="col-auto">
              <a href="">Гибрид</a><br />
              <a href="">Горилла</a><br />
              <a href="">Скат</a><br />
            </div>
            <div class="col-auto">
              <a href="">Вопросы</a><br />
              <a href="">Оплата</a><br />
              <a href="">Доставка</a><br />
              <a href="">Контакты</a>
            </div>
          </div>
        </div>

        <div class="col-12 col-sm-4 col-xl-4 persona text-end my-3">
          <p class="mb-3">ИП Смагин Леонид Павлович</p>
          <a class="e-mail">xyz@gmail.com</a>
          <div class="contacts mt-3">
            <a href="#" class="bi bi-youtube"></a>
            <a href="#" class="bi bi-instagram mx-2"></a>
            <a href="#" class="bi bi-envelope"></a>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <script>
    // dd("hello");
    var tooltipTriggerList = [].slice.call(
      document.querySelectorAll('[data-bs-toggle="tooltip"]')
    );
    var tooltipList = tooltipTriggerList.map(function(tooltipTriggerEl) {
      return new bootstrap.Tooltip(tooltipTriggerEl);
    });

    function emailCpy(Elem) {
      // dd(Elem);
      navigator.clipboard.writeText(Elem.innerText);
      tooltips = document.getElementsByClassName("tooltip");
      for (let item of tooltips) {
        // console.log(item);
        item.innerHTML =
          '<div class="tooltip-arrow" style=""></div><div class="tooltip-inner">Copied!</div>'; // TRANSLATE
        // TRANSLATE
      }
    }
  </script>

  <?php
  if (isset($script)) {
    if (is_string($script)) echo $script;
  }
  ?>
</body>

</html>