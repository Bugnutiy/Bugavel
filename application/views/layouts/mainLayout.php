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
  <link rel="stylesheet" href="/public/styles/vendor/splide-default.min.css" />
  <!-- Bootstrap -->
  <link rel="stylesheet" href="/public/bootstrap/bootstrap.min.css" />
  <link rel="stylesheet" href="/public/bootstrap/icons/bootstrap-icons.css" />
  <script src="/public/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

  <link rel="stylesheet" href="/public/styles/style.css" />

  <!-- <title>LeoSmagin: Главная страница</title> -->
  <title><?= current($user)['lang'] == 'RU' ? $title['RU'] : $title['EN'] ?></title>

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
            <span class="mail d-none d-md-inline-block me-sm-4" data-bs-toggle="tooltip" id="menu-mail" data-bs-placement="bottom" title="<?= current($user)['lang'] !== 'RU' ? 'Copy to clipboard' : 'Скопировать' ?>" onclick="emailCpy(this)">leosmagin@gmail.com</span>
            <a href="https://www.youtube.com/channel/UCQj6BKoXZV6Adebuh4o9jOg/featured" class="bi bi-youtube"></a>
            <a href="https://www.instagram.com/hybridtattoomachine" class="bi bi-instagram"></a>
            <a href="mailto:info@leosmagin.com" class="bi bi-envelope"></a>
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
                <a class="nav-link <?= $route['action'] == 'index' ? 'disabled' : '' ?>" href="/"><?= current($user)['lang'] !== 'RU' ? 'Home' : 'Главная' ?></a>
              </li>

              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="categoriesMenu" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><?= current($user)['lang'] !== 'RU' ? 'Categories' : 'Категории' ?></a>
                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="categoriesMenu">
                  <!-- Категории -->
                  <? foreach ($categories as $cat_id => $cat_node) : ?>
                    <a class="dropdown-item" href="/catalog?category=<?= $cat_id ?>"><?= current($user)['lang'] !== 'RU' ? $cat_node['name_en'] : $cat_node['name'] ?></a>
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

                  <h6 class="dropdown-header"><?= current($user)['lang'] == 'RU' ? 'Корзина' : 'Your cart' ?></h6>
                  <a class="dropdown-item" href="#">Action</a>
                  <a class="dropdown-item disabled" href="#">Disabled action</a>
                  <h6 class="dropdown-header">Section header</h6>
                  <a class="dropdown-item" href="#">Action</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="#">After divider action</a>
                </div>
              </div>

              <div class="dropdown language col-auto">
                <a class="bi bi-globe2" href="#" id="LangSwither" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" title="<?= current($user)['lang'] !== 'RU' ? 'Language' : 'Язык' ?>"></a>
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
              <span class="mail d-none d-md-inline-block me-sm-4" data-bs-toggle="tooltip" id="menu-mail" data-bs-placement="bottom" title="<?= current($user)['lang'] !== 'RU' ? 'Copy to clipboard' : 'Скопировать' ?>" onclick="emailCpy(this)">leosmagin@gmail.com</span>
              <a href="https://www.youtube.com/channel/UCQj6BKoXZV6Adebuh4o9jOg/featured" class="bi bi-youtube"></a>
              <a href="https://www.instagram.com/hybridtattoomachine" class="bi bi-instagram"></a>
              <a href="mailto:info@leosmagin.com" class="bi bi-envelope"></a>
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
                  <a class="nav-link <?= $route['action'] == 'index' ? 'disabled' : '' ?>" href="/"><?= current($user)['lang'] !== 'RU' ? 'Home' : 'Главная' ?></a>
                </li>

                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="categoriesMenu" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><?= current($user)['lang'] !== 'RU' ? 'Categories' : 'Категории' ?></a>
                  <div class="dropdown-menu dropdown-menu-end" aria-labelledby="categoriesMenu">
                    <!-- Категории -->
                    <? foreach ($categories as $cat_id => $cat_node) : ?>
                      <a class="dropdown-item" href="/catalog?category=<?= $cat_id ?>"><?= current($user)['lang'] !== 'RU' ? $cat_node['name_en'] : $cat_node['name'] ?></a>
                    <? endforeach ?>
                  </div>
                </li>
              </ul>
              <!-- Корзина -->
              <div class="right d-flex my-2 my-lg-0 row justify-content-md-end justify-content-between">
                <div class="dropdown cart col-auto">
                  <a class="bi bi-cart" type="button" id="triggerId" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <? if (!empty($cart_total)) : ?>
                      <div class="quantity"><?= $cart_total['total_quantity'] > 9 ? '9+' : $cart_total['total_quantity'] ?></div>
                    <? endif ?>
                  </a>

                  <div class="dropdown-menu dropdown-menu-dark dropdown-menu-sm-end" aria-labelledby="triggerId" style="min-width: 15em">
                    <span class="dropdown-item-text small"><?= current($user)['lang'] == 'RU' ? 'Корзина' : 'Your cart' ?></span>
                    <div class="dropdown-divider"></div>
                    <? if (!empty($cart_total)) : ?>
                      <div class="dropdown-item-text">
                        <div class="row justify-content-between">
                          <div class="col-auto">
                            <?= current($user)['lang'] == 'RU' ? 'Итого:' : 'Total:' ?>
                          </div>
                          <div class="col-auto"><b>
                              <?= current($user)['country'] == 'RU' ? number_format($cart_total['total_price'], 0, ',', ' ') . ' руб.' : '$' . number_format($cart_total['total_price_en']) ?></b>
                          </div>
                        </div>
                        <div class="row justify-content-between">
                          <div class="col-auto">
                            <small><?= current($user)['lang'] == 'RU' ? 'Товаров:' : 'Total items:' ?></small>
                          </div>
                          <div class="col-auto"><small>
                              <b><?= $cart_total['total_quantity'] . (current($user)['lang'] == 'RU' ? ' шт.' : ' pcs') ?></b>
                            </small>
                          </div>
                        </div>
                      </div>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item text-center pb-2" href="#" data-bs-toggle="modal" data-bs-target="#indexOrderModal">
                        <?= current($user)['lang'] == 'RU' ? 'Оформить заказ' : 'Place an order' ?>
                      </a>

                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item text-center pb-2" href="/cart">
                        <?= current($user)['lang'] == 'RU' ? 'Открыть корзину' : 'Open cart' ?>
                      </a>
                    <? else : ?>
                      <div class="dropdown-item-text">
                        <?= current($user)['lang'] == 'RU' ? 'Ваша корзина пуста' : 'Your cart is empty' ?>
                      </div>
                    <? endif ?>
                  </div>
                </div>

                <div class="dropdown language col-auto">
                  <a class="bi bi-globe2" href="#" id="LangSwither" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" title="<?= current($user)['lang'] !== 'RU' ? 'Language' : 'Язык' ?>"></a>
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
            <?= $errstr[current($user)['lang'] == 'RU' ? 'RU' : 'EN'] ?>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>

          </div>
        <?php endforeach ?>
      <?php endif ?>
      <?php if (isset($alerts)) : ?>
        <?php foreach ($alerts as $alert) : ?>
          <div class="container-lg my-1 alert alert-<?= $alert['type'] ?> alert-dismissible fade show" role="alert">
            <?= $alert[current($user)['lang'] == 'RU' ? 'RU' : 'EN'] ?>
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
                <a href="/catalog?category=<?= $cat_id ?>"><?= current($user)['lang'] !== 'RU' ? $cat_node['name_en'] : $cat_node['name'] ?></a><br />
              <? endforeach ?>

            </div>
            <div class="col-auto">
              <a href=""><?= current($user)['lang'] !== 'RU' ? 'FAQ' : 'Вопросы' ?></a><br>
              <a href=""><?= current($user)['lang'] !== 'RU' ? 'Payment' : 'Оплата' ?></a><br>
              <a href=""><?= current($user)['lang'] !== 'RU' ? 'Delivery' : 'Доставка' ?></a><br>
              <a href=""><?= current($user)['lang'] !== 'RU' ? 'Contacts' : 'Контакты' ?></a><br>
              <? if (current($user)['role'] != 'guest') : ?>
                <!-- <a href="" class="mt-2 d-block"><?= current($user)['lang'] !== 'RU' ? 'Account' : 'Аккаунт' ?></a> -->
                <? if (isset($_SESSION['admin'])) : ?>
                  <a href="/admin/orders" class="mt-2 d-block"><?= current($user)['lang'] !== 'RU' ? 'Admin' : 'Админка' ?></a>
                <? endif ?>

              <? else : ?>
                <a type="button" class="mt-2 d-block" data-bs-toggle="modal" data-bs-target="#mainAccountModalLogin"><?= current($user)['lang'] !== 'RU' ? 'Account' : 'Аккаунт' ?></a>
              <? endif ?>
            </div>
          </div>
        </div>

        <div class="col-12 col-sm-4 col-xl-4 persona text-end my-3">
          <p class="mb-3"><?= current($user)['lang'] !== 'RU' ? 'Leonid Smagin' : 'Смагин Леонид Павлович' ?>
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
  <?
  // dd(current($user)['role']);
  if (current($user)['role'] != 'guest') : ?>
  <? else : ?>
    <!-- Log in -->
    <form action="?authorization=1" method="POST" enctype="multipart/form-data" class="modal fade" id="mainAccountModalLogin" tabindex="-1" aria-labelledby="mainAccountModalLoginLabel" aria-hidden="true">
      <div class="modal-dialog" style="max-width: 400px;">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="mainAccountModalLoginLabel"><?= current($user)['lang'] == 'RU' ? 'Авторизация' : 'Authorization' ?>/<a href="#" data-bs-toggle="modal" data-bs-target="#Register"><?= current($user)['lang'] == 'RU' ? 'Регистрация' : 'Registration' ?></a></h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="mb-3">
              <label for="Login" class="form-label required">E-mail</label>
              <input type="email" class="form-control" name="email" id="Login" placeholder="example@server.com" required>
            </div>
            <div class="mb-3">
              <label for="logpasswd" class="form-label"><?= current($user)['lang'] == 'RU' ? 'Пароль' : 'Password' ?></label>
              <input type="password" class="form-control" name="password" id="logpasswd" aria-describedby="forgot" placeholder="<?= current($user)['lang'] == 'RU' ? 'Пароль' : 'Password' ?>">
              <small id="forgot" class="form-text text-muted"><a href="#" data-bs-toggle="modal" data-bs-target="#ForgotPassword" class="form-text text-muted"><?= current($user)['lang'] == 'RU' ? 'Забыли пароль?' : 'Forgot your password?' ?></a></small>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><?= current($user)['lang'] == 'RU' ? 'Отмена' : 'Cancle' ?></button>
            <button type="success" class="btn btn-primary"><?= current($user)['lang'] == 'RU' ? 'Войти' : 'Log in' ?></button>
          </div>
        </div>
      </div>
    </form>

    <!-- Reset password -->
    <form action="?reset_password=1" method="POST" enctype="multipart/form-data" class="modal fade" id="ForgotPassword" tabindex="-1" role="dialog" aria-labelledby="ForgotPassword" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title"><?= current($user)['lang'] == 'RU' ? 'Сброс пароля' : 'Reset your password' ?></h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="">
              <label for="rEmail" class="form-label required">E-mail</label>
              <input type="email" required class="form-control" name="email" id="rEmail" placeholder="<?= current($user)['lang'] == 'RU' ? 'Введите вашу электронную почту' : 'Type your e-mail here' ?>">
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><?= current($user)['lang'] == 'RU' ? 'Отмена' : 'Cancle' ?></button>
            <button type="success" class="btn btn-primary"><?= current($user)['lang'] == 'RU' ? 'Сбросить пароль' : 'Reset password' ?></button>
          </div>
        </div>
      </div>
    </form>

    <!-- REGISTRATION -->
    <form action="?register=1" method="POST" enctype="multipart/form-data" class="modal fade" id="Register" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title"><?= current($user)['lang'] == 'RU' ? 'Регистрация' : 'Registration' ?></h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="row">
              <div class="mb-3 col-12 col-sm">
                <label for="first_name" class="form-label required">First name</label>
                <input type="text" required class="form-control" name="first_name" id="first_name" placeholder="<?= current($user)['lang'] == 'RU' ? 'Имя' : 'First name' ?>">
              </div>
              <div class="mb-3 col-12 col-sm">
                <label for="second_name" class="form-label required">Second name</label>

                <input type="text" required class="form-control" name="second_name" id="second_name" placeholder="<?= current($user)['lang'] == 'RU' ? 'Фамилия' : 'Second name' ?>">
              </div>
            </div>

            <!-- Email -->
            <div class="mb-3">
              <label for="email" class="form-label required">E-mail</label>
              <input type="email" required class="form-control" name="email" id="email" placeholder="<?= current($user)['lang'] == 'RU' ? 'Введите вашу электронную почту' : 'Type your e-mail here' ?>">
            </div>

            <!-- Password -->
            <div class="mb-3">
              <label for="password" class="form-label required"><?= current($user)['lang'] == 'RU' ? 'Пароль' : 'Password' ?></label>
              <input type="password" required class="form-control" name="password" id="password" placeholder="<?= current($user)['lang'] == 'RU' ? 'Пароль' : 'Password' ?>">
            </div>

            <!-- PHONE -->
            <div class="mb-3">
              <link rel="stylesheet" href="/public/intltel/css/intlTelInput.min.css">

              <label for="phone" class="form-label"><?= current($user)['lang'] == 'RU' ? 'Номер телефона' : 'Phone number' ?></label>
              <input type="tel" class="form-control" name="phone" id="phoneReg">
              <span id="valid-msg" class="d-none text-success">✓ Valid</span>
              <span id="error-msg" class="d-none text-danger"></span>

              <script src="/public/intltel/js/intlTelInput.js"></script>
              <script>
                var input = document.querySelector("#phoneReg"),
                  errorMsg = document.querySelector("#error-msg"),
                  validMsg = document.querySelector("#valid-msg");

                // here, the index maps to the error code returned from getValidationError - see readme
                <? if (current($user)['lang'] == 'RU') : ?>
                  var errorMap = ["Неверный номер", "Неверный код страны", "Слишком короткий", "Слишком длинный", "Неверный номер", "Неверный номер", "Неверный номер"];
                <? else : ?>
                  var errorMap = ["Invalid number", "Invalid country code", "Too short", "Too long", "Invalid number"];
                <? endif ?>

                // initialise plugin
                var iti = window.intlTelInput(input, {
                  utilsScript: "/public/intltel/js/utils.js"
                });

                var reset = function() {
                  input.classList.remove("error");
                  errorMsg.innerHTML = "";
                  errorMsg.classList.add("d-none");
                  validMsg.classList.add("d-none");
                };

                // on blur: validate
                input.addEventListener('blur', function() {
                  reset();
                  if (input.value.trim()) {
                    if (iti.isValidNumber()) {
                      validMsg.classList.remove("d-none");
                    } else {
                      input.classList.add("error");
                      var errorCode = iti.getValidationError();
                      errorMsg.innerHTML = errorMap[errorCode];
                      errorMsg.classList.remove("d-none");
                    }
                  }
                });

                // on keyup / change flag: reset
                input.addEventListener('change', reset);
                input.addEventListener('keyup', reset);
              </script>
            </div>

            <!-- Instagram -->
            <div class="mb-3">
              <label for="instagram" class="form-label"><?= current($user)['lang'] == 'RU' ? 'Аккаунт инстаграм (необязательно)' : 'Instagram account (optional)' ?></label>
              <input type="text" class="form-control" name="instagram" id="instagram" placeholder="<?= current($user)['lang'] == 'RU' ? 'Введите вашу электронную почту' : 'Type your e-mail here' ?>">
            </div>

            <!-- Country -->
            <div class="mb-3 country">
              <script src="https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.12.6/js/standalone/selectize.min.js" integrity="sha256-+C0A5Ilqmu4QcSPxrlGpaZxJ04VjsRjKu+G82kl5UJk=" crossorigin="anonymous"></script>
              <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.12.6/css/selectize.bootstrap3.min.css" integrity="sha256-ze/OEYGcFbPRmvCnrSeKbRTtjG4vGLHXgOqsyLFTRjg=" crossorigin="anonymous" />
              <? if (current($user)['lang'] == 'EN') : ?>
                <label for="billing_country" class="form-label">Country/Region</label>
                <select name="billing_country" id="billing_country" class="form-control country_select" autocomplete="country" data-placeholder="Select a country / region…" data-label="Country/Region" tabindex="-1" aria-hidden="true">
                  <option value="" hidden selected>Select a country / region…</option>
                  <option value="AF">Afghanistan</option>
                  <option value="AX">Åland Islands</option>
                  <option value="AL">Albania</option>
                  <option value="DZ">Algeria</option>
                  <option value="AS">American Samoa</option>
                  <option value="AD">Andorra</option>
                  <option value="AO">Angola</option>
                  <option value="AI">Anguilla</option>
                  <option value="AQ">Antarctica</option>
                  <option value="AG">Antigua and Barbuda</option>
                  <option value="AR">Argentina</option>
                  <option value="AM">Armenia</option>
                  <option value="AW">Aruba</option>
                  <option value="AU">Australia</option>
                  <option value="AT">Austria</option>
                  <option value="AZ">Azerbaijan</option>
                  <option value="BS">Bahamas</option>
                  <option value="BH">Bahrain</option>
                  <option value="BD">Bangladesh</option>
                  <option value="BB">Barbados</option>
                  <option value="BY">Belarus</option>
                  <option value="PW">Belau</option>
                  <option value="BE">Belgium</option>
                  <option value="BZ">Belize</option>
                  <option value="BJ">Benin</option>
                  <option value="BM">Bermuda</option>
                  <option value="BT">Bhutan</option>
                  <option value="BO">Bolivia</option>
                  <option value="BQ">Bonaire, Saint Eustatius and Saba</option>
                  <option value="BA">Bosnia and Herzegovina</option>
                  <option value="BW">Botswana</option>
                  <option value="BV">Bouvet Island</option>
                  <option value="BR">Brazil</option>
                  <option value="IO">British Indian Ocean Territory</option>
                  <option value="BN">Brunei</option>
                  <option value="BG">Bulgaria</option>
                  <option value="BF">Burkina Faso</option>
                  <option value="BI">Burundi</option>
                  <option value="KH">Cambodia</option>
                  <option value="CM">Cameroon</option>
                  <option value="CA">Canada</option>
                  <option value="CV">Cape Verde</option>
                  <option value="KY">Cayman Islands</option>
                  <option value="CF">Central African Republic</option>
                  <option value="TD">Chad</option>
                  <option value="CL">Chile</option>
                  <option value="CN">China</option>
                  <option value="CX">Christmas Island</option>
                  <option value="CC">Cocos (Keeling) Islands</option>
                  <option value="CO">Colombia</option>
                  <option value="KM">Comoros</option>
                  <option value="CG">Congo (Brazzaville)</option>
                  <option value="CD">Congo (Kinshasa)</option>
                  <option value="CK">Cook Islands</option>
                  <option value="CR">Costa Rica</option>
                  <option value="HR">Croatia</option>
                  <option value="CU">Cuba</option>
                  <option value="CW">Curaçao</option>
                  <option value="CY">Cyprus</option>
                  <option value="CZ">Czech Republic</option>
                  <option value="DK">Denmark</option>
                  <option value="DJ">Djibouti</option>
                  <option value="DM">Dominica</option>
                  <option value="DO">Dominican Republic</option>
                  <option value="EC">Ecuador</option>
                  <option value="EG">Egypt</option>
                  <option value="SV">El Salvador</option>
                  <option value="GQ">Equatorial Guinea</option>
                  <option value="ER">Eritrea</option>
                  <option value="EE">Estonia</option>
                  <option value="SZ">Eswatini</option>
                  <option value="ET">Ethiopia</option>
                  <option value="FK">Falkland Islands</option>
                  <option value="FO">Faroe Islands</option>
                  <option value="FJ">Fiji</option>
                  <option value="FI">Finland</option>
                  <option value="FR">France</option>
                  <option value="GF">French Guiana</option>
                  <option value="PF">French Polynesia</option>
                  <option value="TF">French Southern Territories</option>
                  <option value="GA">Gabon</option>
                  <option value="GM">Gambia</option>
                  <option value="GE">Georgia</option>
                  <option value="DE">Germany</option>
                  <option value="GH">Ghana</option>
                  <option value="GI">Gibraltar</option>
                  <option value="GR">Greece</option>
                  <option value="GL">Greenland</option>
                  <option value="GD">Grenada</option>
                  <option value="GP">Guadeloupe</option>
                  <option value="GU">Guam</option>
                  <option value="GT">Guatemala</option>
                  <option value="GG">Guernsey</option>
                  <option value="GN">Guinea</option>
                  <option value="GW">Guinea-Bissau</option>
                  <option value="GY">Guyana</option>
                  <option value="HT">Haiti</option>
                  <option value="HM">Heard Island and McDonald Islands</option>
                  <option value="HN">Honduras</option>
                  <option value="HK">Hong Kong</option>
                  <option value="HU">Hungary</option>
                  <option value="IS">Iceland</option>
                  <option value="IN">India</option>
                  <option value="ID">Indonesia</option>
                  <option value="IR">Iran</option>
                  <option value="IQ">Iraq</option>
                  <option value="IE">Ireland</option>
                  <option value="IM">Isle of Man</option>
                  <option value="IL">Israel</option>
                  <option value="IT">Italy</option>
                  <option value="CI">Ivory Coast</option>
                  <option value="JM">Jamaica</option>
                  <option value="JP">Japan</option>
                  <option value="JE">Jersey</option>
                  <option value="JO">Jordan</option>
                  <option value="KZ">Kazakhstan</option>
                  <option value="KE">Kenya</option>
                  <option value="KI">Kiribati</option>
                  <option value="KW">Kuwait</option>
                  <option value="KG">Kyrgyzstan</option>
                  <option value="LA">Laos</option>
                  <option value="LV">Latvia</option>
                  <option value="LB">Lebanon</option>
                  <option value="LS">Lesotho</option>
                  <option value="LR">Liberia</option>
                  <option value="LY">Libya</option>
                  <option value="LI">Liechtenstein</option>
                  <option value="LT">Lithuania</option>
                  <option value="LU">Luxembourg</option>
                  <option value="MO">Macao</option>
                  <option value="MG">Madagascar</option>
                  <option value="MW">Malawi</option>
                  <option value="MY">Malaysia</option>
                  <option value="MV">Maldives</option>
                  <option value="ML">Mali</option>
                  <option value="MT">Malta</option>
                  <option value="MH">Marshall Islands</option>
                  <option value="MQ">Martinique</option>
                  <option value="MR">Mauritania</option>
                  <option value="MU">Mauritius</option>
                  <option value="YT">Mayotte</option>
                  <option value="MX">Mexico</option>
                  <option value="FM">Micronesia</option>
                  <option value="MD">Moldova</option>
                  <option value="MC">Monaco</option>
                  <option value="MN">Mongolia</option>
                  <option value="ME">Montenegro</option>
                  <option value="MS">Montserrat</option>
                  <option value="MA">Morocco</option>
                  <option value="MZ">Mozambique</option>
                  <option value="MM">Myanmar</option>
                  <option value="NA">Namibia</option>
                  <option value="NR">Nauru</option>
                  <option value="NP">Nepal</option>
                  <option value="NL">Netherlands</option>
                  <option value="NC">New Caledonia</option>
                  <option value="NZ">New Zealand</option>
                  <option value="NI">Nicaragua</option>
                  <option value="NE">Niger</option>
                  <option value="NG">Nigeria</option>
                  <option value="NU">Niue</option>
                  <option value="NF">Norfolk Island</option>
                  <option value="KP">North Korea</option>
                  <option value="MK">North Macedonia</option>
                  <option value="MP">Northern Mariana Islands</option>
                  <option value="NO">Norway</option>
                  <option value="OM">Oman</option>
                  <option value="PK">Pakistan</option>
                  <option value="PS">Palestinian Territory</option>
                  <option value="PA">Panama</option>
                  <option value="PG">Papua New Guinea</option>
                  <option value="PY">Paraguay</option>
                  <option value="PE">Peru</option>
                  <option value="PH">Philippines</option>
                  <option value="PN">Pitcairn</option>
                  <option value="PL">Poland</option>
                  <option value="PT">Portugal</option>
                  <option value="PR">Puerto Rico</option>
                  <option value="QA">Qatar</option>
                  <option value="RE">Reunion</option>
                  <option value="RO">Romania</option>
                  <option value="RU">Russia</option>
                  <option value="RW">Rwanda</option>
                  <option value="BL">Saint Barthélemy</option>
                  <option value="SH">Saint Helena</option>
                  <option value="KN">Saint Kitts and Nevis</option>
                  <option value="LC">Saint Lucia</option>
                  <option value="SX">Saint Martin (Dutch part)</option>
                  <option value="MF">Saint Martin (French part)</option>
                  <option value="PM">Saint Pierre and Miquelon</option>
                  <option value="VC">Saint Vincent and the Grenadines</option>
                  <option value="WS">Samoa</option>
                  <option value="SM">San Marino</option>
                  <option value="ST">São Tomé and Príncipe</option>
                  <option value="SA">Saudi Arabia</option>
                  <option value="SN">Senegal</option>
                  <option value="RS">Serbia</option>
                  <option value="SC">Seychelles</option>
                  <option value="SL">Sierra Leone</option>
                  <option value="SG">Singapore</option>
                  <option value="SK">Slovakia</option>
                  <option value="SI">Slovenia</option>
                  <option value="SB">Solomon Islands</option>
                  <option value="SO">Somalia</option>
                  <option value="ZA">South Africa</option>
                  <option value="GS">South Georgia/Sandwich Islands</option>
                  <option value="KR">South Korea</option>
                  <option value="SS">South Sudan</option>
                  <option value="ES">Spain</option>
                  <option value="LK">Sri Lanka</option>
                  <option value="SD">Sudan</option>
                  <option value="SR">Suriname</option>
                  <option value="SJ">Svalbard and Jan Mayen</option>
                  <option value="SE">Sweden</option>
                  <option value="CH">Switzerland</option>
                  <option value="SY">Syria</option>
                  <option value="TW">Taiwan</option>
                  <option value="TJ">Tajikistan</option>
                  <option value="TZ">Tanzania</option>
                  <option value="TH">Thailand</option>
                  <option value="TL">Timor-Leste</option>
                  <option value="TG">Togo</option>
                  <option value="TK">Tokelau</option>
                  <option value="TO">Tonga</option>
                  <option value="TT">Trinidad and Tobago</option>
                  <option value="TN">Tunisia</option>
                  <option value="TR">Turkey</option>
                  <option value="TM">Turkmenistan</option>
                  <option value="TC">Turks and Caicos Islands</option>
                  <option value="TV">Tuvalu</option>
                  <option value="UG">Uganda</option>
                  <option value="UA">Ukraine</option>
                  <option value="AE">United Arab Emirates</option>
                  <option value="GB">United Kingdom (UK)</option>
                  <option value="US">United States (US)</option>
                  <option value="UM">United States (US) Minor Outlying Islands</option>
                  <option value="UY">Uruguay</option>
                  <option value="UZ">Uzbekistan</option>
                  <option value="VU">Vanuatu</option>
                  <option value="VA">Vatican</option>
                  <option value="VE">Venezuela</option>
                  <option value="VN">Vietnam</option>
                  <option value="VG">Virgin Islands (British)</option>
                  <option value="VI">Virgin Islands (US)</option>
                  <option value="WF">Wallis and Futuna</option>
                  <option value="EH">Western Sahara</option>
                  <option value="YE">Yemen</option>
                  <option value="ZM">Zambia</option>
                  <option value="ZW">Zimbabwe</option>
                </select>
              <? else : ?>
                <label for="billing_country" class="form-label">Страна/Регион</label>
                <select name="billing_country" id="billing_country" class="form-control country_select" autocomplete="country" data-placeholder="Выберите страну/регион…" data-label="Страна/регион" tabindex="-1" aria-hidden="true">
                  <option value="" hidden>Выберите страну/регион…</option>
                  <option value="SZ">Eswatini</option>
                  <option value="AU">Австралия</option>
                  <option value="AT">Австрия</option>
                  <option value="AZ">Азербайджан</option>
                  <option value="AX">Аландские острова</option>
                  <option value="AL">Албания</option>
                  <option value="DZ">Алжир</option>
                  <option value="AS">Американское Самоа</option>
                  <option value="AI">Ангилья</option>
                  <option value="AO">Ангола</option>
                  <option value="AD">Андорра</option>
                  <option value="AQ">Антарктика</option>
                  <option value="AG">Антигуа и Барбуда</option>
                  <option value="AR">Аргентина</option>
                  <option value="AM">Армения</option>
                  <option value="AW">Аруба</option>
                  <option value="AF">Афганистан</option>
                  <option value="BS">Багамы</option>
                  <option value="BD">Бангладеш</option>
                  <option value="BB">Барбадос</option>
                  <option value="BH">Бахрейн</option>
                  <option value="BY">Беларусь</option>
                  <option value="BZ">Белиз</option>
                  <option value="BE">Бельгия</option>
                  <option value="BJ">Бенин</option>
                  <option value="BM">Бермуды</option>
                  <option value="BG">Болгария</option>
                  <option value="BO">Боливия</option>
                  <option value="BQ">Бонайре, Синт-Эстатиус и Саба</option>
                  <option value="BA">Босния и Герцеговина</option>
                  <option value="BW">Ботсвана</option>
                  <option value="BR">Бразилия</option>
                  <option value="IO">Британская Территория в Индийском Океане</option>
                  <option value="VG">Британские Виргинские острова</option>
                  <option value="BN">Бруней</option>
                  <option value="BF">Буркина-Фасо</option>
                  <option value="BI">Бурунди</option>
                  <option value="BT">Бутан</option>
                  <option value="VU">Вануату</option>
                  <option value="VA">Ватикан</option>
                  <option value="GB">Великобритания</option>
                  <option value="HU">Венгрия</option>
                  <option value="VE">Венесуэла</option>
                  <option value="VI">Виргинские острова (США)</option>
                  <option value="UM">Внешние малые острова США</option>
                  <option value="TL">Восточный Тимор</option>
                  <option value="VN">Вьетнам</option>
                  <option value="GA">Габон</option>
                  <option value="HT">Гаити</option>
                  <option value="GY">Гайана</option>
                  <option value="GM">Гамбия</option>
                  <option value="GH">Гана</option>
                  <option value="GP">Гваделупа</option>
                  <option value="GT">Гватемала</option>
                  <option value="GN">Гвинея</option>
                  <option value="GW">Гвинея-Бисау</option>
                  <option value="DE">Германия</option>
                  <option value="GG">Гернси</option>
                  <option value="GI">Гибралтар</option>
                  <option value="HN">Гондурас</option>
                  <option value="HK">Гонконг</option>
                  <option value="GD">Гренада</option>
                  <option value="GL">Гренландия</option>
                  <option value="GR">Греция</option>
                  <option value="GE">Грузия</option>
                  <option value="GU">Гуам</option>
                  <option value="DK">Дания</option>
                  <option value="JE">Джерси</option>
                  <option value="DJ">Джибути</option>
                  <option value="DM">Доминика</option>
                  <option value="DO">Доминиканская Республика</option>
                  <option value="EG">Египет</option>
                  <option value="ZM">Замбия</option>
                  <option value="EH">Западная Сахара</option>
                  <option value="ZW">Зимбабве</option>
                  <option value="IL">Израиль</option>
                  <option value="IN">Индия</option>
                  <option value="ID">Индонезия</option>
                  <option value="JO">Иордания</option>
                  <option value="IQ">Ирак</option>
                  <option value="IR">Иран</option>
                  <option value="IE">Ирландия</option>
                  <option value="IS">Исландия</option>
                  <option value="ES">Испания</option>
                  <option value="IT">Италия</option>
                  <option value="YE">Йемен</option>
                  <option value="CV">Кабо-Верде</option>
                  <option value="KZ">Казахстан</option>
                  <option value="KY">Кайманские острова</option>
                  <option value="KH">Камбоджа</option>
                  <option value="CM">Камерун</option>
                  <option value="CA">Канада</option>
                  <option value="QA">Катар</option>
                  <option value="KE">Кения</option>
                  <option value="CY">Кипр</option>
                  <option value="KI">Кирибати</option>
                  <option value="CN">Китай</option>
                  <option value="CC">Кокосовые (Килинг) острова</option>
                  <option value="CO">Колумбия</option>
                  <option value="KM">Коморы</option>
                  <option value="CG">Конго (Браззавиль)</option>
                  <option value="CD">Конго (Киншаса)</option>
                  <option value="CR">Коста-Рика</option>
                  <option value="CI">Кот-д'Ивуар</option>
                  <option value="CU">Куба</option>
                  <option value="KW">Кувейт</option>
                  <option value="KG">Кыргызстан</option>
                  <option value="CW">Кюрасао</option>
                  <option value="LA">Лаос</option>
                  <option value="LV">Латвия</option>
                  <option value="LS">Лесото</option>
                  <option value="LR">Либерия</option>
                  <option value="LB">Ливан</option>
                  <option value="LY">Ливия</option>
                  <option value="LT">Литва</option>
                  <option value="LI">Лихтенштейн</option>
                  <option value="LU">Люксембург</option>
                  <option value="MU">Маврикий</option>
                  <option value="MR">Мавритания</option>
                  <option value="MG">Мадагаскар</option>
                  <option value="YT">Майотта</option>
                  <option value="MO">Макао</option>
                  <option value="MW">Малави</option>
                  <option value="MY">Малайзия</option>
                  <option value="ML">Мали</option>
                  <option value="MV">Мальдивы</option>
                  <option value="MT">Мальта</option>
                  <option value="MA">Марокко</option>
                  <option value="MQ">Мартиника</option>
                  <option value="MH">Маршалловы острова</option>
                  <option value="MX">Мексика</option>
                  <option value="FM">Микронезия</option>
                  <option value="MZ">Мозамбик</option>
                  <option value="MD">Молдова</option>
                  <option value="MC">Монако</option>
                  <option value="MN">Монголия</option>
                  <option value="MS">Монсеррат</option>
                  <option value="MM">Мьянма</option>
                  <option value="NA">Намибия</option>
                  <option value="NR">Науру</option>
                  <option value="NP">Непал</option>
                  <option value="NE">Нигер</option>
                  <option value="NG">Нигерия</option>
                  <option value="NL">Нидерланды</option>
                  <option value="NI">Никарагуа</option>
                  <option value="NU">Ниуэ</option>
                  <option value="NZ">Новая Зеландия</option>
                  <option value="NC">Новая Каледония</option>
                  <option value="NO">Норвегия</option>
                  <option value="AE">Объединённые Арабские Эмираты</option>
                  <option value="OM">Оман</option>
                  <option value="BV">Остров Буве</option>
                  <option value="IM">Остров Мэн</option>
                  <option value="NF">Остров Норфолк</option>
                  <option value="CX">Остров Рождества</option>
                  <option value="SH">Остров Святой Елены</option>
                  <option value="HM">Остров Херд и острова Макдональд</option>
                  <option value="CK">Острова Кука</option>
                  <option value="PK">Пакистан</option>
                  <option value="PW">Палау</option>
                  <option value="PS">Палестинские территории</option>
                  <option value="PA">Панама</option>
                  <option value="PG">Папуа-Новая Гвинея</option>
                  <option value="PY">Парагвай</option>
                  <option value="PE">Перу</option>
                  <option value="PN">Питкэрн</option>
                  <option value="PL">Польша</option>
                  <option value="PT">Португалия</option>
                  <option value="PR">Пуэрто-Рико</option>
                  <option value="RE">Реюньон</option>
                  <option value="RU" selected="selected">Россия</option>
                  <option value="RW">Руанда</option>
                  <option value="RO">Румыния</option>
                  <option value="US">США</option>
                  <option value="SV">Сальвадор</option>
                  <option value="WS">Самоа</option>
                  <option value="SM">Сан-Марино</option>
                  <option value="ST">Сан-Томе и Принсипи</option>
                  <option value="SA">Саудовская Аравия</option>
                  <option value="KP">Северная Корея</option>
                  <option value="MK">Северная Македония</option>
                  <option value="MP">Северные Марианские острова</option>
                  <option value="SC">Сейшельские Острова</option>
                  <option value="BL">Сен-Бартелеми</option>
                  <option value="SX">Сен-Мартен (Нидерл.)</option>
                  <option value="MF">Сен-Мартен (Фр.)</option>
                  <option value="PM">Сен-Пьер и Микелон</option>
                  <option value="SN">Сенегал</option>
                  <option value="VC">Сент-Винсент и Гренадины</option>
                  <option value="KN">Сент-Китс и Невис</option>
                  <option value="LC">Сент-Люсия</option>
                  <option value="RS">Сербия</option>
                  <option value="SG">Сингапур</option>
                  <option value="SY">Сирия</option>
                  <option value="SK">Словакия</option>
                  <option value="SI">Словения</option>
                  <option value="SB">Соломоновы Острова</option>
                  <option value="SO">Сомали</option>
                  <option value="SD">Судан</option>
                  <option value="SR">Суринам</option>
                  <option value="SL">Сьерра-Леоне</option>
                  <option value="TJ">Таджикистан</option>
                  <option value="TW">Тайвань</option>
                  <option value="TH">Тайланд</option>
                  <option value="TZ">Танзания</option>
                  <option value="TC">Теркс и Кайкос</option>
                  <option value="TG">Того</option>
                  <option value="TK">Токелау</option>
                  <option value="TO">Тонга</option>
                  <option value="TT">Тринидад и Тобаго</option>
                  <option value="TV">Тувалу</option>
                  <option value="TN">Тунис</option>
                  <option value="TM">Туркменистан</option>
                  <option value="TR">Турция</option>
                  <option value="UG">Уганда</option>
                  <option value="UZ">Узбекистан</option>
                  <option value="UA">Украина</option>
                  <option value="WF">Уоллис и Футуна</option>
                  <option value="UY">Уругвай</option>
                  <option value="FO">Фарерские острова</option>
                  <option value="FJ">Фиджи</option>
                  <option value="PH">Филиппины</option>
                  <option value="FI">Финляндия</option>
                  <option value="FK">Фолклендские острова</option>
                  <option value="FR">Франция</option>
                  <option value="GF">Французская Гвиана</option>
                  <option value="PF">Французская Полинезия</option>
                  <option value="TF">Французские южные территории</option>
                  <option value="HR">Хорватия</option>
                  <option value="CF">Центральная Африканская Республика</option>
                  <option value="TD">Чад</option>
                  <option value="ME">Черногория</option>
                  <option value="CZ">Чешская Республика</option>
                  <option value="CL">Чили</option>
                  <option value="CH">Швейцария</option>
                  <option value="SE">Швеция</option>
                  <option value="SJ">Шпицберген и Ян-Майен</option>
                  <option value="LK">Шри-Ланка</option>
                  <option value="EC">Эквадор</option>
                  <option value="GQ">Экваториальная Гвинея</option>
                  <option value="ER">Эритрея</option>
                  <option value="EE">Эстония</option>
                  <option value="ET">Эфиопия</option>
                  <option value="ZA">Южная Африка</option>
                  <option value="GS">Южная Георгия/Сандвичевы острова</option>
                  <option value="KR">Южная Корея</option>
                  <option value="SS">Южный Судан</option>
                  <option value="JM">Ямайка</option>
                  <option value="JP">Япония</option>
                </select>
              <? endif ?>
              <script type="text/javascript">
                $(document).ready(function() {
                  $('#billing_country').selectize({
                    sortField: 'text'
                  });
                });
              </script>
            </div>
            <!-- Address -->
            <div class="mb-3">
              <label for="address" class="form-label "><?= current($user)['lang'] == 'RU' ? 'Адрес' : 'Street Address' ?></label>
              <input type="text" class="form-control" name="address" id="address" placeholder="<?= current($user)['lang'] == 'RU' ? 'Номер дома и название улицы' : 'House number and street name' ?>">
              <input type="text" class="form-control" name="apartment" id="apartment" placeholder="<?= current($user)['lang'] == 'RU' ? 'Крыло, подъезд, этаж и т.д. (необязательно)' : 'Apartment, suite, unit, etc. (optional)' ?>">
            </div>

            <!-- City -->
            <div class="mb-3">
              <label for="city" class="form-label "><?= current($user)['lang'] == 'RU' ? 'Адрес' : 'Street Address' ?></label>
              <input type="text" class="form-control" name="city" id="city" placeholder="<?= current($user)['lang'] == 'RU' ? 'Город / Населенный пункт' : 'Town / City' ?>">

            </div>
            <!-- Region/State -->
            <div class="mb-3">
              <label for="region" class="form-label "><?= current($user)['lang'] == 'RU' ? 'Регион / Область' : 'Region / State / District' ?></label>
              <input type="text" class="form-control" name="region" id="region" placeholder="<?= current($user)['lang'] == 'RU' ? 'Регион / Область' : 'Region / State / District' ?>">
            </div>

            <!-- Postcode / ZIP (optional) -->
            <div class="mb-3">
              <label for="zip_code" class="form-label"><?= current($user)['lang'] == 'RU' ? 'Почтовый индекс (необязательно)' : 'Postcode / ZIP (optional)' ?></label>
              <input type="text" class="form-control" name="zip_code" id="zip_code" placeholder="<?= current($user)['lang'] == 'RU' ? 'Почтовый индекс (необязательно)' : 'Postcode / ZIP (optional)' ?>">
            </div>
            <!-- Additions -->
            <div class="mb-3 d-none">
              <label for="additions" class="form-label"><?= current($user)['lang'] == 'RU' ? 'Примечание к заказу (необязательно)' : 'Order notes (optional)' ?></label>

              <textarea name="additions" class="form-control" id="additions" cols="30" rows="10" placeholder="<?= current($user)['lang'] == 'RU' ? 'Примечания к вашему заказу, например, особые пожелания отделу доставки.' : 'Notes about your order, e.g. special notes for delivery.' ?>"></textarea>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><?= current($user)['lang'] == 'RU' ? 'Отмена' : 'Cancle' ?></button>
            <button type="success" class="btn btn-primary"><?= current($user)['lang'] == 'RU' ? 'Зарегистрироваться' : 'Register' ?></button>
          </div>
        </div>
      </div>
    </form>


  <? endif ?>
  <!-- PLACE AN ORDER -->
  <form action="?order=1" method="POST" enctype="multipart/form-data" class="modal fade" id="indexOrderModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title"><?= current($user)['lang'] == 'RU' ? 'Оформление заказа' : 'Place order' ?></h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="mb-3 col-12 col-sm">
              <label for="order_first_name" class="form-label required">First name</label>
              <input type="text" required class="form-control" name="first_name" id="order_first_name" placeholder="<?= current($user)['lang'] == 'RU' ? 'Имя' : 'First name' ?>" value="<?= current($user)['first_name'] ?>">
            </div>
            <div class="mb-3 col-12 col-sm">
              <label for="order_second_name" class="form-label required">Second name</label>

              <input type="text" required class="form-control" name="second_name" id="order_second_name" placeholder="<?= current($user)['lang'] == 'RU' ? 'Фамилия' : 'Second name' ?>" value="<?= current($user)['second_name'] ?>">
            </div>
          </div>

          <!-- Email -->
          <div class="mb-3">
            <label for="order_email" class="form-label required">E-mail</label>
            <input type="email" required class="form-control" name="email" id="order_email" placeholder="<?= current($user)['lang'] == 'RU' ? 'Введите вашу электронную почту' : 'Type your e-mail here' ?>" value="<?= current($user)['email'] ?>">
          </div>

          <!-- PHONE -->
          <div class="mb-3 phone">
            <link rel="stylesheet" href="/public/intltel/css/intlTelInput.min.css">

            <label for="order_phone" class="form-label required"><?= current($user)['lang'] == 'RU' ? 'Номер телефона' : 'Phone number' ?></label>
            <input type="tel" class="form-control" name="phone" id="order_phone" required value="<?= current($user)['phone'] ?>">
            <span id="order_valid-msg" class="d-none text-success">✓ Valid</span>
            <span id="order_error-msg" class="d-none text-danger"></span>

            <script src="/public/intltel/js/intlTelInput.js"></script>
            <script>
              var input = document.querySelector("#order_phone"),
                errorMsg = document.querySelector("#order_error-msg"),
                validMsg = document.querySelector("#order_valid-msg");

              // here, the index maps to the error code returned from getValidationError - see readme
              <? if (current($user)['lang'] == 'RU') : ?>
                var errorMap = ["Неверный номер", "Неверный код страны", "Слишком короткий", "Слишком длинный", "Неверный номер", "Неверный номер", "Неверный номер"];
              <? else : ?>
                var errorMap = ["Invalid number", "Invalid country code", "Too short", "Too long", "Invalid number"];
              <? endif ?>

              // initialise plugin
              var iti = window.intlTelInput(input, {
                utilsScript: "/public/intltel/js/utils.js"
              });

              var reset = function() {
                input.classList.remove("error");
                errorMsg.innerHTML = "";
                errorMsg.classList.add("d-none");
                validMsg.classList.add("d-none");
              };

              // on blur: validate
              input.addEventListener('blur', function() {
                reset();
                if (input.value.trim()) {
                  if (iti.isValidNumber()) {
                    validMsg.classList.remove("d-none");
                  } else {
                    input.classList.add("error");
                    var errorCode = iti.getValidationError();
                    errorMsg.innerHTML = errorMap[errorCode];
                    errorMsg.classList.remove("d-none");
                  }
                }
              });

              // on keyup / change flag: reset
              input.addEventListener('change', reset);
              input.addEventListener('keyup', reset);
            </script>
          </div>

          <!-- Instagram -->
          <div class="mb-3">
            <label for="order_instagram" class="form-label"><?= current($user)['lang'] == 'RU' ? 'Аккаунт инстаграм (необязательно)' : 'Instagram account (optional)' ?></label>
            <input type="text" class="form-control" name="instagram" id="order_instagram" placeholder="instagram" value="<?= current($user)['instagram'] ?>">
          </div>

          <!-- Country -->
          <div class="mb-3 country">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.12.6/js/standalone/selectize.min.js" integrity="sha256-+C0A5Ilqmu4QcSPxrlGpaZxJ04VjsRjKu+G82kl5UJk=" crossorigin="anonymous"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.12.6/css/selectize.bootstrap3.min.css" integrity="sha256-ze/OEYGcFbPRmvCnrSeKbRTtjG4vGLHXgOqsyLFTRjg=" crossorigin="anonymous" />
            <? if (current($user)['lang'] == 'EN') : ?>
              <label for="billing_country" class="form-label required">Country/Region</label>
              <select name="billing_country" required id="order_billing_country" class="form-control country_select" autocomplete="country" data-placeholder="Select a country / region…" data-label="Country/Region" tabindex="-1" aria-hidden="true" value="<?= current($user)['billing_country'] ?>">
                <option value="" hidden selected>Select a country / region…</option>
                <option value="AF">Afghanistan</option>
                <option value="AX">Åland Islands</option>
                <option value="AL">Albania</option>
                <option value="DZ">Algeria</option>
                <option value="AS">American Samoa</option>
                <option value="AD">Andorra</option>
                <option value="AO">Angola</option>
                <option value="AI">Anguilla</option>
                <option value="AQ">Antarctica</option>
                <option value="AG">Antigua and Barbuda</option>
                <option value="AR">Argentina</option>
                <option value="AM">Armenia</option>
                <option value="AW">Aruba</option>
                <option value="AU">Australia</option>
                <option value="AT">Austria</option>
                <option value="AZ">Azerbaijan</option>
                <option value="BS">Bahamas</option>
                <option value="BH">Bahrain</option>
                <option value="BD">Bangladesh</option>
                <option value="BB">Barbados</option>
                <option value="BY">Belarus</option>
                <option value="PW">Belau</option>
                <option value="BE">Belgium</option>
                <option value="BZ">Belize</option>
                <option value="BJ">Benin</option>
                <option value="BM">Bermuda</option>
                <option value="BT">Bhutan</option>
                <option value="BO">Bolivia</option>
                <option value="BQ">Bonaire, Saint Eustatius and Saba</option>
                <option value="BA">Bosnia and Herzegovina</option>
                <option value="BW">Botswana</option>
                <option value="BV">Bouvet Island</option>
                <option value="BR">Brazil</option>
                <option value="IO">British Indian Ocean Territory</option>
                <option value="BN">Brunei</option>
                <option value="BG">Bulgaria</option>
                <option value="BF">Burkina Faso</option>
                <option value="BI">Burundi</option>
                <option value="KH">Cambodia</option>
                <option value="CM">Cameroon</option>
                <option value="CA">Canada</option>
                <option value="CV">Cape Verde</option>
                <option value="KY">Cayman Islands</option>
                <option value="CF">Central African Republic</option>
                <option value="TD">Chad</option>
                <option value="CL">Chile</option>
                <option value="CN">China</option>
                <option value="CX">Christmas Island</option>
                <option value="CC">Cocos (Keeling) Islands</option>
                <option value="CO">Colombia</option>
                <option value="KM">Comoros</option>
                <option value="CG">Congo (Brazzaville)</option>
                <option value="CD">Congo (Kinshasa)</option>
                <option value="CK">Cook Islands</option>
                <option value="CR">Costa Rica</option>
                <option value="HR">Croatia</option>
                <option value="CU">Cuba</option>
                <option value="CW">Curaçao</option>
                <option value="CY">Cyprus</option>
                <option value="CZ">Czech Republic</option>
                <option value="DK">Denmark</option>
                <option value="DJ">Djibouti</option>
                <option value="DM">Dominica</option>
                <option value="DO">Dominican Republic</option>
                <option value="EC">Ecuador</option>
                <option value="EG">Egypt</option>
                <option value="SV">El Salvador</option>
                <option value="GQ">Equatorial Guinea</option>
                <option value="ER">Eritrea</option>
                <option value="EE">Estonia</option>
                <option value="SZ">Eswatini</option>
                <option value="ET">Ethiopia</option>
                <option value="FK">Falkland Islands</option>
                <option value="FO">Faroe Islands</option>
                <option value="FJ">Fiji</option>
                <option value="FI">Finland</option>
                <option value="FR">France</option>
                <option value="GF">French Guiana</option>
                <option value="PF">French Polynesia</option>
                <option value="TF">French Southern Territories</option>
                <option value="GA">Gabon</option>
                <option value="GM">Gambia</option>
                <option value="GE">Georgia</option>
                <option value="DE">Germany</option>
                <option value="GH">Ghana</option>
                <option value="GI">Gibraltar</option>
                <option value="GR">Greece</option>
                <option value="GL">Greenland</option>
                <option value="GD">Grenada</option>
                <option value="GP">Guadeloupe</option>
                <option value="GU">Guam</option>
                <option value="GT">Guatemala</option>
                <option value="GG">Guernsey</option>
                <option value="GN">Guinea</option>
                <option value="GW">Guinea-Bissau</option>
                <option value="GY">Guyana</option>
                <option value="HT">Haiti</option>
                <option value="HM">Heard Island and McDonald Islands</option>
                <option value="HN">Honduras</option>
                <option value="HK">Hong Kong</option>
                <option value="HU">Hungary</option>
                <option value="IS">Iceland</option>
                <option value="IN">India</option>
                <option value="ID">Indonesia</option>
                <option value="IR">Iran</option>
                <option value="IQ">Iraq</option>
                <option value="IE">Ireland</option>
                <option value="IM">Isle of Man</option>
                <option value="IL">Israel</option>
                <option value="IT">Italy</option>
                <option value="CI">Ivory Coast</option>
                <option value="JM">Jamaica</option>
                <option value="JP">Japan</option>
                <option value="JE">Jersey</option>
                <option value="JO">Jordan</option>
                <option value="KZ">Kazakhstan</option>
                <option value="KE">Kenya</option>
                <option value="KI">Kiribati</option>
                <option value="KW">Kuwait</option>
                <option value="KG">Kyrgyzstan</option>
                <option value="LA">Laos</option>
                <option value="LV">Latvia</option>
                <option value="LB">Lebanon</option>
                <option value="LS">Lesotho</option>
                <option value="LR">Liberia</option>
                <option value="LY">Libya</option>
                <option value="LI">Liechtenstein</option>
                <option value="LT">Lithuania</option>
                <option value="LU">Luxembourg</option>
                <option value="MO">Macao</option>
                <option value="MG">Madagascar</option>
                <option value="MW">Malawi</option>
                <option value="MY">Malaysia</option>
                <option value="MV">Maldives</option>
                <option value="ML">Mali</option>
                <option value="MT">Malta</option>
                <option value="MH">Marshall Islands</option>
                <option value="MQ">Martinique</option>
                <option value="MR">Mauritania</option>
                <option value="MU">Mauritius</option>
                <option value="YT">Mayotte</option>
                <option value="MX">Mexico</option>
                <option value="FM">Micronesia</option>
                <option value="MD">Moldova</option>
                <option value="MC">Monaco</option>
                <option value="MN">Mongolia</option>
                <option value="ME">Montenegro</option>
                <option value="MS">Montserrat</option>
                <option value="MA">Morocco</option>
                <option value="MZ">Mozambique</option>
                <option value="MM">Myanmar</option>
                <option value="NA">Namibia</option>
                <option value="NR">Nauru</option>
                <option value="NP">Nepal</option>
                <option value="NL">Netherlands</option>
                <option value="NC">New Caledonia</option>
                <option value="NZ">New Zealand</option>
                <option value="NI">Nicaragua</option>
                <option value="NE">Niger</option>
                <option value="NG">Nigeria</option>
                <option value="NU">Niue</option>
                <option value="NF">Norfolk Island</option>
                <option value="KP">North Korea</option>
                <option value="MK">North Macedonia</option>
                <option value="MP">Northern Mariana Islands</option>
                <option value="NO">Norway</option>
                <option value="OM">Oman</option>
                <option value="PK">Pakistan</option>
                <option value="PS">Palestinian Territory</option>
                <option value="PA">Panama</option>
                <option value="PG">Papua New Guinea</option>
                <option value="PY">Paraguay</option>
                <option value="PE">Peru</option>
                <option value="PH">Philippines</option>
                <option value="PN">Pitcairn</option>
                <option value="PL">Poland</option>
                <option value="PT">Portugal</option>
                <option value="PR">Puerto Rico</option>
                <option value="QA">Qatar</option>
                <option value="RE">Reunion</option>
                <option value="RO">Romania</option>
                <option value="RU">Russia</option>
                <option value="RW">Rwanda</option>
                <option value="BL">Saint Barthélemy</option>
                <option value="SH">Saint Helena</option>
                <option value="KN">Saint Kitts and Nevis</option>
                <option value="LC">Saint Lucia</option>
                <option value="SX">Saint Martin (Dutch part)</option>
                <option value="MF">Saint Martin (French part)</option>
                <option value="PM">Saint Pierre and Miquelon</option>
                <option value="VC">Saint Vincent and the Grenadines</option>
                <option value="WS">Samoa</option>
                <option value="SM">San Marino</option>
                <option value="ST">São Tomé and Príncipe</option>
                <option value="SA">Saudi Arabia</option>
                <option value="SN">Senegal</option>
                <option value="RS">Serbia</option>
                <option value="SC">Seychelles</option>
                <option value="SL">Sierra Leone</option>
                <option value="SG">Singapore</option>
                <option value="SK">Slovakia</option>
                <option value="SI">Slovenia</option>
                <option value="SB">Solomon Islands</option>
                <option value="SO">Somalia</option>
                <option value="ZA">South Africa</option>
                <option value="GS">South Georgia/Sandwich Islands</option>
                <option value="KR">South Korea</option>
                <option value="SS">South Sudan</option>
                <option value="ES">Spain</option>
                <option value="LK">Sri Lanka</option>
                <option value="SD">Sudan</option>
                <option value="SR">Suriname</option>
                <option value="SJ">Svalbard and Jan Mayen</option>
                <option value="SE">Sweden</option>
                <option value="CH">Switzerland</option>
                <option value="SY">Syria</option>
                <option value="TW">Taiwan</option>
                <option value="TJ">Tajikistan</option>
                <option value="TZ">Tanzania</option>
                <option value="TH">Thailand</option>
                <option value="TL">Timor-Leste</option>
                <option value="TG">Togo</option>
                <option value="TK">Tokelau</option>
                <option value="TO">Tonga</option>
                <option value="TT">Trinidad and Tobago</option>
                <option value="TN">Tunisia</option>
                <option value="TR">Turkey</option>
                <option value="TM">Turkmenistan</option>
                <option value="TC">Turks and Caicos Islands</option>
                <option value="TV">Tuvalu</option>
                <option value="UG">Uganda</option>
                <option value="UA">Ukraine</option>
                <option value="AE">United Arab Emirates</option>
                <option value="GB">United Kingdom (UK)</option>
                <option value="US">United States (US)</option>
                <option value="UM">United States (US) Minor Outlying Islands</option>
                <option value="UY">Uruguay</option>
                <option value="UZ">Uzbekistan</option>
                <option value="VU">Vanuatu</option>
                <option value="VA">Vatican</option>
                <option value="VE">Venezuela</option>
                <option value="VN">Vietnam</option>
                <option value="VG">Virgin Islands (British)</option>
                <option value="VI">Virgin Islands (US)</option>
                <option value="WF">Wallis and Futuna</option>
                <option value="EH">Western Sahara</option>
                <option value="YE">Yemen</option>
                <option value="ZM">Zambia</option>
                <option value="ZW">Zimbabwe</option>
              </select>
            <? else : ?>
              <label for="order_billing_country" class="form-label required">Страна/Регион</label>
              <select name="billing_country" required id="order_billing_country" class="form-control country_select" autocomplete="country" data-placeholder="Выберите страну/регион…" data-label="Страна/регион" tabindex="-1" aria-hidden="true" value="<?= current($user)['billing_country'] ?>">
                <option value="" hidden selected>Выберите страну/регион…</option>
                <option value="SZ">Eswatini</option>
                <option value="AU">Австралия</option>
                <option value="AT">Австрия</option>
                <option value="AZ">Азербайджан</option>
                <option value="AX">Аландские острова</option>
                <option value="AL">Албания</option>
                <option value="DZ">Алжир</option>
                <option value="AS">Американское Самоа</option>
                <option value="AI">Ангилья</option>
                <option value="AO">Ангола</option>
                <option value="AD">Андорра</option>
                <option value="AQ">Антарктика</option>
                <option value="AG">Антигуа и Барбуда</option>
                <option value="AR">Аргентина</option>
                <option value="AM">Армения</option>
                <option value="AW">Аруба</option>
                <option value="AF">Афганистан</option>
                <option value="BS">Багамы</option>
                <option value="BD">Бангладеш</option>
                <option value="BB">Барбадос</option>
                <option value="BH">Бахрейн</option>
                <option value="BY">Беларусь</option>
                <option value="BZ">Белиз</option>
                <option value="BE">Бельгия</option>
                <option value="BJ">Бенин</option>
                <option value="BM">Бермуды</option>
                <option value="BG">Болгария</option>
                <option value="BO">Боливия</option>
                <option value="BQ">Бонайре, Синт-Эстатиус и Саба</option>
                <option value="BA">Босния и Герцеговина</option>
                <option value="BW">Ботсвана</option>
                <option value="BR">Бразилия</option>
                <option value="IO">Британская Территория в Индийском Океане</option>
                <option value="VG">Британские Виргинские острова</option>
                <option value="BN">Бруней</option>
                <option value="BF">Буркина-Фасо</option>
                <option value="BI">Бурунди</option>
                <option value="BT">Бутан</option>
                <option value="VU">Вануату</option>
                <option value="VA">Ватикан</option>
                <option value="GB">Великобритания</option>
                <option value="HU">Венгрия</option>
                <option value="VE">Венесуэла</option>
                <option value="VI">Виргинские острова (США)</option>
                <option value="UM">Внешние малые острова США</option>
                <option value="TL">Восточный Тимор</option>
                <option value="VN">Вьетнам</option>
                <option value="GA">Габон</option>
                <option value="HT">Гаити</option>
                <option value="GY">Гайана</option>
                <option value="GM">Гамбия</option>
                <option value="GH">Гана</option>
                <option value="GP">Гваделупа</option>
                <option value="GT">Гватемала</option>
                <option value="GN">Гвинея</option>
                <option value="GW">Гвинея-Бисау</option>
                <option value="DE">Германия</option>
                <option value="GG">Гернси</option>
                <option value="GI">Гибралтар</option>
                <option value="HN">Гондурас</option>
                <option value="HK">Гонконг</option>
                <option value="GD">Гренада</option>
                <option value="GL">Гренландия</option>
                <option value="GR">Греция</option>
                <option value="GE">Грузия</option>
                <option value="GU">Гуам</option>
                <option value="DK">Дания</option>
                <option value="JE">Джерси</option>
                <option value="DJ">Джибути</option>
                <option value="DM">Доминика</option>
                <option value="DO">Доминиканская Республика</option>
                <option value="EG">Египет</option>
                <option value="ZM">Замбия</option>
                <option value="EH">Западная Сахара</option>
                <option value="ZW">Зимбабве</option>
                <option value="IL">Израиль</option>
                <option value="IN">Индия</option>
                <option value="ID">Индонезия</option>
                <option value="JO">Иордания</option>
                <option value="IQ">Ирак</option>
                <option value="IR">Иран</option>
                <option value="IE">Ирландия</option>
                <option value="IS">Исландия</option>
                <option value="ES">Испания</option>
                <option value="IT">Италия</option>
                <option value="YE">Йемен</option>
                <option value="CV">Кабо-Верде</option>
                <option value="KZ">Казахстан</option>
                <option value="KY">Кайманские острова</option>
                <option value="KH">Камбоджа</option>
                <option value="CM">Камерун</option>
                <option value="CA">Канада</option>
                <option value="QA">Катар</option>
                <option value="KE">Кения</option>
                <option value="CY">Кипр</option>
                <option value="KI">Кирибати</option>
                <option value="CN">Китай</option>
                <option value="CC">Кокосовые (Килинг) острова</option>
                <option value="CO">Колумбия</option>
                <option value="KM">Коморы</option>
                <option value="CG">Конго (Браззавиль)</option>
                <option value="CD">Конго (Киншаса)</option>
                <option value="CR">Коста-Рика</option>
                <option value="CI">Кот-д'Ивуар</option>
                <option value="CU">Куба</option>
                <option value="KW">Кувейт</option>
                <option value="KG">Кыргызстан</option>
                <option value="CW">Кюрасао</option>
                <option value="LA">Лаос</option>
                <option value="LV">Латвия</option>
                <option value="LS">Лесото</option>
                <option value="LR">Либерия</option>
                <option value="LB">Ливан</option>
                <option value="LY">Ливия</option>
                <option value="LT">Литва</option>
                <option value="LI">Лихтенштейн</option>
                <option value="LU">Люксембург</option>
                <option value="MU">Маврикий</option>
                <option value="MR">Мавритания</option>
                <option value="MG">Мадагаскар</option>
                <option value="YT">Майотта</option>
                <option value="MO">Макао</option>
                <option value="MW">Малави</option>
                <option value="MY">Малайзия</option>
                <option value="ML">Мали</option>
                <option value="MV">Мальдивы</option>
                <option value="MT">Мальта</option>
                <option value="MA">Марокко</option>
                <option value="MQ">Мартиника</option>
                <option value="MH">Маршалловы острова</option>
                <option value="MX">Мексика</option>
                <option value="FM">Микронезия</option>
                <option value="MZ">Мозамбик</option>
                <option value="MD">Молдова</option>
                <option value="MC">Монако</option>
                <option value="MN">Монголия</option>
                <option value="MS">Монсеррат</option>
                <option value="MM">Мьянма</option>
                <option value="NA">Намибия</option>
                <option value="NR">Науру</option>
                <option value="NP">Непал</option>
                <option value="NE">Нигер</option>
                <option value="NG">Нигерия</option>
                <option value="NL">Нидерланды</option>
                <option value="NI">Никарагуа</option>
                <option value="NU">Ниуэ</option>
                <option value="NZ">Новая Зеландия</option>
                <option value="NC">Новая Каледония</option>
                <option value="NO">Норвегия</option>
                <option value="AE">Объединённые Арабские Эмираты</option>
                <option value="OM">Оман</option>
                <option value="BV">Остров Буве</option>
                <option value="IM">Остров Мэн</option>
                <option value="NF">Остров Норфолк</option>
                <option value="CX">Остров Рождества</option>
                <option value="SH">Остров Святой Елены</option>
                <option value="HM">Остров Херд и острова Макдональд</option>
                <option value="CK">Острова Кука</option>
                <option value="PK">Пакистан</option>
                <option value="PW">Палау</option>
                <option value="PS">Палестинские территории</option>
                <option value="PA">Панама</option>
                <option value="PG">Папуа-Новая Гвинея</option>
                <option value="PY">Парагвай</option>
                <option value="PE">Перу</option>
                <option value="PN">Питкэрн</option>
                <option value="PL">Польша</option>
                <option value="PT">Португалия</option>
                <option value="PR">Пуэрто-Рико</option>
                <option value="RE">Реюньон</option>
                <option value="RU">Россия</option>
                <option value="RW">Руанда</option>
                <option value="RO">Румыния</option>
                <option value="US">США</option>
                <option value="SV">Сальвадор</option>
                <option value="WS">Самоа</option>
                <option value="SM">Сан-Марино</option>
                <option value="ST">Сан-Томе и Принсипи</option>
                <option value="SA">Саудовская Аравия</option>
                <option value="KP">Северная Корея</option>
                <option value="MK">Северная Македония</option>
                <option value="MP">Северные Марианские острова</option>
                <option value="SC">Сейшельские Острова</option>
                <option value="BL">Сен-Бартелеми</option>
                <option value="SX">Сен-Мартен (Нидерл.)</option>
                <option value="MF">Сен-Мартен (Фр.)</option>
                <option value="PM">Сен-Пьер и Микелон</option>
                <option value="SN">Сенегал</option>
                <option value="VC">Сент-Винсент и Гренадины</option>
                <option value="KN">Сент-Китс и Невис</option>
                <option value="LC">Сент-Люсия</option>
                <option value="RS">Сербия</option>
                <option value="SG">Сингапур</option>
                <option value="SY">Сирия</option>
                <option value="SK">Словакия</option>
                <option value="SI">Словения</option>
                <option value="SB">Соломоновы Острова</option>
                <option value="SO">Сомали</option>
                <option value="SD">Судан</option>
                <option value="SR">Суринам</option>
                <option value="SL">Сьерра-Леоне</option>
                <option value="TJ">Таджикистан</option>
                <option value="TW">Тайвань</option>
                <option value="TH">Тайланд</option>
                <option value="TZ">Танзания</option>
                <option value="TC">Теркс и Кайкос</option>
                <option value="TG">Того</option>
                <option value="TK">Токелау</option>
                <option value="TO">Тонга</option>
                <option value="TT">Тринидад и Тобаго</option>
                <option value="TV">Тувалу</option>
                <option value="TN">Тунис</option>
                <option value="TM">Туркменистан</option>
                <option value="TR">Турция</option>
                <option value="UG">Уганда</option>
                <option value="UZ">Узбекистан</option>
                <option value="UA">Украина</option>
                <option value="WF">Уоллис и Футуна</option>
                <option value="UY">Уругвай</option>
                <option value="FO">Фарерские острова</option>
                <option value="FJ">Фиджи</option>
                <option value="PH">Филиппины</option>
                <option value="FI">Финляндия</option>
                <option value="FK">Фолклендские острова</option>
                <option value="FR">Франция</option>
                <option value="GF">Французская Гвиана</option>
                <option value="PF">Французская Полинезия</option>
                <option value="TF">Французские южные территории</option>
                <option value="HR">Хорватия</option>
                <option value="CF">Центральная Африканская Республика</option>
                <option value="TD">Чад</option>
                <option value="ME">Черногория</option>
                <option value="CZ">Чешская Республика</option>
                <option value="CL">Чили</option>
                <option value="CH">Швейцария</option>
                <option value="SE">Швеция</option>
                <option value="SJ">Шпицберген и Ян-Майен</option>
                <option value="LK">Шри-Ланка</option>
                <option value="EC">Эквадор</option>
                <option value="GQ">Экваториальная Гвинея</option>
                <option value="ER">Эритрея</option>
                <option value="EE">Эстония</option>
                <option value="ET">Эфиопия</option>
                <option value="ZA">Южная Африка</option>
                <option value="GS">Южная Георгия/Сандвичевы острова</option>
                <option value="KR">Южная Корея</option>
                <option value="SS">Южный Судан</option>
                <option value="JM">Ямайка</option>
                <option value="JP">Япония</option>
              </select>
            <? endif ?>
            <script type="text/javascript">
              $(document).ready(function() {
                $('#order_billing_country').selectize({
                  sortField: 'text'
                });
              });
            </script>
          </div>
          <!-- Address -->
          <div class="mb-3">
            <label for="order_address" class="form-label required"><?= current($user)['lang'] == 'RU' ? 'Адрес' : 'Street Address' ?></label>
            <input type="text" required class="form-control" name="address" id="order_address" placeholder="<?= current($user)['lang'] == 'RU' ? 'Номер дома и название улицы' : 'House number and street name' ?>" value="<?= current($user)['address'] ?>">
            <input type="text" class="form-control" name="apartment" id="order_apartment" placeholder="<?= current($user)['lang'] == 'RU' ? 'Крыло, подъезд, этаж и т.д. (необязательно)' : 'Apartment, suite, unit, etc. (optional)' ?>" value="<?= current($user)['apartment'] ?>">
          </div>

          <!-- City -->
          <div class="mb-3">
            <label for="order_city" class="form-label required"><?= current($user)['lang'] == 'RU' ? 'Адрес' : 'Street Address' ?></label>
            <input type="text" class="form-control" name="city" id="order_city" placeholder="<?= current($user)['lang'] == 'RU' ? 'Город / Населенный пункт' : 'Town / City' ?>" required value="<?= current($user)['city'] ?>">

          </div>
          <!-- Region/State -->
          <div class="mb-3">
            <label for="order_region" class="form-label required"><?= current($user)['lang'] == 'RU' ? 'Регион / Область' : 'Region / State / District' ?></label>
            <input type="text" class="form-control" name="region" id="order_region" required placeholder="<?= current($user)['lang'] == 'RU' ? 'Регион / Область' : 'Region / State / District' ?>" value="<?= current($user)['region'] ?>">
          </div>

          <!-- Postcode / ZIP (optional) -->
          <div class="mb-3">
            <label for="order_zip_code" class="form-label"><?= current($user)['lang'] == 'RU' ? 'Почтовый индекс (необязательно)' : 'Postcode / ZIP (optional)' ?></label>
            <input type="text" class="form-control" name="zip_code" id="order_zip_code" placeholder="<?= current($user)['lang'] == 'RU' ? 'Почтовый индекс (необязательно)' : 'Postcode / ZIP (optional)' ?>" value="<?= current($user)['zip_code'] ?>">
          </div>
          <!-- Additions -->
          <div class="mb-3">
            <label for="order_additions" class="form-label"><?= current($user)['lang'] == 'RU' ? 'Примечание к заказу (необязательно)' : 'Order notes (optional)' ?></label>

            <textarea name="additions" class="form-control" id="order_additions" cols="30" rows="10" placeholder="<?= current($user)['lang'] == 'RU' ? 'Примечания к вашему заказу, например, особые пожелания отделу доставки.' : 'Notes about your order, e.g. special notes for delivery.' ?>"></textarea>
          </div>
        </div>
        <div class="modal-footer">
          <div class=" form-check">
            <input type="checkbox" class="form-check-input" id="exampleCheck1" required="1" checked="1">
            <label class="form-check-label" for="exampleCheck1">
              <? if (current($user)['lang'] == 'RU') : ?>
              Я солгасен с <a href="/about/policy">политикой конфиденциальности и правилами пользования </a>сайтом
              <? else : ?> 
                 I agree with the <a href="/about/policy">privacy policy and terms of use</a> of the site
              <? endif ?>
            </label>
          </div>
          <br>
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><?= current($user)['lang'] == 'RU' ? 'Отмена' : 'Cancle' ?></button>
          <button type="success" class="btn btn-primary"><?= current($user)['lang'] == 'RU' ? 'Оформить заказ' : 'Place order' ?></button>
        </div>
      </div>
    </div>
  </form>
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