<div class="orders ">
  <div class="col-12 text-center">
    <h3>Заказы</h3>
  </div>
  <? $cc = 7;
  $mid = intdiv($cc, 2) + 1;
  $start = $page - $mid >= 1 ? $page - $mid + 1 : 1;
  $end = $start + $cc;

  if ($start + $cc > $count_p) {
    $end = $count_p + 1;
    $start = $end - $cc;
  }
  if ($cc > $count_p) {
    $start = 1;
    $end = $count_p + 1;
  }
  ?>
  <div class="row justify-content-center">
    <nav aria-label="Page navigation" class="col-auto p-0">
      <ul class="pagination">

        <li class="page-item <?= $page < 2 ? 'disabled' : '' ?>">
          <a class="page-link" href="?page=<?= $page - 1 ?>" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
          </a>
        </li>


        <? for ($i = $start; $i < $end; $i++) : ?>

          <li class="page-item <?= $page == $i ? 'active' : '' ?>">
            <a class="page-link" href="?page=<?= $i ?>">
              <?= $i ?>
            </a>
          </li>
        <? endfor ?>


        <li class="page-item <?= $page >= $count_p ? 'disabled' : '' ?>">
          <a class="page-link" href="?page=<?= $page + 1 ?>" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
          </a>
        </li>
      </ul>
    </nav>
  </div>

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


<div class="row px-1">

  <?php
  foreach ($orders as $id => $node) : ?>

    <div class="col-12 col-md-6 col-lg-4 ddd">
      <div class="row justify-content-between">
        <div class="col-4">1</div>
        <div class="col-4">2</div>
        <div class="col-auto"><i class="bi bi-suit-club"></i></div>
      </div>
    </div>


  <?php endforeach ?>
</div>