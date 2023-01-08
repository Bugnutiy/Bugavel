<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title><?= $title ?></title>
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"> -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <link rel="stylesheet" href="/public/admin/styles/admin.css">
    <?= isset($head) ? $head : '' ?>
</head>

<body class="bg-dark">
    <div class="container bg-dark mb-3">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#"><img src="/public/images/logo/NewLogo1.svg" alt=""></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 text-end">
                        <li class="nav-item mt-3 mt-lg-0">
                            <a class="nav-link" href="/admin/orders">Заказы</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/admin/categories">Категории</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/admin/products">Товары</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="row mx-0">
            <div class="col-12 content bg-light pt-3 pb-4 mt-2">
                <nav aria-label="breadcrumb ">
                    <ol class="breadcrumb">
                        <?php if (!empty($bcr)) : ?>
                            <?php foreach ($bcr as $key => $value) : ?>
                                <?php if (is_string(next($bcr))) : ?>
                                    <li class="breadcrumb-item"><a href="<?= $value ?>"><?= $key ?></a></li>
                                <?php else : ?>
                                    <li class="breadcrumb-item active" aria-current="page"><?= $value ?></li>
                                <?php endif ?>
                            <?php endforeach ?>
                        <?php endif; ?>
                    </ol>
                </nav>

                <?= $content ?>
            </div>
        </div>
    </div>




    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <?= isset($scripts) ? $scripts : '' ?>
</body>

</html>