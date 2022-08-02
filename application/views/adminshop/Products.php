<div class="container-fluid">
    <div><a href="/admin/products/add" class="btn btn-primary">Добавить товар</a> </div>
    <table class="table table-striped">
        <thead class="thead-light">
            <tr>
                <th>id</th>
                <th>Название</th>
                <th>Категория</th>
                <!-- <th>Описание</th> -->
                <!-- <th>Фото</th> -->
                <th>Действия</th>
            </tr>
        </thead>
        <tbody>
            <?foreach ($products as $id => $product):?>
            <tr>
                <td><?= $id ?></td>
                <td><?= $product['name'] ?></td>
                <td><?= $categories[$product['category_id']]['name'] ?></td>
                <td>
                    <a href="/admin/products/del?id=<?= $id ?>">Удалить</a>
                    <a href="/admin/products/change?id=<?= $id ?>">Экземпляры</a>
                    <a href="/admin/products/change?id=<?= $id ?>">Изменить</a>

                </td>
            </tr>
            <? endforeach; ?>
        </tbody>
    </table>
</div>