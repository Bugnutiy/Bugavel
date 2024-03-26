<form class="container-lg description_block g-4 product_actions my-3" method="POST" enctype="multipart/form-data">
  <div class="row ">
    <div class="col">
      <div class="row mb-3 my-md-3">

        <!-- Photos -->
        <div class="col-12 g-0 images col-md-4 ">
          <?
          $property_flag = [];
          $product[key($product)]['quantity'] = 0;
          foreach ($properties as $property_id => $property_node) {
            if (current($user)['country'] == 'RU') {
              if (($property_node['quantity'] or $property_node['preorder']) && $property_node['price']) {
                $property_flag[$property_id] = $property_node;
                $product[key($product)]['quantity'] += $property_node['quantity'];
              }
            } else {
              if (($property_node['quantity'] or current($product)['preorder']) && $property_node['price_en']) {
                $property_flag[$property_id] = $property_node;
                $product[key($product)]['quantity'] += $property_node['quantity'];
              }
            }
          } ?>
          <section id="main-carousel" class="splide product_photo" aria-label="Gallery">
            <div class="splide__track">
              <ul class="splide__list">
                <? $images = json_decode(current($product)['images']);
                foreach ($images as $src) : ?>
                  <li class="splide__slide">
                    <img src="/<?= $src ?>" alt="">
                  </li>
                <? endforeach ?>
              </ul>
            </div>
          </section>
        </div>
        <!-- Body -->
        <div class="col-12 col-md-8">
          <div class="row justify-content-around">
            <!-- Header -->
            <div class="col-12 text-center name">
              <h1 class="mb-3"><?= current($user)['lang'] == 'RU' ? current($product)['name'] : current($product)['name_en'] ?></h1>
            </div>

            <!-- Price -->
            <div class="col-auto mb-3 price text-center">

              <? if (current($user)['country'] == 'RU') : ?>
                <? if (current($product)['min_price'] == current($product)['max_price']) : ?>
                  <p class="mb-0"><span id="product_price"><?= number_format(current($product)['min_price'], 0, ',', ' ') ?></span> руб.</p>
                <? else : ?>
                  <p class="mb-0"><span id="product_price"><?= number_format(current($product)['min_price'], 0, ',', ' ') ?> - <?= number_format(current($product)['max_price'], 0, ',', ' ')  ?></span> руб.</p>
                <? endif ?>
              <? else : ?>
                <? if (current($product)['min_price_en'] == current($product)['max_price_en']) : ?>
                  <p class="mb-0"><span id="product_price"><?= number_format(current($product)['min_price_en'], 0, '.', ',') ?></span> eur</p>
                <? else : ?>
                  <p class="mb-0"><span id="product_price"><?= number_format(current($product)['min_price_en'], 0, '.', ',') ?> - <?= number_format(current($product)['max_price_en'], 0, '.', ',') ?></span> eur</p>
                <? endif ?>
              <? endif ?>

              <? if (current($user)['lang'] == 'RU') : ?>
                <span class="small mb-3 text-<?= current($product)['quantity'] > 0 ? 'success' : 'danger' ?>" id="stock"><?= current($product)['quantity'] ?> шт. в наличии</span>
              <? else : ?>
                <span class="small mb-3 text-<?= current($product)['quantity'] > 0 ? 'success' : 'danger' ?>" id="stock"><?= current($product)['quantity'] ?> <?= current($product)['quantity'] > 1 ? 'pieces' : 'piece' ?> in stock</span>
              <? endif ?>
            </div>

            <!-- Options -->
            <? if (count($property_flag) > 1) : ?>
              <div class="col-auto mb-3 options">
                <?
                $properties_by_classname = [];
                foreach ($property_flag as $id => $node) {
                  $properties_by_classname[$node['classname_en']][$id] = $node;
                }
                foreach ($properties_by_classname as $class_nodes) : ?>
                  <div class="row">
                    <div class="col-auto pe-0 align-self-center"><b><?= current($user)['lang'] == 'RU' ? current($class_nodes)['classname'] : current($class_nodes)['classname_en'] ?></b></div>
                    <div class="col">

                      <select class="form-select text-truncate" aria-label="Select option" name='property_id' required onchange="select(value)">
                        <option hidden value="" selected disabled><?= current($user)['lang'] == 'RU' ? 'Выбрать' : 'Select' ?></option>
                        <? foreach ($class_nodes as $property_id => $node) : ?>
                          <option value="<?= $property_id ?>" <?= $node['quantity'] < 1 ? 'disabled' : '' ?>>
                            <?= current($user)['lang'] == 'RU' ? $node['name'] : $node['name_en'] ?>
                            <?= $node['quantity'] < 1 ? (current($user)['lang'] == 'RU' ? '(Нет в наличии)' : '(Out of stock)') : '' ?>
                          </option>
                        <? endforeach ?>
                      </select>

                    </div>
                  </div>
                <? endforeach ?>

              </div>
            <? else : ?>
              <input type="hidden" name="property_id" value="<?= key($property_flag) ?>">

            <? endif ?>
            <!-- Количество -->
            <div class="col-auto quantity">
              <div class="row justify-content-center">
                <div class="col-auto ">
                  <div class="input-group ">
                    <a class="px-1 btn left btn-outline-secondary input-group-text" onclick="decrease()">-</a>
                    <input type="number" min="1" max="1" step="1" class="form-control px-0 text-center" value="1" id="quantity_field" name="quantity" onchange="cost(this)">
                    <a class=" px-1 btn right btn-outline-secondary input-group-text" onclick="increase()">+</a>
                  </div>
                </div>
                <!-- Button -->
                <div class="col-auto">
                  <button type="submit" class="btn btn-warning cart_btn px-3"><?= current($user)['lang'] == 'RU' ? 'В корзину' : 'Add to cart' ?></button>

                </div>
                <? //ddd($property_flag); 
                ?>
                <!-- Tinkoff Button -->
                <? if ($property_node['installment']) : ?>
                  <div class="col-auto col-sm-12 mt-4 text-center">
                    <!-- demoFlow=sms& -->
                    <tinkoff-create-button size="M" subtext="" shopId="ec01ca95-44d3-4c47-94c6-a21173532f68" showcaseId="3089d659-23d9-4505-be32-58806d4de5ae" ui-data="productType=installment&view=self" payment-data="orderNumber=<?= uniqid(key($user) . '_') ?>&items.0.name=<?= current($product)['name'] ?>&items.0.price=<?= current($property_flag)['price'] ?>&items.0.vendorCode=[<?= key($property_flag) ?>]&items.0.quantity=1&sum=<?= current($property_flag)['price'] ?>&promoCode=installment_0_0_6_6,5"></tinkoff-create-button>
                  </div>

                <? endif ?>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>
</form>
<div class="container-lg product_description description_block g-4 product_actions mb-3">
  <div class="row ">
    <div class="col py-3">
      <h3 class="text-center"><?= current($user)['lang'] !== 'RU' ? current($product)['name_en'] :  current($product)['name'] ?></h3>

      <?= current($user)['lang'] !== 'RU' ? current($product)['description_en'] : current($product)['description'] ?>


    </div>
  </div>
</div>

<? ob_start() ?>
<script src="/public/scripts/splide.min.js"></script>
<script src="/public/scripts/splide.autoscroll.min.js"></script>
<script>
  var Sliders = document.getElementsByClassName('product_photo')
  // dd(Scrollers);
  for (var i = 0; i < Sliders.length; i++) {
    // dd('Sliders:');
    // dd(Sliders[i]);
    new Splide(Sliders[i], {
      arrows: true,
      type: "loop",
      // height: "30em",
      rewind: true,
      // rewindByDrag: 0,
      drag: true,
      perPage: 1,
      // width: "auto",
      pagination: true,
      // focus: 2,
      // autoplay: 1,
      // interval: 4000,
      interval: 3000,

      speed: 300,
      // autoScroll: false,
    }).mount();
  }
</script>

<script>
  var properties = <?= json_encode($avaliable_properties) ?>;
  var selected = 0;
  var stock = 0;

  function select(property_id) {
    if (property_id == 0) {
      return 0;
    }
    var stockElem = document.getElementById('stock');
    stock = <?= current($product)['preorder'] ? 1 : "properties[property_id]['quantity']" ?>;

    var priceElem = document.getElementById('product_price');
    var quantityElem = document.getElementById('quantity_field');
    quantityElem.max = stock;
    // dd(quantityElem.value);
    var price = properties[property_id]['price<?= current($user)['country'] == 'RU' ? '' : '_en' ?>'] * quantityElem.value;

    priceElem.innerHTML = price.format(0, 3, '<?= current($user)['country'] == 'RU' ? ' ' : ',' ?>');

    var string = <?= current($user)['lang'] == 'RU' ?
                    "stock+' шт. в наличии'" : ("stock>1?stock+' pieces in stock':stock+' piece in stock'") ?>;
    stockElem.innerHTML = string;
    selected = property_id;
  }
  if (Object.keys(properties).length == 1) {
    selected = Object.keys(properties)[0];
    // dd(selected);
    select(selected);
  }

  function cost(input) {
    if (selected > 0) {
      // dd(input.value);

      var priceElem = document.getElementById('product_price');
      var price = properties[selected]['price<?= current($user)['country'] == 'RU' ? '' : '_en' ?>'] * input.value;

      priceElem.innerHTML = price.format(0, 3, '<?= current($user)['country'] == 'RU' ? ' ' : ',' ?>');
    }
  }

  function increase() {
    quantElem = document.getElementById('quantity_field');
    if (quantElem.value < stock) {
      quantElem.value++;
      cost(quantElem);
    }
  }

  function decrease() {
    quantElem = document.getElementById('quantity_field');
    if (quantElem.value > 1) {
      quantElem.value--;
      cost(quantElem);
    }
  }
</script>
<!-- <script>
  var alertList = document.querySelectorAll('.alert')
  var alerts = [].slice.call(alertList).map(function(element) {
    return new bootstrap.Alert(element)
  })
</script> -->
<? $script = ob_get_clean() ?>