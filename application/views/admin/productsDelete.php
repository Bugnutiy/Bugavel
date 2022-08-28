<div class="row justify-content-center">
    <div class="col-12 col-md-6 bg-white p-4">
        <form action="/admin/products/delete?id=<?= key($product) ?>" method="POST">
            <input type="hidden" name="id" value="<?= key($product) ?>">

            <div class="form-group">
                <label for="">Удалить товар "<?= current($product)['name'] ?>"?</label>
            </div>
            <div class="form-group">
                <input class="" type="checkbox" name="confirm" id="confirm" required value="111">

                <label for="confirm">Подтвердить удаление</label>
            </div>

            <button type="submit" class="btn btn-outline-danger">Удалить</button>
            <a href="/admin/products" class="btn btn-info">Отмена</a>
        </form>
    </div>
</div>