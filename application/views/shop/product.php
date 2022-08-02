<?php
$photos = json_decode($product['product']['photos'], true);
if (!empty($cart_answer)) : ?>

    <?php if ($cart_answer) : ?>
        <div class="row alert alert-success alert-dismissible fade show" role="alert">
            <span>Товар добавлен в корзину <strong>успешно</strong></span>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    <?php else : ?>
        <div class="row alert alert-danger alert-dismissible fade show" role="alert">
            <span><strong>Произошла ошибка!</strong> Предлагаем вам веруться на <strong><a href="/">главную страницу</a></strong></span>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    <?php endif ?>

<?php endif ?>

<div class="row product">
    <!-- Фото -->
    <div class="card col-lg-4">
        <div class="carousel slide" data-ride="carousel" id="photoCarousel" data-interval="0">

            <div class="carousel-inner">
                <?php $k = 0;
                foreach ($photos as $photo_name) : ?>
                    <div class="carousel-item <?= $k ? '' : 'active' ?>">
                        <img src="/public/images/photos/<?= $photo_name ?>" class="d-block w-100" alt="Фото товара">
                    </div>
                <?php $k++;
                endforeach ?>

            </div>
            <?php if (count($photos) > 1) : ?>
                <ol class="carousel-indicators">
                    <?php $k = 0;
                    foreach ($photos as $photo_name) : ?>
                        <li data-target="#photoCarousel" data-slide-to="<?= $k ?>" class="<?= $k ? '' : 'active' ?>"></li>

                    <?php $k++;
                    endforeach ?>
                </ol>
            <?php endif ?>
        </div>

    </div>
    <!--Конец Фото -->
    <!-- Текст товара -->
    <div class="col-lg-8">
        <div class="card  text-cont">

            <div class="card-body">
                <h4 class="name"><?= $product['product']['name'] ?></h4>
            </div>
            <!-- Конец текст товара -->
            <!-- Параметры товара -->
            <?php
            $different = $product['data_struct']['different'];
            $suffix = '';
            if ($different === 'Вес' or $different === 'вес') {
                $suffix = ' кг';
            }
            ?>
            <div class="card-footer">
                <!-- Форма -->
                <form action="/product?id=<?= $_GET['id'] ?>" method="POST">
                    <!-- Hidden Информация -->

                    <input type="hidden" name="product_id" value="<?= $_GET['id'] ?>">
                    <!-- Конец Hidden Информация -->
                    <!-- Строка экземпляра товара -->
                    <?php $k = 0;
                    foreach (array_reverse($product['samples'], true) as $sample_id => $product_sample) : ?>
                        <?php if ($different === 'Вес' or $different === 'вес') {
                            $product_sample[$different] = rtrim($product_sample[$different], '0');
                            $product_sample[$different] = rtrim($product_sample[$different], '.');
                        }
                        ?>
                        <!--  HTML Строка экземпляра товара -->
                        <label class="row product-property justify-content-between align-items-center cursor-pointer" id="product-property<?= $k ?>">
                            <div class="col-auto col-sm">
                                <!-- Radio -->
                                <input required type="radio" name="property_id" value="<?= $sample_id ?>" id="property<?= $k ?>" onclick="quantchange(<?= $k ?>)">
                                <!--  -->
                                <!-- Different -->
                                <span class="different-text"><?= $product_sample[$different] . $suffix ?></span>
                                <!--  -->
                            </div>
                            <!-- Цена -->
                            <div class="col-auto col-sm text-right">
                                <span class="price" id="price<?= $k ?>"><?= $product_sample['цена'] ?></span>
                                <span class="price-suff">руб.</span>
                            </div>
                            <!--  -->
                            <!-- Количество -->
                            <div class="col">
                                <div class="row justify-content-end align-items-center">
                                    <div class="col-auto">
                                        <div class="input-group">
                                            <!-- Кнопка - -->
                                            <div class="input-group-prepend">
                                                <button class="btn btn-outline-primary" type="button" id="minus<?= $k ?>" onclick="minusbtn(<?= $k ?>)"><a>-</a></button>
                                            </div>
                                            <!--  -->
                                            <!-- Поле ввода -->
                                            <input required id="quantity<?= $k ?>" class="form-control" type="number" min="1" max="100" name="quantity[<?= $sample_id ?>]" value="1" onchange="quantchange(<?= $k ?>)">
                                            <!--  -->
                                            <!-- Кнопка + -->
                                            <div class="input-group-append">
                                                <button class="btn btn-outline-primary" type="button" id="plus<?= $k ?>" onclick="plusbtn(<?= $k ?>)"><a>+</a></button>
                                            </div>
                                            <!--  -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--  -->
                            <!-- Наличие товара -->
                            <div class="col-auto avaliable">
                                <?php if ($product_sample['количество'] > 0) : ?>
                                    <div class="row align-items-center icon-container justify-content-end">
                                        <a class="icon icon-check-circle"></a>
                                        <div class="col-auto text-success"> Есть в наличии</div>
                                    </div>
                                <?php else : ?>
                                    <div class="row align-items-center icon-container justify-content-end">
                                        <a class="icon icon-exclamation-circle-solid"></a>
                                        <div class="col-auto text-danger"> Нет в наличии</div>
                                    </div>
                                <?php endif ?>
                            </div>
                            <!--  -->
                        </label>
                        <!-- Конец HTML строка экземпляра товара -->
                    <?php $k++;
                    endforeach ?>
                    <!-- Конец строка экземпляра товара -->
                    <!-- Калькулятор -->
                    <div class="row itog justify-content-end text-right align-items-center">
                        <div class="col-12 col-md-auto">
                            <div class="">
                                <span>Итого: <span id='quant'>0</span> шт.</span>
                            </div>

                            <div class="">
                                <span>На сумму: <span id='cost'>0</span> руб</span>
                            </div>
                        </div>
                        <!-- Добавить в корзину -->
                        <div class="col-12 col-md-auto">
                            <button type="submit" value="1" class="btn btn-primary">
                                <span class="row align-items-center icon-container">
                                    <span class="col-auto pr-0 icon icon-shopping-cart-solid"></span>
                                    <span class="col-auto">Добавить в корзину</span>
                                </span>
                            </button>
                        </div>
                        <!-- Конец Добавить в корзину -->
                    </div>
                    <!-- Конец Калькулятор -->
                </form>
                <!-- Конец Форма -->
            </div>
        </div>
    </div>
    <!-- Конец текст товара -->
    <!-- Описание -->
    <div class="col-12 description mt-5">
        <!-- Вкладки -->
        <ul class="nav nav-tabs" id="description_tabs" role="tablist">
            <li class="nav-item" role="presentation">
                <a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="false">Описание</a>
            </li>

            <li class="nav-item" role="presentation">
                <a class="nav-link" id="specifications-tab" data-toggle="tab" href="#specifications" role="tab" aria-controls="specifications" aria-selected="true">Характеристики</a>
            </li>
        </ul>
        <!-- Контент вкладок -->
        <div class="tab-content" id="myTabContent">
            <!-- Вкладка описание -->
            <div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
                <h4 class="my-3 font-weight-bold text-primary">Коротко о товаре</h4>
                <?= $product['product']['description'] ?>
            </div>
            <!--  -->
            <!-- Характеристики -->
            <div class="tab-pane fade col-12" id="specifications" role="tabpanel" aria-labelledby="specifications-tab">

                <?php foreach ($product['data_struct']['fields'] as $property_name => $settings) : ?>
                    <?if($settings['filter_type']!=='NONE' AND !in_array($property_name,['цена','количество', $different])) :?>
                    <div class="row horizont justify-content-between">
                        <!-- Название свойства -->
                        <div class="col-auto property-name">
                            <?= $property_name ?>
                        </div>
                        <!--  -->
                        <!-- Значение свойства -->
                        <div class="col-3 property-val text-right">
                            <?php
                            switch ($settings['data_type']) {
                                case 'BOOLEAN':
                                    switch ($settings['filter_type']) {
                                        case 'value': ?>
                                            # code...
                                        <?php break;
                                        default: ?>
                                            <?= $product_sample[$property_name] ? 'Да' : 'Нет' ?>
                                    <?php break;
                                    }
                                    break;
                                default: ?>
                                    <?= $product_sample[$property_name] ?>
                            <?php break;
                            }
                            ?>
                        </div>
                        <!-- Конец значение свойства -->
                    </div>
                    <?endif?>
                <?php //dd($product);
                endforeach ?>

            </div>
            <!-- Конец Характеристики -->
        </div>
        <!-- конец Вкладки -->
    </div>
    <!-- Конец описание -->
</div>

<?php
// Блок скриптов
$script = '';
ob_start();
?>
<script>
    function minusbtn(id) {
        //radio = document.getElementById('property' + id);
        //radio.checked = true;
        //price = document.getElementById('price' + id).innerHTML;
        quantity_el = document.getElementById('quantity' + id);

        quantity = quantity_el.value;
        console.log(quantity);
        //quantity--;

        quantity_el.value = --quantity;

        quantchange(id);
        //console.log(quantity);
    }

    function plusbtn(id) {
        //radio = document.getElementById('property' + id);
        //radio.checked = true;

        quantity_el = document.getElementById('quantity' + id);
        console.log(quantity_el);
        quantity = quantity_el.value;
        quantity_el.value = ++quantity;
        //quantity_el.setAttribute('value', ++quantity);

        quantchange(id);
        //console.log(quantity);
    }

    function quantchange(id) {
        try {
            prevl = document.querySelector('.product-property[active]');
            prevl.removeAttribute('active');
        } catch (error) {

        }

        label = document.getElementById('product-property' + id)
        label.setAttribute('active', '');
        radio = document.getElementById('property' + id);
        radio.checked = true;

        price = document.getElementById('price' + id).innerHTML;
        quantity_el = document.getElementById('quantity' + id)
        quantity = quantity_el.value;
        if (quantity < 1) {
            quantity = 1;
            quantity_el.value = 1;
        }
        if (quantity > 100) {
            quantity = 100;
            quantity_el.value = 100;
        }

        quantity_el.setAttribute('value', quantity);

        cost = price * quantity;
        cost_el = document.getElementById('cost');
        quant_el = document.getElementById('quant');

        quant_el.innerHTML = quantity;
        cost_el.innerHTML = cost.toFixed(2);
    }
</script>
<?php
$script = ob_get_clean();
?>