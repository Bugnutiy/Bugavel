<?php if (isset($err)) : ?>
  <?php foreach ($err as $errstr) : ?>
    <div class="row justify-content-center">
      <div class="col-11 alert alert-danger">
        <?= $errstr ?>
      </div>
    </div>
  <?php endforeach ?>
<?php endif ?>

<form method="post" action="/admin/products/properties/edit?product_id=<?= key($product) ?><?=isset($property)?'&id='.key($property):''?><?=isset($copy)?'&copy=1':''?>" enctype="multipart/form-data">

<input type="hidden" name="product_id" value="<?=key($product)?>">
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
        <input required class="form-control" type="text" name="classname" placeholder="Товар" aria-label="Имя" aria-describedby="name" value="<?= isset($property) ? current($property)['classname'] : '' ?>">
      </div>
      <div class="input-group mb-2">
        <div class="input-group-prepend">
          <span class="input-group-text" id="classname_en">Название класса EN</span>
        </div>
        <input required class="form-control" type="text" name="classname_en" placeholder="Товар" aria-label="Имя" aria-describedby="name" value="<?= isset($property) ? current($property)['classname_en'] : '' ?>">
      </div>

      <div class="input-group mb-2">
        <div class="input-group-prepend">
          <span class="input-group-text" id="name">Название RU</span>
        </div>
        <input required class="form-control" type="text" name="name" placeholder="Товар" aria-label="Имя" aria-describedby="name" value="<?= isset($property) ? current($property)['name'] : '' ?>">
      </div>

      <div class="input-group mb-2">
        <div class="input-group-prepend">
          <span class="input-group-text" id="name_en">Название EN</span>
        </div>
        <input required class="form-control" type="text" name="name_en" placeholder="property" aria-label="Имя" aria-describedby="name" value="<?= isset($property) ? current($property)['name_en'] : '' ?>">
      </div>

      <div class="input-group mb-3">

        <span class="input-group-text">Цена товара</span>

        <span class="input-group-text">Руб</span>
        <input type="number" class="form-control" placeholder="Стоимость RU" name="price" required value="<?= isset($property) ? current($property)['price'] : '' ?>">
        <span class="input-group-text">$</span>
        <input type="number" class="form-control" placeholder="Стоимость EN" name="price_en" required value="<?= isset($property) ? current($property)['price_en'] : '' ?>">

      </div>
      <div class="input-group mb-3">
        <div class="input-group-prepend">
          <span class="input-group-text">Количество на складе</span>
        </div>
        <input type="number" class="form-control" placeholder="Количество" name="quantity" required value="<?= isset($property) ? current($property)['quantity'] : '' ?>">
      </div>


      <button type="submit" class="btn btn-primary mb-5">Подтвердить</button>
    </div>

  </div>

</form>