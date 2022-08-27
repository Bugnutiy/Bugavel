<div class="row products_main">
    <div class="col-12">
        <div class="row">
            <div class="col-md-6 col-12">
                <select name="category" id="categories" class="form-control" onchange="category(value)">
                    <option value="" selected hidden disabled>Выбрать категорию</option>
                    <? foreach ($categories as $category_id => $category) : ?>
                        <option value="<?= $category_id ?>" <?= isset($_GET['category']) ? ($_GET['category'] == $category_id ? 'selected="1"' : '') : '' ?>><?= $category['name'] ?></option>
                    <? endforeach ?>
                </select>
            </div>
        </div>
        <script>
            function category(value) {
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
                window.location.replace(newURL + "?category=" + value);
                // .replace("");
                // document.location.href = 'http://stackoverflow.com'
            }
        </script>
        <div class="card">

            <a class="btn card-header" type="button" data-toggle="collapse" data-target="#products_collapse" aria-expanded="false" aria-controls="products_collapse">
                <h1>Товары</h1>
            </a>

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