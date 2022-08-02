<!-- <div class="container"> -->

<h1>Статус</h1>
<form action="" method="POST">
    <input type="hidden" name="order_id" value="<?= $_GET['id'] ?>">
    <select name="state[state]" id="state">
        <?php foreach ($shop::ORDER_STATES as $value) : ?> <option value="<?= $value ?>" <?= (!empty($order['state']) and $order['state'] == $value) ? 'selected' : '' ?>><?= $value ?></option>
        <?php endforeach ?>
    </select>
    <div class="form-check">
        <input id="cancel" class="form-check-input" type="checkbox" name="state[cancel]" value="true" <?= $order['canceled'] ? 'checked' : '' ?>>
        <label for="cancel" class="form-check-label">Отмена</label>
    </div>
    <div class="form-check">
        <input id="payment_state" class="form-check-input" type="checkbox" name="state[payment_state]" value="true" <?= $order['payment_state'] ? 'checked' : '' ?>>
        <label for="payment_state" class="form-check-label">Оплачен</label>
    </div>
    <button type="submit">Подтвердить</button>
</form>
<h1 class="mt-5">Информация о пользователе</h1>
<form action="" method="POST">
    <input type="hidden" name="order_id" value="<?= $_GET['id'] ?>">
    <table class="table table-striped">
        <thead class="thead-light">
            <tr>
                <th scope="col">UserId</th>
                <th scope="col">Имя пользователя</th>
                <th scope="col">Телефон</th>
                <th scope="col">Электронная почта</th>
                <th scope="col">Метод доставки</th>
                <th scope="col">Время доставки</th>
                <th scope="col">Метод общения</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><?= $order['user_id'] ?></td>
                <td><input type="text" class="form-control" name="user[user_name]" id="" value="<?= $order['user_name'] ?>"></td>
                <td><input type="text" class="form-control" name="user[phone]" value="<?= $order['phone'] ?>" id=""></td>
                <td><input type="email" class="form-control" name="user[email]" value="<?= $order['email'] ?>" id=""></td>
                <td><select name="user[delivery_method]" class="form-control" id="">
                        <option value="Курьер" <?= $order['delivery_method'] == 'Курьер' ? 'selected' : '' ?>>Курьер</option>
                        <option value="Самовывоз" <?= $order['delivery_method'] != 'Курьер' ? 'selected' : '' ?>>Самовывоз</option>
                    </select></td>
                <td><input type="text" class="form-control" name="user[delivery_time]" value="<?= $order['delivery_time'] ?>" id=""></td>
                <td>
                    <select name="user[info_method]" class="form-control" id="">
                        <option value="Звонок оператора" <?= $order['info_method'] == 'Звонок оператора' ? 'selected' : '' ?>>Звонок оператора</option>
                        <option value="SMS" <?= $order['info_method'] != 'Звонок оператора' ? 'selected' : '' ?>>SMS</option>
                    </select>
                </td>


            </tr>
        </tbody>
    </table>
    <table class="table table-striped">
        <thead class="thead-light">
            <th scope="col">Адрес</th>
            <th scope="col">Квартира</th>
            <th scope="col">Дополнительно</th>
            <th scope="col">Комментарий</th>
        </thead>
        <tbody>
            <td>
                <textarea class="form-control" name="user[address]" id="" cols="30" rows="2"><?= $order['address'] ?></textarea>
            </td>
            <td><input class="form-control" type="text" name="user[apartment]" value="<?= $order['apartment'] ?>" id=""></td>
            <td><input class="form-control" type="text" name="user[additions]" value="<?= $order['additions'] ?>" id=""></td>
            <td><textarea name="user[comment]" class="form-control" id="" cols="30" rows="2"><?= $order['comment'] ?></textarea>

            </td>
        </tbody>
    </table>
    <button type="submit">Подтвердить</button>

</form>
<h1 class="mt-5">Информация о товарах</h1>
<form action="" method="POST">
    <input type="hidden" name="order_id" value="<?= $_GET['id'] ?>">
    <table class="table table-striped table-bordered">
        <thead class="thead-light">
            <tr>
                <th>id товара</th>
                <th>id экземпляра</th>
                <th>Название товара</th>
                <th>Тип</th>
                <th>Количество</th>
                <th>Количество <br> На складе</th>
                <th>Цена</th>
                <th>Стоимость</th>
                <th>Действия</th>
            </tr>
        </thead>
        <tbody>
            <?php $cost = 0;
            foreach ($order['cart'] as $cart_id => $cart_node) : ?>
                <?php $product_id = $cart_node['product_id'];
                $sample_id = $cart_node['property_id'];
                $quantity = $cart_node['quantity'];
                $allaboutproduct = $shop->AllAboutProduct($product_id);

                $product = $allaboutproduct['product'];
                $category = $allaboutproduct['category'];
                $datastruct;
                $samples = $allaboutproduct['samples'];

                $different = $allaboutproduct['data_struct']['different'];
                //dd($cart_id);
                ?>
                <tr>
                    <!-- id продукта -->
                    <td>
                        <!-- <input type="hidden" name="cart[<?= $cart_id ?>][product_id]" value="<?= $product_id ?>"> -->
                        <?= $product_id ?>
                    </td>
                    <!-- ид свойства -->
                    <td><?= $sample_id ?></td>
                    <!-- название продукта -->
                    <td><?= $product['name'] ?></td>
                    <!-- Тип samples different -->
                    <td>
                        <select class="form-control" name="cart[<?= $cart_id ?>][property_id]">
                            <?php foreach ($samples as $samp_id => $samp_node) : ?>
                                <option <?= $samples[$sample_id][$different] == $samp_node[$different] ? 'selected' : '' ?> value="<?= $samp_id ?>"><?= $samp_node[$different] . ($different == 'Вес' ? ' кг' : '') ?>
                                </option>
                            <?php endforeach ?>
                        </select>
                    </td>

                    <td><input type="number" min='1' name="cart[<?= $cart_id ?>][quantity]" class='form-control' id="" value="<?= number_format($quantity, '0', '.', '') ?>"></td>
                    <td <?= $quantity > $samples[$sample_id]['количество'] ? 'class="danger"' : '' ?>><?= $samples[$sample_id]['количество'] ?></td>
                    <td><?= $samples[$sample_id]['цена'] ?></td>
                    <td>
                        <? $cost+= $quantity * $samples[$sample_id]['цена'];
                echo number_format($quantity * $samples[$sample_id]['цена'], 2, '.', ''); ?>
                    </td>
                    <!-- Действия -->
                    <td>
                        <button class="btn btn-link p-0" type="submit" name="submit" value="<?= $cart_id ?>"><span class="icon icon-save"></span></button>/<button class="btn btn-link p-0" type="submit" name="delete" value="<?= $cart_id ?>"><span class="icon icon-times-circle"></span></button>
                    </td>
                </tr>
            <?php endforeach ?>

            <tr>
                <td colspan="6"></td>
                <th>Предварительный итог</th>
                <th><?= number_format($cost, 2, '.', '') ?></th>
            </tr>
            <tr>
                <td colspan="6"></td>
                <th>Доставка</th>
                <th><?= $order['delivery_method'] == 'Курьер' ? '300 руб.' : '0 руб.' ?></th>
            </tr>
            <tr>
                <td colspan="6"></td>
                <th>Итог:</th>
                <th><?=
                    $order['delivery_method'] == 'Курьер' ? number_format($cost += 300, 2, '.', '') : number_format($cost, 2, '.', '')
                    ?></th>
            </tr>
        </tbody>
    </table>
</form>




<!-- </div> -->