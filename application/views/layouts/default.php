<!doctype html>
<html lang="en">

<head>
  <title>Oops!</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS v5.2.0-beta1 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

</head>

<body>
  <style>
    .row {
      min-height: 100vh;
    }

    a {
      color: white;
    }

    a:hover {
      color: white;
      text-decoration: none;
    }
  </style>
  <div class="container">
    <div class="row">
      <div class="col align-self-center">
        <h1><?= current($user)['lang'] == 'RU' ? 'Сайт временно недоступен. Ведутся технические работы.' : 'The site is temporarily unavailable. Technical work is underway.' ?></h1>
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
  <!-- Bootstrap JavaScript Libraries -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>
</body>

</html>