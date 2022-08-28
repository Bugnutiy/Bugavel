<div class="row products_main">
  <div class="col-12">
    <div class="card">

      <a class="btn card-header" type="button" data-toggle="collapse" data-target="#products_collapse" aria-expanded="false" aria-controls="products_collapse">
        <h1>Заказы</h1>
      </a>

      <div class="collapse show" id="products_collapse">
        <table class="table table-light table-bordered table-striped mb-0">
          <thead class="thead-dark">
            <tr>
              <th>№</th>
              <th>Дата время</th>
              <th>Статус</th>
              <th>Имя пользователя</th>
              <th>Сумма заказа</th>
              <th>Действия</th>
            </tr>
          </thead>
          <tbody>
            <?php
            foreach ($orders as $id => $node) : ?>
              <tr>
                <td><?= $id ?></td>
                <td><?= $node['changed_at'] ?></td>
                <td><?= $orders_class->status[$node['status']]['RU'] ?></td>
                <td><?= $node['first_name'] . ' ' . $node['second_name'] ?></td>
                <td>
                  <? if ($node['ip_country'] == 'RU') : ?>
                    <?= json_decode($node['cost'], 1)['RUB'] ?> руб.
                  <? else : ?>
                    <?= '$' . json_decode($node['cost'], 1)['USD'] ?>
                  <? endif ?>
                </td>


                <td>
                  <a class="btn btn-info" href="/admin/orders/edit?id=<?= $id ?>">Редактировать</a>
                </td>
              </tr>
            <?php endforeach ?>
          </tbody>
        </table>
      </div>
      <div class="card-footer">
        <!-- <a href="/admin/products/new" class="btn btn-primary">Добавить товар</a> -->
      </div>
    </div>
  </div>
</div>