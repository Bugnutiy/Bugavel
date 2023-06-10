<div class="row products_main">
  <div class="col-12">
    <div class="card">
      <a class="btn card-header" type="button" data-toggle="collapse" data-target="#products_collapse" aria-expanded="false" aria-controls="products_collapse">
        <h1>Вариации товара "<?= current($product)['name'] ?>"</h1>
      </a>

      <div class="collapse show" id="products_collapse">
        <table class="table table-light table-bordered table-striped mb-0">
          <thead class="thead-dark">
            <tr>
              <th>цены</th>
              <th>Класс</th>
              <th>Название</th>
              <th>Действия</th>
            </tr>
          </thead>
          <tbody>
            <?php
            foreach ($properties as $id => $node) : ?>
              <tr>
                <!-- <td><? //= '$'.$node['price_en'].' / '.$node['price'].' р.' 
                          ?></td> -->
                <td><?= $node['price_en'] . ' eur. / ' . $node['price'] . ' р.' ?></td>
                <td><?= $node['classname'] ?></td>
                <td><?= $node['name'] ?></td>
                <td>
                  <a class="btn btn-info" href="/admin/products/properties/edit?id=<?= $id ?>&product_id=<?= key($product) ?>">Редактировать</a>
                  <a class="btn btn-danger" href="/admin/products/properties/delete?id=<?= $id ?>&product_id=<?= key($product) ?>">Удалить</a>
                  <a class="btn btn-warning" href="/admin/products/properties/edit?id=<?= $id ?>&product_id=<?= key($product) ?>&copy=1">Дублировать</a>
                </td>
              </tr>
            <?php endforeach ?>
          </tbody>
        </table>
      </div>
      <div class="card-footer">
        <a href="/admin/products/properties/edit?product_id=<?= key($product) ?>" class="btn btn-primary">Добавить вариацию</a>
      </div>
    </div>
  </div>
</div>