<div class="row">
  <div class="col-12 col-md-6">
    <form action="/admin/coredb" method="POST" enctype="multipart/form-data">
      <textarea name="query" id="" cols="30" rows="10" class="form-control mb-3" placeholder="Прямой запрос в бд"></textarea>
      <button type="submit" class="btn btn-outline-danger mb-3">Отправить</button>
    </form>
  </div>
  <div class="col-12">
    <h3>Ответ от базы данных</h3>
    <?
    ddd($answer);
    ?>
  </div>
</div>