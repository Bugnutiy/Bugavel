<? $cart = json_decode(current($order)['cart'], 1);
?>

<div class="row products_main">
  <div class="col-12">
    <form action="/admin/orders/edit" enctype="multipart/form-data" method="POST">
      <input type="hidden" name='id' value="<?= $_GET['id'] ?>">
      <h1>Корзина / Cart</h1>
      <? foreach ($cart as $cart_id => $cart_node) : ?>
        <div class="row cart mb-3">
          <div class="col-auto name">
            Товар: <b><a href="/catalog/product?id=<?= $cart_node['product_id'] ?>"><?= $products[$cart_node['product_id']]['name'] ?></a></b><br>
            Вариация: <?= $properties[$cart_node['property_id']]['name'] ?>
          </div>
          <div class="col-auto quant">
            Кол-во:<br>
            <input type="number" name="cart[<?= $cart_id ?>][quantity]" class="form-control" value="<?= $cart_node['quantity'] ?>">
          </div>

        </div>
      <? endforeach ?>
      <button type="submit">Submit</button>
      <hr>
      <h1>Заказ</h1>
      <div class="row">
        <div class="mb-3 col-12 col-sm">
          <label for="order_first_name" class="form-label required">Имя</label>
          <input type="text" required class="form-control" name="first_name" id="order_first_name" value="<?= current($order)['first_name'] ?>">
        </div>
        <div class="mb-3 col-12 col-sm">
          <label for="order_second_name" class="form-label required">Фамилия</label>

          <input type="text" required class="form-control" name="second_name" id="order_second_name" placeholder="<?= current($order)['lang'] == 'RU' ? 'Фамилия' : 'Second name' ?>" value="<?= current($order)['second_name'] ?>">
        </div>
      </div>

      <!-- Email -->
      <div class="mb-3">
        <label for="order_email" class="form-label required">E-mail</label>
        <input type="email" required class="form-control" name="email" id="order_email" placeholder="<?= current($order)['lang'] == 'RU' ? 'Введите вашу электронную почту' : 'Type your e-mail here' ?>" value="<?= current($order)['email'] ?>">
      </div>

      <!-- PHONE -->
      <div class="mb-3 phone">
        <link rel="stylesheet" href="/public/intltel/css/intlTelInput.min.css">

        <label for="order_phone" class="form-label required"><?= current($order)['lang'] == 'RU' ? 'Номер телефона' : 'Phone number' ?></label>
        <input type="tel" class="form-control" name="phone" id="order_phone" required value="<?= current($order)['phone'] ?>">
        <span id="order_valid-msg" class="d-none text-success">✓ Valid</span>
        <span id="order_error-msg" class="d-none text-danger"></span>

        <script src="/public/intltel/js/intlTelInput.js"></script>
        <script>
          var input = document.querySelector("#order_phone"),
            errorMsg = document.querySelector("#order_error-msg"),
            validMsg = document.querySelector("#order_valid-msg");

          // here, the index maps to the error code returned from getValidationError - see readme
          <? if (current($order)['lang'] == 'RU') : ?>
            var errorMap = ["Неверный номер", "Неверный код страны", "Слишком короткий", "Слишком длинный", "Неверный номер", "Неверный номер", "Неверный номер"];
          <? else : ?>
            var errorMap = ["Invalid number", "Invalid country code", "Too short", "Too long", "Invalid number"];
          <? endif ?>

          // initialise plugin
          var iti = window.intlTelInput(input, {
            utilsScript: "/public/intltel/js/utils.js"
          });

          var reset = function() {
            input.classList.remove("error");
            errorMsg.innerHTML = "";
            errorMsg.classList.add("d-none");
            validMsg.classList.add("d-none");
          };

          // on blur: validate
          input.addEventListener('blur', function() {
            reset();
            if (input.value.trim()) {
              if (iti.isValidNumber()) {
                validMsg.classList.remove("d-none");
              } else {
                // input.
                input.classList.add("error");
                var errorCode = iti.getValidationError();
                errorMsg.innerHTML = errorMap[errorCode];
                errorMsg.classList.remove("d-none");
              }
            }
          });

          // on keyup / change flag: reset
          input.addEventListener('change', reset);
          input.addEventListener('keyup', reset);
        </script>
      </div>

      <!-- Instagram -->
      <div class="mb-3">
        <label for="order_instagram" class="form-label"><?= current($order)['lang'] == 'RU' ? 'Аккаунт инстаграм (необязательно)' : 'Instagram account (optional)' ?></label>
        <input type="text" class="form-control" name="instagram" id="order_instagram" placeholder="instagram" value="<?= current($order)['instagram'] ?>">
      </div>

      <!-- Country -->
      <?php
      // dd($order);
      $countries = require 'application/config/countries.php';
      // dd($countries);
      ?>
      <div class="mb-3 country">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.12.6/js/standalone/selectize.min.js" integrity="sha256-+C0A5Ilqmu4QcSPxrlGpaZxJ04VjsRjKu+G82kl5UJk=" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.12.6/css/selectize.bootstrap3.min.css" integrity="sha256-ze/OEYGcFbPRmvCnrSeKbRTtjG4vGLHXgOqsyLFTRjg=" crossorigin="anonymous" />

        <label for="billing_country" class="form-label required">Страна/Регион</label>
        <select name="billing_country" id="billing_country">
          <? foreach ($countries as $country_code => $name) : ?>
            <option value="<?= $country_code ?>" <?= current($order)['billing_country'] == $country_code ? 'selected="1"' : '' ?>><?= $name ?></option>
          <? endforeach ?>
        </select>

      </div>
      <!-- Address -->
      <div class="mb-3">
        <label for="order_address" class="form-label required"><?= current($order)['lang'] == 'RU' ? 'Адрес' : 'Street Address' ?></label>
        <input type="text" required class="form-control" name="address" id="order_address" placeholder="<?= current($order)['lang'] == 'RU' ? 'Номер дома и название улицы' : 'House number and street name' ?>" value="<?= current($order)['address'] ?>">
        <input type="text" class="form-control" name="apartment" id="order_apartment" placeholder="<?= current($order)['lang'] == 'RU' ? 'Крыло, подъезд, этаж и т.д. (необязательно)' : 'Apartment, suite, unit, etc. (optional)' ?>" value="<?= current($order)['apartment'] ?>">
      </div>

      <!-- City -->
      <div class="mb-3">
        <label for="order_city" class="form-label required"><?= current($order)['lang'] == 'RU' ? 'Адрес' : 'Street Address' ?></label>
        <input type="text" class="form-control" name="city" id="order_city" placeholder="<?= current($order)['lang'] == 'RU' ? 'Город / Населенный пункт' : 'Town / City' ?>" required value="<?= current($order)['city'] ?>">

      </div>
      <!-- Region/State -->
      <div class="mb-3">
        <label for="order_region" class="form-label required"><?= current($order)['lang'] == 'RU' ? 'Регион / Область' : 'Region / State / District' ?></label>
        <input type="text" class="form-control" name="region" id="order_region" required placeholder="<?= current($order)['lang'] == 'RU' ? 'Регион / Область' : 'Region / State / District' ?>" value="<?= current($order)['region'] ?>">
      </div>

      <!-- Postcode / ZIP (optional) -->
      <div class="mb-3">
        <label for="order_zip_code" class="form-label"><?= current($order)['lang'] == 'RU' ? 'Почтовый индекс (необязательно)' : 'Postcode / ZIP (optional)' ?></label>
        <input type="text" class="form-control" name="zip_code" id="order_zip_code" placeholder="<?= current($order)['lang'] == 'RU' ? 'Почтовый индекс (необязательно)' : 'Postcode / ZIP (optional)' ?>" value="<?= current($order)['zip_code'] ?>">
      </div>
      <!-- Additions -->
      <div class="mb-3">
        <label for="order_additions" class="form-label"><?= current($order)['lang'] == 'RU' ? 'Примечание к заказу (необязательно)' : 'Order notes (optional)' ?></label>

        <textarea name="additions" class="form-control" id="order_additions" cols="30" rows="10" placeholder="<?= current($order)['lang'] == 'RU' ? 'Примечания к вашему заказу, например, особые пожелания отделу доставки.' : 'Notes about your order, e.g. special notes for delivery.' ?>"></textarea>
      </div>
    </form>
  </div>
</div>