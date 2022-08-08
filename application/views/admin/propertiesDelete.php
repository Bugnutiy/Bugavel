<div class="row justify-content-center">
    <div class="col-12 col-md-6 bg-white p-4">
        <form action="/admin/products/properties/delete?id=<?= key($property) ?>&product_id=<?= current($property)['product_id']  ?>" method="POST">
            <input type="hidden" name="id" value="<?= key($property) ?>">

            <div class="form-group">
                <label for="">Удалить вариацию"<?= current($property)['name'] ?>"?</label>
            </div>
            <div class="form-group">
                <input class="" type="checkbox" name="confirm" id="confirm" required value="1">

                <label for="confirm">Подтвердить удаление</label>
            </div>

            <button type="submit" class="btn btn-outline-danger">Удалить</button>
            <a href="/admin/products/properties" class="btn btn-info">Отмена</a>
        </form>
    </div>
</div>