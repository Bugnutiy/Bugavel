<?php if (isset($err)) : ?>
  <?php foreach ($err as $errstr) : ?>
    <div class="row justify-content-center">
      <div class="col-11 alert alert-danger">
        <?= $errstr ?>
      </div>
    </div>
  <?php endforeach ?>
<?php endif ?>

<form method="post" action="/admin/products/properties/edit?product_id=<?= key($product) ?><?= isset($property) ? '&id=' . key($property) : '' ?><?= isset($copy) ? '&copy=1' : '' ?>" enctype="multipart/form-data">

  <input type="hidden" name="product_id" value="<?= key($product) ?>">
  <div class="row justify-content-center">

    <h2><?= $header ?></h2>
    <div class="w-100"></div>

    <div class="col-12 col-md-6">
      <!-- Редактировать -->
      <?php if (isset($property) and !isset($copy)) : ?>
        <input type="hidden" name="id" value="<?= key($property) ?>">
      <?php endif ?>
      <!-- --Редактировать -->
      <div class="input-group mb-2">
        <div class="input-group-prepend">
          <span class="input-group-text" id="classname">Название класса RU</span>
        </div>
        <input class="form-control" type="text" name="classname" placeholder="Товар" aria-label="Имя" aria-describedby="name" value="<?= isset($property) ? current($property)['classname'] : '' ?>">
      </div>
      <div class="input-group mb-2">
        <div class="input-group-prepend">
          <span class="input-group-text" id="classname_en">Название класса EN</span>
        </div>
        <input class="form-control" type="text" name="classname_en" placeholder="Товар" aria-label="Имя" aria-describedby="name" value="<?= isset($property) ? current($property)['classname_en'] : '' ?>">
      </div>

      <div class="input-group mb-2">
        <div class="input-group-prepend">
          <span class="input-group-text" id="name">Название RU</span>
        </div>
        <input class="form-control" type="text" name="name" placeholder="Товар" aria-label="Имя" aria-describedby="name" value="<?= isset($property) ? current($property)['name'] : '' ?>">
      </div>

      <div class="input-group mb-2">
        <div class="input-group-prepend">
          <span class="input-group-text" id="name_en">Название EN</span>
        </div>
        <input class="form-control" type="text" name="name_en" placeholder="property" aria-label="Имя" aria-describedby="name" value="<?= isset($property) ? current($property)['name_en'] : '' ?>">
      </div>

      <label class="input-group-text">Цена товара</label>

      <div class="input-group mb-3">
        <span class="input-group-text">Руб</span>
        <input type="number" class="form-control" placeholder="RU" id="price" name="price" value="<?= isset($property) ? current($property)['price'] : '' ?>">
        <span class="input-group-text">$</span>
        <input type="number" class="form-control" placeholder="EN" id="price_en" name="price_en" value="<?= isset($property) ? current($property)['price_en'] : '' ?>">

      </div>

      <label class="input-group-text">Цена без скидки</label>

      <div class="input-group mb-3">


        <span class="input-group-text">Руб</span>
        <input type="number" class="form-control" placeholder="RU" id="price_prev" name="price_prev" value="<?= isset($property) ? current($property)['price_prev'] : '' ?>">
        <span class="input-group-text">$</span>
        <input type="number" class="form-control" placeholder="EN" id="price_prev_en" name="price_prev_en" value="<?= isset($property) ? current($property)['price_prev_en'] : '' ?>">

      </div>
      
      <label class="input-group-text">Скидка, %</label>
      <div class="input-group mb-3">
        <span class="input-group-text">Руc</span>
        <input type="number" class="form-control" placeholder="RU" id="sale" name="sale" value="<?= isset($property) ? current($property)['sale'] : '' ?>">
        <span class="input-group-text">$</span>
        <input type="number" class="form-control" placeholder="EN" id="sale_en" name="sale_en" value="<?= isset($property) ? current($property)['sale_en'] : '' ?>">
        <a class="btn btn-secondary" onclick="saleF()">AUTO</a>

      </div>

      <div class="input-group mb-3">
        <div class="input-group-prepend">
          <span class="input-group-text">Количество на складе</span>
        </div>
        <input type="number" class="form-control" placeholder="Количество" name="quantity" required value="<?= isset($property) ? current($property)['quantity'] : '' ?>">
      </div>
      <div class="input-group mb-3">
        <label for="show_empty_check" class="me-2">Показывать страницу "товар закончился"</label>
        <input type="hidden" value="0" name="show_empty">

        <input calss="form-control ml-5" type="checkbox" name="show_empty" value="1" id=show_empty_check <?= isset($property) && current($property)['show_empty'] ? "checked" : "" ?>>
      </div>
      <button type="submit" class="btn btn-primary mb-5">Подтвердить</button>
    </div>

  </div>

</form>

<script>
  function saleF() {
    console.log("Sale");
    price = parseInt(document.getElementById("price").value);
    if (!price) {
      price = 0;
    }
    price_en = parseInt(document.getElementById("price_en").value);
    if (!price_en) {
      price_en = 0;
    }
    price_prev = parseInt(document.getElementById("price_prev").value);
    if (!price_prev) {
      price_prev = 0;
    }
    price_prev_en = parseInt(document.getElementById("price_prev_en").value);
    if (!price_prev_en) {
      price_prev_en = 0;
    }
    sale = parseInt(document.getElementById("sale").value);
    if (!sale) {
      sale = 0;
    }
    sale_en = parseInt(document.getElementById("sale_en").value);
    if (!sale_en) {
      sale_en = 0;
    }
    console.log({
      price,
      price_en,
      price_prev,
      price_prev_en,
      sale,
      sale_en
    });
    //авторассчёт цены
    if (price == 0 && price_prev != 0 && sale != 0) {
      price = parseInt(price_prev - price_prev * sale / 100);
      document.getElementById("price").value = price;
    }
    if (price_en == 0 && price_prev_en != 0 && sale_en != 0) {
      price_en = parseInt(price_prev_en - price_prev_en * sale_en / 100);
      document.getElementById("price_en").value = price_en;
    }

    //авторассчёт скидки
    if (sale == 0 && price != 0 && price_prev != 0) {
      sale = parseInt((price_prev - price) * 100 / price_prev);
      document.getElementById("sale").value = sale;
    }
    if (sale_en == 0 && price_en != 0 && price_prev_en != 0) {
      sale_en = parseInt((price_prev_en - price_en) * 100 / price_prev_en);
      document.getElementById("sale_en").value = sale_en;
    }

    //авторассчёт цены без скидки
    if (price_prev == 0 && price != 0 && sale != 0) {
      price_prev = parseInt(price / (1 - sale / 100));
      document.getElementById("price_prev").value = price_prev;
    }
    if (price_prev_en == 0 && price_en != 0 && sale_en != 0) {
      price_prev_en = parseInt(price_en / (1 - sale_en / 100));
      document.getElementById("price_prev_en").value = price_prev_en;
    }
  }
</script>