<? if ($user['lang'] == 'RU') : ?>
  <h1>Здравствуйте, <?= $user['first_name'] ?> <?= $user['second_name'] ?>!</h1>
  <p>Данный E-mail был указан в заказе на сайте leosmagin.com</p>
  <p>Заказ №<?= current($oansw)['ID'] ?> успешно размещен</p>
  <? if ($order['currency'] == 'RU') : ?>
    <p><b>Сумма заказа: <?= json_decode($order['cost'], 1)['RUB'] ?> руб.</b></p>
  <? else : ?>
    <!-- <p><b>Сумма заказа: <?//= json_decode($order['cost'], 1)['USD'] ?> USD.</b></p> -->
    <p><b>Сумма заказа: <?= json_decode($order['cost'], 1)['USD'] ?> eur</b></p>

  <? endif ?>
  <p>После обработки, с вами свяжется оператор для уточнения метода и стоимости доставки</p>
  <p>Если вы получили это письмо по ошибке, пожалуйста, напишите об этом на protattoo@mail.ru.com, или ответьте на это письмо</p>

<? else : ?>
  <h1>Hello, <?= $user['first_name'] ?> <?= $user['second_name'] ?>!</h1>
  <p>This email address was specified in the order on the website leosmagin.com </p>
  <p>Order No.<?= current($oansw)['ID'] ?> successfully placed</p>
  <? if ($order['currency'] == 'RU') : ?>
    <p><b>Order amount: <?= json_decode($order['cost'], 1)['RUB'] ?> rub.</b></p>
  <? else : ?>
    <!-- <p><b>Order amount: <?//= json_decode($order['cost'], 1)['USD'] ?> USD.</b></p> -->
    <p><b>Order amount: <?= json_decode($order['cost'], 1)['USD'] ?> eur.</b></p>

  <? endif ?>
  <p>After processing, the operator will contact you to clarify the method and cost of delivery</p>
  <p>If you received this email by mistake, please write about it at protattoo@mail.ru.com, or reply to this email</p>
<? endif ?>