<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="shortcut icon" href="/public/images/logo/logo.svg" type="image/svg+xml">
    <link rel="stylesheet" href="/public/styles/default.css">

    <script src="/public/scripts/bootstrap.bundle.min.js"></script>
    <title><?= $title ?></title>
</head>

<body>
    <header>
        <div class="container-fluid container-lg">
            <div class="row justify-content-between align-items-center">
                <div class="col-12 col-md-auto brand py-3">
                    <a href="/" class="row align-items-center justify-content-center text-center">
                        <div class="col-auto logo pr-sm-0">
                            <img src="/public/images/logo/logo.svg" alt="Brand Logo">
                        </div>
                        <div class="col-auto brand-text">
                            <p>Кот и пёс</p>
                            <p>Товары для животных</p>
                        </div>
                    </a>
                </div>
                <div class="col-auto phone d-none d-xl-block">
                    <a class="icon icon-phone-alt-solid" href="tel:+79780092499"></a>+7 (978) 009 24 99
                </div>
                <div class="col-12 col-sm-6 col-md-auto pages">
                    <div class="row justify-content-center">
                        <div class="dropdown">
                            <button class="btn dropdown-toggle" type="button" id="qwertyt" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Клиентский сервис
                            </button>
                            <div class="dropdown-menu" aria-labelledby="qwertyt">
                                <a class="dropdown-item" href="#">Как заказать</a>
                                <a class="dropdown-item" href="#">Доставка и оплата</a>
                                <a class="dropdown-item" href="#">Обмен и возврат</a>
                            </div>
                        </div>
                        <div class="dropdown">
                            <button type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown" data-display="static" aria-haspopup="true" aria-expanded="false">О нас</button>
                            <div class="dropdown-menu dropdown-menu-right dropdown-menu-lg-left">
                                <a class="dropdown-item" href="#">О компании</a>
                                <a class="dropdown-item" href="#">Политика конфиденциальности</a>
                                <div class="dropdown-divider d-block d-lg-none"></div>
                                <a class="dropdown-item d-block d-xl-none" href="tel:+79780092499">
                                    <div class="row align-items-center">
                                        <span class="col-auto pr-1 icon icon-phone-alt-solid"></span>
                                        <strong>+7 (978) 009 24 99</strong>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-md-auto cart">
                    <a class="row align-items-center justify-content-end" href="/cart">
                        <!-- <a href="#" class="col-auto pr-0 px-md-0 icon icon-user"></a> -->
                        <span class="col-auto pr-0 icon icon-shopping-cart-solid"></span>
                        <?php $cart_quant = $shop->user->cart->getQuantity() ?>
                        <span class="col-auto pl-1">Корзина
                            <?= $cart_quant > 99 ? '99+' : "($cart_quant)" ?></span>
                    </a>
                </div>
            </div>


        </div>
        <div class="bg-primary">
            <div class="container-fluid container-lg">
                <div class="navig row">
                    <div class="col">
                        <nav class="navbar px-0 navbar-expand-md navbar-dark ">
                            <span class="ml-auto d-block d-md-none">
                                Категории:
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#uppernavbar" aria-controls="uppernavbar" aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                </button>
                            </span>
                            <div class="collapse navbar-collapse row" id="uppernavbar">
                                <ul class="nav">
                                    <?= $categories->getHtml() ?>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Основной контейнер -->
    <div class="container-lg container-fluid main-cont">
        <!-- Хлебные крошки -->
        <!-- <? if(isset($category_id)AND((int)$category_id)):?>
        
        <nav class="row" aria-label="breadcrumb">
            <ol class="col-12 breadcrumb">
                <li class="breadcrumb-item"><a href="/">Главная</a></li>
                <?$arr = $categories->breadcrumbs_array($category_id);
                    foreach ($arr as $id => $value) :?>
                <li class="breadcrumb-item"><a href="/catalog?category_id=<?= $id ?>"><?= $value['name'] ?></a></li>
                <? endforeach ?>
            </ol>
        </nav>
        
        <? endif ?>-->
        <!-- конец Хлебные крошки -->
        <!-- Контент -->
        <?php echo $content; ?>
    </div>
    <footer class="bg-dark">
        <div class="container-fluid container-lg">
            <div class="row justify-content-between py-5">
                <div class="col-auto pb-4 pb-md-0">Все права защищены © 2020</div>
                <div class="col-auto pb-4 pb-md-0 text-center">
                    <a href="/categorii.html">Одежда<br></a>
                    <a href="/categorii.html">Обуфь<br></a>
                    <a href="/categorii.html">Сумки<br></a>
                    <a href="/categorii.html">Зимние куртки<br></a>
                    <a href="/categorii.html">Плащи<br></a>
                </div>
                <div class="col-auto pb-4 pb-md-0 text-center">
                    <a href="/categorii.html">Дублёнки<br></a>
                    <a href="/categorii.html">Платья<br></a>
                    <a href="/categorii.html">Штаны<br></a>
                    <a href="/categorii.html">Туфли<br></a>
                    <a href="/categorii.html">Кроссовки<br></a>
                </div>
                <div class="col-auto pb-4 pb-md-0 text-right">
                    Юра и компания <br>
                    Юрий Мосензов и Алексей Антонов<br>
                    89153389999<br>
                    Улица Пушкина дом Калатушкита<br>
                    antonovpro@yandex.ru<br>
                    vk
                </div>
            </div>
        </div>
    </footer>
    <script src="/public/scripts/jquery-3.5.1.min.js"></script>

    <script src="/public/scripts/popper.min.js"></script>
    <script src="/public/scripts/bootstrap.min.js"></script>
    <?php
    if (isset($script)) echo $script;
    ?>
</body>

</html>