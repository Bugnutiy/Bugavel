<form enctype="multipart/form-data" action="/admin/products/add/form" method="POST">
    <p>Название товара: <input required type="text" name="name" placeholder="Название товара"></p>
    <p>Категория:
        <select name="category">
            <? foreach ($categories as $id => $category): ?>
            <option value="<?= $id ?>"><?= $category['name'] ?></option>
            <? endforeach ?>
        </select>
    </p>
    <p>
        Описание:</p>
    <textarea name="description" id="" cols="30" rows="10"></textarea>
    <p>
        Фото:

        <input type="file" name="upload_file[]" accept="image/*,image/jpeg" multiple>


    </p>

    <input type="submit" value="Отпрваить">
</form>