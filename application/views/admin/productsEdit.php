<?php ob_start() ?>
<link href="/public/admin/styles/htmleditor/quill.snow.css" rel="stylesheet">
<?php $head = ob_get_clean(); ?>

<?php if (isset($err)) : ?>
    <?php foreach ($err as $errstr) : ?>
        <div class="row justify-content-center">
            <div class="col-11 alert alert-danger">
                <?= $errstr ?>
            </div>
        </div>
    <?php endforeach ?>
<?php endif ?>

<form method="post" action="/admin/products/edit<?= isset($_GET['id']) ? '?id=' . $_GET['id'] : '' ?><?= isset($_GET['copy']) ? '&copy=1' : '' ?>" enctype="multipart/form-data">
    <div class="row justify-content-center">

        <h2><?= $header ?></h2>
        <div class="w-100"></div>

        <div class="col-12 col-md-6">
            <!-- Редактировать -->
            <?php if (isset($product) and !isset($copy)) : ?>
                <input type="hidden" name="id" value="<?= key($product) ?>">
            <?php endif ?>
            <!-- --Редактировать -->

            <div class="input-group mb-2">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="name">Название товара RU</span>
                </div>
                <input required class="form-control" type="text" name="name" placeholder="Товар" aria-label="Имя" aria-describedby="name" value="<?= isset($product) ? current($product)['name'] : '' ?>">
            </div>

            <div class="input-group mb-2">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="name_en">Название товара EN</span>
                </div>
                <input required class="form-control" type="text" name="name_en" placeholder="Product" aria-label="Имя" aria-describedby="name" value="<?= isset($product) ? current($product)['name_en'] : '' ?>">
            </div>

            <div class="input-group mb-2">
                <div class="input-group-prepend">
                    <label class="input-group-text" for="inputGroupSelect01">Категория</label>
                </div>

                <select class="custom-select" id="inputGroupSelect01" required name="category_id">
                    <option value="">Выбрать...</option>
                    <? foreach ($categories as $cat_id => $cat_node) : ?>
                        <option value="<?= $cat_id ?>" <?= isset($product) ? (current($product)['category_id'] == $cat_id ? 'selected' : '') : '' ?>><?= $cat_node['name'] ?></option>
                    <? endforeach ?>
                </select>
            </div>



            <input type="hidden" name="description">
            <div class="card mb-2">
                <div class="card-header">
                    Описание RU
                </div>
                <div class="card-body p-0">
                    <div class="d-block" id="description">
                    </div>
                </div>
            </div>

            <input type="hidden" name="description_en">
            <div class="card mb-2">
                <div class="card-header">
                    Описание EN
                </div>
                <div class="card-body p-0">
                    <div class="d-block" id="description_en">

                    </div>
                </div>
            </div>

            <? if (!isset($product) or isset($copy)) : ?>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Цена товара</span>
                    </div>
                    <input type="number" class="form-control" placeholder="RU" name="price" required value="">
                    <input type="number" class="form-control" placeholder="EN" name="price_en" required value="">

                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Количество на складе</span>
                    </div>
                    <input type="number" class="form-control" placeholder="Количество" name="quantity" required value="">
                </div>
            <? endif ?>
            <?php if (isset($product) and !isset($copy)) : ?>
                <div class="row">
                    <div class="col-12">
                        <p>Текущие изображения товара</p>

                        <? foreach (json_decode(current($product)['images']) as $path) : ?>
                            <p>
                                <img src="/<?= $path ?>" alt="Изображение товара" class="img-fluid">
                            </p>
                        <? endforeach ?>
                    </div>
                </div>
            <?php endif ?>
            <div class="mb-3">
                <label for="images">Изображения для товара</label>
                <input type="file" name="images[]" <?= (isset($product) and !isset($copy)) ? '' : "required" ?> multiple='1'>
            </div>
            <?php if (isset($product) and !isset($copy)) : ?>
                <div class="row">
                    <div class="col-12">
                        <p>Текущие обрезанные изображения товара</p>

                        <? foreach (json_decode(current($product)['images_min']) as $path) : ?>
                            <p>
                                <img src="/<?= $path ?>" alt="Изображение товара" class="img-fluid">
                            </p>
                        <? endforeach ?>
                    </div>
                </div>
            <?php endif ?>
            <div class="">
                <label for="images">Изображение обрезанное</label>
                <input type="file" name="images_min[]" <?= (isset($product) and !isset($copy)) ? '' : "required" ?>>
            </div>

            <button type="submit" class="btn btn-primary mb-5">Подтвердить</button>
        </div>

    </div>

</form>
<?php ob_start(); ?>
<script src="/public/admin/scripts/htmleditor/quill.js"></script>
<script>
    let quill1 = new Quill('#description', {

        theme: 'snow',
        placeholder: 'Описание'
    });

    let quill2 = new Quill('#description_en', {

        theme: 'snow',
        placeholder: 'Описание'
    });


    let form = document.querySelector("form");

    form.onsubmit = function() {
        let description = document.querySelector('input[name=description]');
        let description_en = document.querySelector('input[name=description_en]');

        let str = document.querySelector('#description>.ql-editor').innerHTML;
        let str_en = document.querySelector('#description_en>.ql-editor').innerHTML;

        description.value = str;
        description_en.value = str_en;
    }

    <?php if (isset($product)) : ?>
        let desc = document.querySelector('#description>.ql-editor');
        let desc_en = document.querySelector('#description_en>.ql-editor');

        let text = (<?= json_encode(current($product)['description'], JSON_UNESCAPED_UNICODE) ?>);
        let text_en = (<?= json_encode(current($product)['description_en'], JSON_UNESCAPED_UNICODE) ?>);
        console.log(text);
        console.log(text_en);

        desc.innerHTML = text;
        desc_en.innerHTML = text_en;
    <?php endif ?>
</script>
<?php $scripts = ob_get_clean();
