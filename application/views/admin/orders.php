<div class="orders">
  <div class="col-12 text-center">


    <h3>Заказы</h3>


  </div>
  <div class="row">
    <div class="col-12 col-lg-6 order ddd">
      123
    </div>

    <div class="col-12 col-lg-6 order ddd">
      123
    </div>
  </div>
</div>




<?php
foreach ($orders as $id => $node) : ?>
  <tr>
    <td><?= $id ?></td>
    <td><?= $node['changed_at'] ?></td>
    <td><?= $orders_class->status[$node['status']]['RU'] ?></td>
    <td><?= $node['first_name'] . ' ' . $node['second_name'] ?></td>
    <td>
      <? if ($node['currency'] == 'RU') : ?>
        <?= json_decode($node['cost'], 1)['RUB'] ?> руб.
      <? else : ?>
        <!-- <? //= '$' . json_decode($node['cost'], 1)['USD'] 
              ?> -->
        <?= json_decode($node['cost'], 1)['USD'] ?> eur
      <? endif ?>
    </td>


    <td>
      <a class="btn btn-info" href="/admin/orders/edit?id=<?= $id ?>">Редактировать</a>
    </td>
  </tr>
<?php endforeach ?>