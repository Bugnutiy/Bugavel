<div class="row categories_main">
    <div class="col-12">
        <div class="row">
            <div class="col-md-6 col-12">
                <select name="" id="" class="form-control" onchange="block(value)">
                    
                    <option value="0" <?=$blocked[1]['block']==0?'selected':''?>>Разболкирован</option>
                    <option value="1" <?=$blocked[1]['block']==1?'selected':''?>>Заблокирован</option>

                </select>
            </div>
        </div>
        <script>
            function block(value) {
                console.log(window.location.href);
                var oldURL = window.location.href
                var index = 0;
                var newURL = oldURL;
                index = oldURL.indexOf('?');
                if (index == -1) {
                    index = oldURL.indexOf('#');
                }
                if (index != -1) {
                    newURL = oldURL.substring(0, index);
                }
                window.location.replace(newURL + "?block=" + value);
                // .replace("");
                // document.location.href = 'http://stackoverflow.com'
            }
        </script>
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