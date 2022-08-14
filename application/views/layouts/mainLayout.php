<!DOCTYPE html>
<html lang="<?= current($user)['lang'] ?>">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <link rel="shortcut icon" href="/public/images/icons/cropped-гибббр1-270x270.jpg" type="image/x-icon" sizes="270x270" />
  <!-- 
  <link rel="icon" href="https://leosmagin.com/wp-content/uploads/2019/03/cropped-гибббр1-32x32.jpg" sizes="32x32">
  <link rel="icon" href="https://leosmagin.com/wp-content/uploads/2019/03/cropped-гибббр1-192x192.jpg" sizes="192x192">
  <link rel="apple-touch-icon" href="https://leosmagin.com/wp-content/uploads/2019/03/cropped-гибббр1-180x180.jpg">
  <meta name="msapplication-TileImage"
    content="https://leosmagin.com/wp-content/uploads/2019/03/cropped-гибббр1-270x270.jpg">
   -->
  <!-- Splide -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@4/dist/css/themes/splide-default.min.css" />
  <!-- Bootstrap -->
  <link rel="stylesheet" href="/public/bootstrap/bootstrap.min.css" />
  <link rel="stylesheet" href="/public/bootstrap/icons/bootstrap-icons.css" />
  <script src="/public/bootstrap/bootstrap.bundle.min.js"></script>

  <link rel="stylesheet" href="/public/styles/style.css" />

  <!-- <title>LeoSmagin: Главная страница</title> -->
  <title><?= $title[current($user)['lang']] ?></title>

  <script>
    function dd($el) {
      console.log($el)
    }

    function number_format(number, decimals, dec_point, thousands_sep) {
      // Strip all characters but numerical ones.
      number = (number + '').replace(/[^0-9+\-Ee.]/g, '');
      var n = !isFinite(+number) ? 0 : +number,
        prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
        sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
        dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
        s = '',
        toFixedFix = function(n, prec) {
          var k = Math.pow(10, prec);
          return '' + Math.round(n * k) / k;
        };
      // Fix for IE parseFloat(0.55).toFixed(0) = 0;
      s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
      if (s[0].length > 3) {
        s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
      }
      if ((s[1] || '').length < prec) {
        s[1] = s[1] || '';
        s[1] += new Array(prec - s[1].length + 1).join('0');
      }
      return s.join(dec);
    }
    // Number.prototype.format = function(n, x, sep = ',') {
    // var re = '(\\d)(?=(\\d{' + (x || 3) + '})+' + (n > 0 ? '\\.' : '$') + ')';
    // return this.toFixed(Math.max(0, ~~n)).replace(new RegExp(re, 'g'), '$1' + sep);
    // }
    Number.prototype.format = function(decimals = '2', dec_point = '.', thousands_sep = ',') {
      return number_format(this, decimals, dec_point, thousands_sep);
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
            <span class="mail d-none d-md-inline-block me-sm-4" data-bs-toggle="tooltip" id="menu-mail" data-bs-placement="bottom" title="<?= current($user)['lang'] == 'EN' ? 'Copy to clipboard' : 'Скопировать' ?>" onclick="emailCpy(this)">leosmagin@gmail.com</span>
            <a href="#" class="bi bi-youtube"></a>
            <a href="#" class="bi bi-instagram"></a>
            <a href="#" class="bi bi-envelope"></a>
          </div>

          <div class="small_logo d-md-none">
            <a class="logo mx-sm-3" href="/"></a>
          </div>

          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainMenu" aria-controls="mainMenu" aria-expanded="false" aria-label="IndexToggleMenu">
            <span class="bi bi-list"></span>
          </button>

          <div class="collapse navbar-collapse" id="mainMenu">
            <ul class="navbar-nav me-auto">
              <li class="nav-item <?= $route['action'] == 'index' ? 'active' : '' ?>">
                <a class="nav-link <?= $route['action'] == 'index' ? 'disabled' : '' ?>" href="/"><?= current($user)['lang'] == 'EN' ? 'Home' : 'Главная' ?></a>
              </li>

              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="categoriesMenu" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><?= current($user)['lang'] == 'EN' ? 'Categories' : 'Категории' ?></a>
                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="categoriesMenu">
                  <!-- Категории -->
                  <? foreach ($categories as $cat_id => $cat_node) : ?>
                    <a class="dropdown-item" href="/catalog?category=<?= $cat_id ?>"><?= current($user)['lang'] == 'EN' ? $cat_node['name_en'] : $cat_node['name'] ?></a>
                  <? endforeach ?>
                </div>
              </li>
            </ul>
            <!-- Корзина -->
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
                <a class="bi bi-globe2" href="#" id="LangSwither" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" title="<?= current($user)['lang'] == 'EN' ? 'Language' : 'Язык' ?>"></a>
                <!-- translate language -->
                <div class="dropdown-menu dropdown-menu-end dropdown-menu-dark" aria-labelledby="LangSwither">
                  <h6 class="dropdown-header">Язык/Language</h6>
                  <? $_GET = array_merge($_GET, ['lang' => 'RU']);
                  $href_tmp = '?';
                  foreach ($_GET as $key => $value) {
                    $href_tmp .= "$key=$value&";
                  }
                  $href_tmp = substr($href_tmp, 0, -1);
                  ?>
                  <a class="dropdown-item" href="<?= $href_tmp ?>">
                    <img src="/public/images/icons/rus.png" alt="" />Русский
                  </a>
                  <? $_GET = array_merge($_GET, ['lang' => 'EN']);
                  $href_tmp = '?';
                  foreach ($_GET as $key => $value) {
                    $href_tmp .= "$key=$value&";
                  }
                  $href_tmp = substr($href_tmp, 0, -1);
                  ?>
                  <a class="dropdown-item" href="<?= $href_tmp ?>">
                    <img src="/public/images/icons/eng.png" alt="" />English
                  </a>
                </div>
              </div>
            </div>
          </div>
        </nav>
      </div>
    </div>
    <div class="fixed-top">
      <div class="index_menu">
        <div class="container-lg">
          <nav class="navbar navbar-expand-sm navbar-dark">
            <div class="navbar-brand" href="#">
              <span class="mail d-none d-md-inline-block me-sm-4" data-bs-toggle="tooltip" id="menu-mail" data-bs-placement="bottom" title="<?= current($user)['lang'] == 'EN' ? 'Copy to clipboard' : 'Скопировать' ?>" onclick="emailCpy(this)">leosmagin@gmail.com</span>
              <a href="#" class="bi bi-youtube"></a>
              <a href="#" class="bi bi-instagram"></a>
              <a href="#" class="bi bi-envelope"></a>
            </div>

            <div class="small_logo d-md-none">
              <a class="logo mx-sm-3" href="/"></a>
            </div>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainMenu" aria-controls="mainMenu" aria-expanded="false" aria-label="IndexToggleMenu">
              <span class="bi bi-list"></span>
            </button>

            <div class="collapse navbar-collapse" id="mainMenu">
              <ul class="navbar-nav me-auto">
                <li class="nav-item <?= $route['action'] == 'index' ? 'active' : '' ?>">
                  <a class="nav-link <?= $route['action'] == 'index' ? 'disabled' : '' ?>" href="/"><?= current($user)['lang'] == 'EN' ? 'Home' : 'Главная' ?></a>
                </li>

                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="categoriesMenu" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><?= current($user)['lang'] == 'EN' ? 'Categories' : 'Категории' ?></a>
                  <div class="dropdown-menu dropdown-menu-end" aria-labelledby="categoriesMenu">
                    <!-- Категории -->
                    <? foreach ($categories as $cat_id => $cat_node) : ?>
                      <a class="dropdown-item" href="/catalog?category=<?= $cat_id ?>"><?= current($user)['lang'] == 'EN' ? $cat_node['name_en'] : $cat_node['name'] ?></a>
                    <? endforeach ?>
                  </div>
                </li>
              </ul>
              <!-- Корзина -->
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
                  <a class="bi bi-globe2" href="#" id="LangSwither" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" title="<?= current($user)['lang'] == 'EN' ? 'Language' : 'Язык' ?>"></a>
                  <!-- translate language -->
                  <div class="dropdown-menu dropdown-menu-end dropdown-menu-dark" aria-labelledby="LangSwither">
                    <h6 class="dropdown-header">Язык/Language</h6>
                    <? $_GET = array_merge($_GET, ['lang' => 'RU']);
                    $href_tmp = '?';
                    foreach ($_GET as $key => $value) {
                      $href_tmp .= "$key=$value&";
                    }
                    $href_tmp = substr($href_tmp, 0, -1);
                    ?>
                    <a class="dropdown-item" href="<?= $href_tmp ?>">
                      <img src="/public/images/icons/rus.png" alt="" />Русский
                    </a>
                    <? $_GET = array_merge($_GET, ['lang' => 'EN']);
                    $href_tmp = '?';
                    foreach ($_GET as $key => $value) {
                      $href_tmp .= "$key=$value&";
                    }
                    $href_tmp = substr($href_tmp, 0, -1);
                    ?>
                    <a class="dropdown-item" href="<?= $href_tmp ?>">
                      <img src="/public/images/icons/eng.png" alt="" />English
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </nav>
        </div>
      </div>
      <!-- Ошибки и уведомления -->
      <?php if (isset($err)) : ?>
        <?php foreach ($err as $errstr) : ?>
          <div class="container-lg my-1 alert alert-danger alert-dismissible fade show" role="alert">
            <?= $errstr[current($user)['lang']] ?>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>

          </div>
        <?php endforeach ?>
      <?php endif ?>
      <?php if (isset($alerts)) : ?>
        <?php foreach ($alerts as $alert) : ?>
          <div class="container-lg my-1 alert alert-<?= $alert['type'] ?> alert-dismissible fade show" role="alert">
            <?= $alert[current($user)['lang']] ?>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
          </div>
        <?php endforeach ?>
      <?php endif ?>
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
              <? foreach ($categories as $cat_id => $cat_node) : ?>
                <a href="/catalog?category=<?= $cat_id ?>"><?= current($user)['lang'] == 'EN' ? $cat_node['name_en'] : $cat_node['name'] ?></a><br />
              <? endforeach ?>

            </div>
            <div class="col-auto">
              <a href=""><?= current($user)['lang'] == 'EN' ? 'FAQ' : 'Вопросы' ?></a><br />
              <a href=""><?= current($user)['lang'] == 'EN' ? 'Payment' : 'Оплата' ?></a><br />
              <a href=""><?= current($user)['lang'] == 'EN' ? 'Delivery' : 'Доставка' ?></a><br />
              <a href=""><?= current($user)['lang'] == 'EN' ? 'Contacts' : 'Контакты' ?></a>
            </div>
          </div>
        </div>

        <div class="col-12 col-sm-4 col-xl-4 persona text-end my-3">
          <p class="mb-3"><?= current($user)['lang'] == 'EN' ? 'Leonid Smagin' : 'Смагин Леонид Павлович' ?>
          <p>
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