<div class="row justify-content-center">
  <div class="col-12 col-md-6 bg-white p-4">
    <form action="/admin/categories/delete?id=<?= key($category) ?>" method="POST">
      <input type="hidden" name="id" value="<?= key($category) ?>">

      <div class="form-group">
        <label for="">Удаление категории "<?= current($category)['name'] ?>" так же удалит все товары этой категории.</label>
      </div>
      <div class="form-group">
        <input class="" type="checkbox" name="confirm" id="confirm" required value="1">

        <label for="confirm">Подтвердить удаление</label>
      </div>

      <button type="submit" class="btn btn-outline-danger">Удалить</button>
      <a href="/admin/categories" class="btn btn-info">Отмена</a>
    </form>
  </div>
</div>