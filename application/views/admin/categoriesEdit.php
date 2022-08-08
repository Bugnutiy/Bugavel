<?php ob_start() ?>
<link href="" rel="stylesheet">
<link rel="stylesheet" href="/public/admin/styles/htmleditor/quill.snow.css">
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

<form method="post" action="/admin/categories/edit<?=isset($_GET['id'])?'?id='.$_GET['id']:''?><?=isset($_GET['copy'])?'&copy=1':''?>" enctype="multipart/form-data">
    <div class="row justify-content-center">

        <h2><?= $header ?></h2>
        <div class="w-100"></div>

        <div class="col-12 col-md-6">
            <?php if (isset($category) and !isset($copy)) : ?>
                <input type="hidden" name="id" value="<?= key($category) ?>">
            <?php endif ?>

            <div class="input-group mb-2">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="name">Название категории RU</span>
                </div>
                <input required class="form-control" type="text" name="name" placeholder="Категория" aria-label="Имя" aria-describedby="name" value="<?= isset($category) ? current($category)['name'] : '' ?>">
            </div>

            <div class="input-group mb-2">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="name">Название категории EN</span>
                </div>
                <input required class="form-control" type="text" name="name_en" placeholder="Категория" aria-label="Имя" aria-describedby="name" value="<?= isset($category) ? current($category)['name_en'] : '' ?>">
            </div>

            <div class="input- mb-2">
                <div class="mb-3">
                  <label for="product_video" class="form-label">Видео</label>
                  <textarea class="form-control" name="videos" id="product_video" rows="3" placeholder="код iframe для вставки видео"><?= isset($category) ? current($category)['videos'] : '' ?></textarea>
                </div>
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
            <?php if (isset($category) and !isset($copy)) : ?>
                <div class="row">
                    <div class="col-12">
                        <p>Текущее изображение категории</p>
                        <img src="/<?= current(json_decode(current($category)['images'], 1)) ?>" alt="Изображение категории" class="img-fluid">
                    </div>
                </div>
            <?php endif ?>
            <div class="">
                <label for="images">Изображение для категории</label>
                <input type="file" name="images[]" <?= (isset($category) and !isset($copy)) ? '' : "required" ?>>
            </div>

            <button type="submit" class="btn btn-primary">Подтвердить</button>
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
        placeholder: 'Description'
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

    <?php if (isset($category)) : ?>
        let desc = document.querySelector('#description>.ql-editor');
        let desc_en = document.querySelector('#description_en>.ql-editor');

        let text = (<?= json_encode(current($category)['description'], JSON_UNESCAPED_UNICODE) ?>);
        let text_en = (<?= json_encode(current($category)['description_en'], JSON_UNESCAPED_UNICODE) ?>);
        console.log(text);
        console.log(text_en);

        desc.innerHTML = text;
        desc_en.innerHTML = text_en;
    <?php endif ?>
</script>
<?php $scripts = ob_get_clean();
