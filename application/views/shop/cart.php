<div class="row">
    <div class="col-12">
        <h2>Корзина</h2>
    </div>
</div>
<?php if (!empty($cart)) : ?>
    <div class="row justify-content-center cart">
        <!-- Корзина -->

        <div class="col-12 col-md-10 col-lg-12 ">
            <!-- Экземпляр -->
            <?php $cost = 0;
            foreach ($cart as $cart_id => $cart_node) : ?>
                <?//dd(current(json_decode($cart_node['product']['photos'],true)))  //Фото
            //dd(current($cart_node['samples'])['количество'])  //количество
            // dd(current($cart_node['samples'])['цена']); //цена
            //dd($cart_node['quantity']); //количество
            // dd($cart_node);
            ?>
                <div class="row sample m-0">
                    <!-- Фото -->
                    <div class="col-2 col-sm-1 p-0">
                        <div class="col-name">Фото</div>
                        <img class="img-fluid" src="/public/images/photos/<?= current(json_decode($cart_node['product']['photos'], true)) ?>" alt="Фото товара">
                    </div>
                    <!-- -->
                    <!-- Наименование -->
                    <div class="col col-lg">
                        <div class="col-name">Наименование</div>
                        <h5><a href="/product?id=<?= $cart_node['product']['id'] ?>"><?= $cart_node['product']['name'] ?></a></h5>
                    </div>
                    <!--  -->

                    <!-- Наличие -->
                    <div class="col-auto  avaliable">
                        <div class="col-name">Наличие</div>

                        <div class="row align-items-center justify-content-end">
                            <?php if (current($cart_node['samples'])['количество'] > 0) : ?>
                                <a class="col-auto pr-0 icon icon-check-circle"></a>
                                <div class="col-auto pl-1 text-success"> Есть в наличии</div>
                            <?php else : ?>
                                <a class="col-auto pr-0 icon icon-exclamation-circle-solid"></a>
                                <div class="col-auto pl-1 text-danger"> Нет в наличии</div>
                            <?php endif ?>
                        </div>
                    </div>
                    <!-- Конец наличие -->
                    <!-- Цена -->
                    <div class="w-100 d-block d-lg-none"></div>
                    <div class="col-auto col-lg-auto ">
                        <div class="col-name">Цена</div>
                        <span id="price<?= $cart_id ?>"><?= $price = current($cart_node['samples'])['цена'] ?></span>
                        <span>руб.</span>
                    </div>
                    <!-- Конец цена -->
                    <!-- Количество -->
                    <div class="col-auto ">
                        <div class="col-name">Количество</div>
                        <div class="row justify-content-end align-items-center">
                            <div class="col-auto">
                                <div class="input-group">
                                    <!-- Кнопка - -->
                                    <div class="input-group-prepend">
                                        <button class="btn btn-outline-primary" type="button" id="minus<?= $cart_id ?>" onclick="minusbtn(<?= $cart_id ?>)">-</button>
                                    </div>
                                    <!--  -->
                                    <!-- Поле ввода -->
                                    <input id="sample_quantity<?= $cart_id ?>" class="form-control" type="number" min="1" max="100" name="quantity<?= $cart_id ?>" value="<?= $quantity = rtrim(rtrim($cart_node['quantity'], '0'), '.') ?>" onchange="quantchange(<?= $cart_id ?>)" required>
                                    <!--  -->
                                    <!-- Кнопка + -->
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-primary" type="button" id="plus<?= $cart_id ?>" onclick="plusbtn(<?= $cart_id ?>)"><a>+</a></button>
                                    </div>
                                    <!--  -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- стоимость -->
                    <div class="col-auto ">
                        <div class="col-name">Стоимость</div>
                        <?php $sample_cost = $quantity * $price;
                        $cost += $sample_cost; ?>
                        <span id="sample_cost<?= $cart_id ?>"><?= number_format($sample_cost, '2', '.', '') ?></span> <span>руб.</span>
                    </div>
                    <!-- конец стоимость -->
                    <!-- Удалить -->
                    <div class="col-auto  p-0 text-right">
                        <div class="col-name">Удалить</div>
                        <a href="/cart?del=<?= $cart_id ?>" class="del icon icon-times-circle"></a>
                    </div>
                    <!-- конец удалить -->

                </div>
            <?php endforeach ?>
            <!-- Экземпляр -->
        </div>
        <!-- Конец корзины -->
        <div class="col-12">
            <div class="row justify-content-end align-items-center itog">
                <div class="col-auto">
                    <div class="row">
                        <div class="col-auto quantity">Товаров: <span id="quantity"><?= count($cart) ?></span></div>
                    </div>
                    <div class="row">
                        <div class="col-auto">
                            <h4>На сумму: <span id="cost"><?= number_format($cost, '2', '.', '') ?></span> руб.</h4>
                        </div>
                    </div>
                </div>
                <div class="col-auto"><a href="#morder" class="btn btn-lg btn-success">Оформить заказ</a></div>
            </div>
        </div>
    </div>


    <form action="/order" method="POST">
        <div class="row cart-order" id="morder">

            <div class="col-12 mb-5">
                <h3>Оформление заказа</h3>
            </div>
            <div class="col-12 col-xl-6 left">
                <div class="row delivery-method mb-5">
                    <div class="col">
                        <div class="form-group">

                            <label><input type="radio" id="radio_courier" name="delivery_method" value="Курьер" checked=""> <span>Курьерская доставка (300 р.)</span></label>

                        </div>
                        <div class="form-group">

                            <label><input type="radio" id="radio_self" name="delivery_method" value="Самовывоз"> <span>Самовывоз</span>
                                <p>Комсомольский пр. 1А - будни с 9:30 до 18:00, выходные с 10:00 до 14:00.</p>
                            </label>

                        </div>
                    </div>
                </div>
                <div class="row user mb-5">
                    <div class="col-12 col-md-6">
                        <?//debug($shop->user->getUser())?>
                        <div class="form-group">
                            <label for="user_name" class="required-label">Имя</label>
                            <input id="user_name" class="form-control" type="text" name="user_name" required value="<?= current($shop->user->getUser())['user_name'] ?>">
                        </div>
                    </div>
                    <div class="col-12 col-md-6">
                        <div class="form-group">
                            <label for="online_phone" class="required-label">Телефон</label>

                            <input id="online_phone" name="phone" type="tel" maxlength="50" required="required" value="<?= (!empty(current($shop->user->getUser())['phone']) ? current($shop->user->getUser())['phone'] : '+7(___)___-__-__') ?>" pattern="\+7\s?[\(]{0,1}9[0-9]{2}[\)]{0,1}\s?\d{3}[-]{0,1}\d{2}[-]{0,1}\d{2}" placeholder="+7(___)___-__-__" class="form-control">
                        </div>
                    </div>
                    <div class="col-12 col-md-6">
                        <div class="form-group">
                            <label for="email">Электронная почта</label>
                            <input id="email" class="form-control" type="email" name="email" value="<?= current($shop->user->getUser())['email'] ?>">
                        </div>
                    </div>
                    <div class="col-12 col-md-6">
                        <div class="form-group">
                            <label for="delivery_time">Удобный день и время</label>
                            <input id="delivery_time" class="form-control" type="text" name="delivery_time">
                        </div>
                    </div>
                </div>
                <div class="row address" id="address_container">
                    <div class="col-12 col-md-10">
                        <div class="form-group">
                            <label for="address" class="required-label">Адрес</label>
                            <input id="address" class="form-control" type="text" name="address" required value="<?= current($shop->user->getUser())['address'] ?>">
                        </div>
                    </div>
                    <div class="col-12 col-md-2">
                        <div class="form-group">
                            <label for="apartment">Квартира</label>
                            <input id="apartment" class="form-control" type="text" name="apartment" value="<?= current($shop->user->getUser())['apartment'] ?>">
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="form-group">
                            <label for="additions">Дополнительно</label>
                            <textarea id="additions" class="form-control" name="additions" rows="2" placeholder="Например, номер подъезда"><?= current($shop->user->getUser())['additions'] ?></textarea>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 col-xl-6 right">
                <div class="row mb-5 comment">
                    <div class="col-12">
                        <div class="form-group">
                            <label for="comment">Комментарий к заказу</label>
                            <textarea id="comment" class="form-control" name="comment" rows="3"></textarea>
                        </div>
                    </div>
                    <div class="col-12 col-md-6">
                        <div class="form-group">
                            <label for="info_method">Информирование о заказе</label>
                            <select id="info_method" class="form-control" name="info_method">
                                <option value="Звонок оператора">Звонок оператора</option>
                                <option value="SMS">СМС</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-12">
                        <p class="small">Отправляя данную форму, вы принимаете <a href="/o-nas/politika-konfidencialnosti">условия обработки и использования</a> персональных данных.</p>
                    </div>
                </div>
                <div class="row end">
                    <div class="col-12 col-md-7 total text-right"><span>Итого к оплате:</span> <span id="total"><?= number_format($cost + 300, '2', '.', '') ?></span> <span>руб.</span></div>
                    <div class="col-12 col-md-5 submit text-right">
                        <button class="btn btn-lg btn-success" type="submit">Оформить заказ</button>
                    </div>

                </div>
            </div>

        </div>
    </form>
<?php else : ?>
    <div class="row justify-content-center">
        <div class="col-auto text-center">
            <h3>Ваша корзина пуста!</h3>
            <a href="/" class="btn btn-outline-info">За покупками!</a>
        </div>
    </div>
<?php endif ?>

<!-- Скрипт -->
<?php ob_start() ?>

<script type="text/javascript">
    function show_address() {

        var address_container = document.getElementById("address_container");
        var address = document.getElementById("address");

        address_container.hidden = false;

        address.required = true;

        cost = document.getElementById('cost').innerHTML;
        document.getElementById('total').innerHTML = (Number(cost) + 300).toFixed(2);
        //total = cost + 300;
        console.log(cost);

    }

    function hide_address() {
        console.log(this);
        var address_container = document.getElementById("address_container");
        var address = document.getElementById("address");

        address_container.hidden = true;

        address.required = false;

        cost = document.getElementById('cost').innerHTML;
        document.getElementById('total').innerHTML = (Number(cost)).toFixed(2);
    }
    window.addEventListener("DOMContentLoaded", function() {
        var radio_courier = document.getElementById("radio_courier");
        radio_courier.addEventListener("change", show_address, false);


        var radio_self = document.getElementById("radio_self");
        radio_self.addEventListener("change", hide_address, false);
        //input.focus();
        //setCursorPosition(3, input);
    });
</script>
<script type="text/javascript">
    function setCursorPosition(pos, e) {
        e.focus();
        if (e.setSelectionRange) e.setSelectionRange(pos, pos);
        else if (e.createTextRange) {
            var range = e.createTextRange();
            range.collapse(true);
            range.moveEnd("character", pos);
            range.moveStart("character", pos);
            range.select()
        }
    }

    function mask(e) {
        //console.log('mask',e);
        var matrix = this.placeholder, // .defaultValue
            i = 0,
            def = matrix.replace(/\D/g, ""),
            val = this.value.replace(/\D/g, "");
        def.length >= val.length && (val = def);
        matrix = matrix.replace(/[_\d]/g, function(a) {
            return val.charAt(i++) || "_"
        });
        this.value = matrix;
        i = matrix.lastIndexOf(val.substr(-1));
        i < matrix.length && matrix != this.placeholder ? i++ : i = matrix.indexOf("_");
        setCursorPosition(i, this)
    }
    window.addEventListener("DOMContentLoaded", function() {
        var input = document.querySelector("#online_phone");
        input.addEventListener("input", mask, false);
        //input.focus();
        //setCursorPosition(3, input);
    });
</script>

<script type="text/javascript">
    function minusbtn(id) {
        //radio = document.getElementById('property' + id);
        //radio.checked = true;
        //price = document.getElementById('price' + id).innerHTML;
        quantity_el = document.getElementById('sample_quantity' + id);

        quantity = quantity_el.value;
        //console.log(quantity);
        //quantity--;

        quantity_el.value = --quantity;

        quantchange(id);
        //console.log(quantity);
    }

    function plusbtn(id) {
        //radio = document.getElementById('property' + id);
        //radio.checked = true;

        quantity_el = document.getElementById('sample_quantity' + id);
        //console.log(quantity_el);
        quantity = quantity_el.value;
        quantity_el.value = ++quantity;
        //quantity_el.setAttribute('value', ++quantity);

        quantchange(id);
        //console.log(quantity);
    }

    function dd(dd) {
        console.log(dd);
    }

    function sendQuant(cart_id, quantity) {
        var xhr = new XMLHttpRequest();

        var body = 'cart_id=' + encodeURIComponent(cart_id) +
            '&quantity=' + encodeURIComponent(quantity);

        xhr.open("POST", '/cart/change', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        // xhr.onreadystatechange = ...;

        xhr.send(body);
    }

    function quantchange(id) {
        sample_quantity_el = document.getElementById('sample_quantity' + id);

        sample_quantity = sample_quantity_el.value;
        sample_price = document.getElementById('price' + id).innerHTML;

        //dd(quantity);
        if (sample_quantity < 1) {
            sample_quantity = 1;
            sample_quantity_el.value = 1;
        }
        if (sample_quantity > 100) {
            sample_quantity = 100;
            sample_quantity_el.value = 100;
        }
        sample_cost = (sample_quantity * sample_price).toFixed(2);

        sample_cost_el = document.getElementById('sample_cost' + id);
        sample_cost_el.innerHTML = sample_cost;

        sample_cost_elements = document.querySelectorAll('[id^="sample_cost"]')
        cost = 0;
        k = 0;
        sample_cost_elements.forEach(function(item, i, arr) {
            cost += Number(item.innerHTML);
            k = i + 1;
        });
        //dd(k);
        sendQuant(id, sample_quantity);

        document.getElementById('cost').innerHTML = cost.toFixed(2);
    }
</script>
<script type="text/javascript">
    $('a[href^="#m"]').click(function() {
        var target = $(this).attr('href');
        $('html, body').animate({
            scrollTop: $(target).offset().top
        }, 300);
        return false;
    });
</script>
<?php $script = ob_get_clean(); ?>