<div class="orders">
  <div class="col-12 text-center">
    <h3>Заказы</h3>
  </div>

  <nav aria-label="Page navigation">
    <ul class="pagination">

      <li class="page-item <?= $page < 2 ? 'disabled' : '' ?>">
        <a class="page-link" href="?page=<?= $page - 1 ?>" aria-label="Previous">
          <span aria-hidden="true">&laquo;</span>
        </a>
      </li>

      <? $cc = 5;
      $mid = intdiv($cc, 2);
      ddd($mid);
      ddd($count_p);
      ddd($page);
      $n = $page-$mid+1;
      ?>
      <?for ($i=0; $i < $cc; $i++) :?>
        
      <li class="page-item">
        <a class="page-link" href="?page=<?= $n++ ?>">
          <?= $n ?>
        </a>
      </li>
      <?endfor?>
      

      <li class="page-item <?= $page >= $count_p ? 'disabled' : '' ?>">
        <a class="page-link" href="?page=<?= $page + 1 ?>" aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
        </a>
      </li>
    </ul>
  </nav>

  <!-- <div class="row">
    <div class="col-12 col-lg-6 order ">
      <div class="card">
        <h5 class="card-header">Рекомендуемые</h5>
        <div class="card-body">
          <h5 class="card-title">Особое обращение с заголовком</h5>
          <p class="card-text">С вспомогательным текстом ниже в качестве естественного перехода к дополнительному контенту.</p>
          <a href="#" class="btn btn-primary">Перейти куда-нибудь</a>
        </div>
      </div>
    </div>

    <div class=" card col-12 col-lg-6 order ">
      <h5 class="card-header">Рекомендуемые</h5>
      <div class="card-body">
        <h5 class="card-title">Особое обращение с заголовком</h5>
        <p class="card-text">С вспомогательным текстом ниже в качестве естественного перехода к дополнительному контенту.</p>
        <a href="#" class="btn btn-primary">Перейти куда-нибудь</a>
      </div>
    </div>
  </div> -->
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