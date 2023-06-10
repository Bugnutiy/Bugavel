<?php
// ddd($sber);
?>
<form method="post">
  <div class="row justify-content-center mb-2">
    <div class="input-group col-md-6 col-12">
      <div class="input-group-prepend">
        <span class="input-group-text" id="userName">UserName</span>
      </div>
      <input class="form-control" type="text" name="userName" placeholder="UserName" aria-label="UserName" aria-describedby="userName" value="<?= current($sber)['userName'] ?>">
    </div>
  </div>

  <div class="row justify-content-center mb-2">
    <div class="input-group col-md-6 col-12">
      <div class="input-group-prepend">
        <span class="input-group-text" id="password">Password</span>
      </div>
      <input class="form-control" type="password" name="password" placeholder="password" aria-label="password" aria-describedby="password" value="<?= current($sber)['password'] ?>">
    </div>
  </div>

  <div class="row justify-content-center mb-2">

    <div class="col-md-6 col-12">
      <div class="custom-control custom-radio">
        <input id="host1" class="custom-control-input" type="radio" name="host" value="https://3dsec.sberbank.ru/payment/rest/" <?= (isset($sber) and current($sber)['host'] == 'https://3dsec.sberbank.ru/payment/rest/') ? 'checked' : '' ?>>
        <label for="host1" class="custom-control-label">Тестовый сервер</label>
      </div>
      <div class="custom-control custom-radio">
        <!-- todo -->
        <input id="host2" class="custom-control-input" type="radio" name="host" value="https://.sberbank.ru/payment/rest/" <?= (isset($sber) and current($sber)['host'] == 'https://.sberbank.ru/payment/rest/') ? 'checked' : '' ?>>
        <label for="host2" class="custom-control-label">Основной сервер</label>
      </div>
    </div>
  </div>
  <div class="row justify-content-center mb-2">
    <div class="col-md-6">
      <button class="btn btn-primary" type="submit">Подтвердить</button>
    </div>
  </div>
</form>