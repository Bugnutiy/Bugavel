<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title><?= $title ?></title>
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"> -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <link rel="stylesheet" href="/public/styles/admin.css">
    <?= isset($head) ? $head : '' ?>
</head>

<body>
    <div class="container-fluid">
        <div class="row">
            <div class="d-none d-md-block col-12 col-md-4 col-lg-3 col-xl-2"></div>
            <div class="col-12 col-md-4 col-lg-3 col-xl-2 left">
                <div class="row logo">
                    <div class="col-12 p-md-3"><img src="/public/images/logo/logo.png" class="img-fluid" alt=""></div>
                </div>
                <div class="row justify-content-end">
                    <div class="col-auto pb-2">
                        <button class="btn d-md-none p-0" type="button" data-toggle="collapse" data-target="#lnav" aria-controls="lnav" aria-expanded="false" aria-label="Переключить навигацию">
                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30" role="img" focusable="false">
                                <title>Меню</title>
                                <path stroke="currentColor" stroke-linecap="round" stroke-miterlimit="10" stroke-width="2" d="M4 7h22M4 15h22M4 23h22"></path>
                            </svg>
                        </button>
                    </div>
                </div>
                <div class="collapse d-md-block" id="lnav">
                    <div class="row justify-content-around">
                        <a href="/admin/orders" class="col-md-12 col-5 pt-4 pb-4 pt-md-2 pb-md-2 text-center text-uppercase">Заказы</a>
                        <a href="/admin/categories" class="col-md-12 col-5 pt-4 pb-4 pt-md-2 pb-md-2 text-center text-uppercase">Категории</a>
                        <a href="/admin/products" class="col-md-12 col-5 pt-4 pb-4 pt-md-2 pb-md-2 text-center text-uppercase">Товары</a>
                        <a href="/admin/sber" class="col-md-12 col-5 pt-4 pb-4 pt-md-2 pb-md-2 text-center text-uppercase">Сбер</a>
                        <a href="/admin/modul" class="col-md-12 col-5 pt-4 pb-4 pt-md-2 pb-md-2 text-center text-uppercase">Модуль</a>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-8 col-lg-9 col-xl-10 content ">
                <nav aria-label="breadcrumb">
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

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script> -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>   -->
    <script src="https://bootstrap-4.ru/docs/4.6/dist/js/bootstrap.bundle.min.js"></script> 
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> -->


    <?= isset($scripts) ? $scripts : '' ?>
</body>

</html>