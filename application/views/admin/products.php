<div class="row products_main">
    <div class="col-12">
        <div class="card">

            <a class="btn card-header" type="button" data-toggle="collapse" data-target="#products_collapse" aria-expanded="false" aria-controls="products_collapse"><h1>Товары</h1></a>

            <div class="collapse show" id="products_collapse">
                <table class="table table-light table-bordered table-striped mb-0">
                    <thead class="thead-dark">
                        <tr>
                            <th>№</th>
                            <th>Название</th>
                            <th>Действия</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        foreach ($products as $id => $node) : ?>
                            <tr>
                                <td><?= $id ?></td>
                                <td><?= $node['name'] ?></td>
                                <td>
                                    <a class="btn btn-info" href="/admin/products/edit?id=<?= $id ?>">Редактировать</a>
                                    <a class="btn btn-danger" href="/admin/products/delete?id=<?= $id ?>">Удалить</a>
                                    <a class="btn btn-warning" href="/admin/products/copy?id=<?= $id ?>&copy=1">Дублировать</a>
                                    <a class="btn btn-success" href="/admin/products/properties?product_id=<?= $id ?>">Вариации</a>
                                </td>
                            </tr>
                        <?php endforeach ?>
                    </tbody>
                </table>
            </div>
            <div class="card-footer">
                <a href="/admin/products/new" class="btn btn-primary">Добавить товар</a>
            </div>
        </div>
    </div>
</div>