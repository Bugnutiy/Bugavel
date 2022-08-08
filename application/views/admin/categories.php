<div class="row categories_main">
    <div class="col-12">
        <div class="card">

            <a class="link card-header" type="button" data-toggle="collapse" data-target="#categories_collapse" aria-expanded="false" aria-controls="categories_collapse">Категории</a>

            <div class="collapse show" id="categories_collapse">
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
                        foreach ($categories as $id => $node) : ?>
                            <tr>
                                <td><?= $id ?></td>
                                <td><?= $node['name'] ?></td>
                                <td>
                                    <a class="btn btn-info" href="/admin/categories/edit?id=<?= $id ?>">Редактировать</a>
                                    <a class="btn btn-danger" href="/admin/categories/delete?id=<?= $id ?>">Удалить</a>
                                    <a class="btn btn-warning" href="/admin/categories/copy?id=<?= $id ?>&copy=1">Дублировать</a>
                                </td>
                            </tr>
                        <?php endforeach ?>
                    </tbody>
                </table>
            </div>
            <div class="card-footer">
                <a href="/admin/categories/new" class="btn btn-primary">Создать новую категорию</a>
            </div>
        </div>
    </div>
</div>