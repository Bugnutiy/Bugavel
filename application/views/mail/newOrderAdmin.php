<h1>Заказ №<?= current($oansw)['ID'] ?></h1>
<p><a href="<?= $_SERVER['HTTP_ORIGIN'] ?>/admin/orders/edit?id=<?= current($oansw)['ID'] ?>">Перейти к заказу</a></p>
<p>Заказчик: <?= $order['first_name'] ?> <?= $order['second_name'] ?></p>
<p>E-Mail: <?= $order['email'] ?> (<a href="mailto:<?= $order['email'] ?>">Написать письмо</a>)</p>
<p>Телефон: <a href="tel:<?= $order['phone'] ?>"><?= $order['phone'] ?></a></p>
<style>
  table.iksweb {
    text-decoration: none;
    border-collapse: collapse;
    width: 100%;
    text-align: left;
  }

  table.iksweb th {
    font-weight: normal;
    font-size: 14px;
    color: #ffffff;
    background-color: #354251;
  }

  table.iksweb td {
    font-size: 13px;
    color: #354251;
  }

  table.iksweb td,
  table.iksweb th {
    white-space: pre-wrap;
    padding: 10px 5px;
    line-height: 13px;
    vertical-align: middle;
    border: 1px solid #354251;
  }

  table.iksweb tr:hover {
    background-color: #f9fafb
  }

  table.iksweb tr:hover td {
    color: #354251;
    cursor: pointer;
  }

  .mobile-table {
    width: 100%;
    max-width: 100%;
    overflow-x: auto;
  }
</style>
<div class="mobile-table">
  <table class="iksweb">
    <thead>
      <tr>
        <th>Товар</th>
        <th>Количество</th>
        <th>Цена</th>
      </tr>
    </thead>
    <tbody>
      <? foreach ($cart as $cart_id => $cart_node) : ?>
        <? if ($order['currency'] == 'RU') : ?>
          <tr>
            <td><?= $products[$cart_node['product_id']]['name'] ?></td>
            <td><?= $cart_node['quantity'] ?></td>
            <td><?= $properties[$cart_node['property_id']]['price'] ?> руб.</td>
          </tr>
        <? else : ?>
          <tr>
            <td><?= $products[$cart_node['product_id']]['name_en'] ?></td>
            <td><?= $cart_node['quantity'] ?></td>
            <!-- <td><?//= $properties[$cart_node['property_id']]['price_en'] ?> USD</td> -->
            <td><?= $properties[$cart_node['property_id']]['price_en'] ?> eur</td>

          </tr>
        <? endif ?>
      <? endforeach ?>
    </tbody>
  </table>
</div>
<? if ($order['currency'] == 'RU') : ?>
  <p><b>Сумма заказа: <?= json_decode($order['cost'], 1)['RUB'] ?> руб.</b></p>
<? else : ?>
  <!-- <p><b>Сумма заказа: <?//= json_decode($order['cost'], 1)['USD'] ?> USD.</b></p> -->
  <p><b>Сумма заказа: <?= json_decode($order['cost'], 1)['USD'] ?> eur.</b></p>

<? endif ?>

<p>Адрес доставки: </p>
<p>Страна: <?= $countries[$order['billing_country']] ?></p>
<p>Адрес: <?= $order['address'] ?></p>
<p><?= $order['apartment'] ?></p>
<p>Город/Нас. пункт: <?= $order['city'] ?></p>
<p>Штат/Область/Регион: <?= $order['region'] ?></p>
<p>Почтовый индекс/zip код: <?= $order['zip_code'] ?></p>