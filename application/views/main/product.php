<form class="container-lg description_block g-4 product_actions my-3" method="POST" enctype="multipart/form-data">
  <div class="row ">
    <div class="col">
      <div class="row mb-3 my-md-3">

        <!-- Photos -->
        <div class="col-12 g-0 images col-md-4 ">

          <section id="main-carousel" class="splide product_photo" aria-label="My Awesome Gallery">
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
          <div class="row">
            <!-- Header -->
            <div class="col-12 text-center name">
              <h1 class="mb-3"><?= current($user)['lang'] == 'RU' ? current($product)['name'] : current($product)['name_en'] ?></h1>
            </div>
            <!-- Price -->
            <div class="col-12 mb-3 price">
              <?
              // ddd($product) 
              ?>
              <? if (current($user)['lang'] == 'RU') : ?>
                <? if (current($product)['min_price'] == current($product)['max_price']) : ?>
                  <p class="mb-0" id=""><?= current($product)['min_price'] ?> руб.</p>
                <? else : ?>
                  <p class="mb-0" id="product_price"><?= current($product)['min_price'] ?> - <?= current($product)['max_price'] ?> руб.</p>
                <? endif ?>
              <? else : ?>
                <? if (current($product)['min_price_en'] == current($product)['max_price_en']) : ?>
                  <p class="mb-0" id="">$<?= current($product)['min_price_en'] ?></p>
                <? else : ?>
                  <p class="mb-0" id="product_price">$<?= current($product)['min_price_en'] ?> - <?= current($product)['max_price_en'] ?></p>
                <? endif ?>
              <? endif ?>

              <? if (current($user)['lang'] == 'RU') : ?>
                <span class="small mb-3 text-<?= current($product)['quantity'] > 0 ? 'success' : 'danger' ?>" id="stock"><?= current($product)['quantity'] ?> шт. в наличии</span>
              <? else : ?>
                <span class="small mb-3 text-<?= current($product)['quantity'] > 0 ? 'success' : 'danger' ?>" id="stock"><?= current($product)['quantity'] ?> <?= current($product)['quantity'] > 1 ? 'pieces' : 'piece' ?> in stock</span>
              <? endif ?>
            </div>
            <!-- Options -->
            <script>
              var json = '<?= json_encode($properties) ?>';
              var arr = JSON.parse(json);
              var selected = 0;
              selected = arr.reduce(function(current) {
                return curent;
              });
              dd(selected);
              if (Object.keys(arr).length == 1) {
                selected = arr.reduce(function(current) {
                  return curent;
                });

              }
            </script>
            <? if (count($properties) > 1) : ?>
              <div class="col-12 mb-3 options">
                <?
                $class_properties = [];
                foreach ($properties as $id => $node) {
                  $class_properties[$node['classname_en']][$id] = $node;
                }
                // ddd($class_properties);
                foreach ($class_properties as $class_nodes) : ?>
                  <div class="row">
                    <div class="col-auto pe-0 align-self-center"><b><?= current($user)['lang'] == 'RU' ? current($class_nodes)['classname'] : current($class_nodes)['classname_en'] ?></b></div>
                    <div class="col">

                      <select class="form-select text-truncate" aria-label="Select option" name='property_id' required onchange="select(value)">
                        <option hidden value="0" selected disabled>Выбрать</option>
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
              <script>
                function select(property_id) {
                  var quantity = document.getElementById('stock');
                  // dd(arr[property_id]['quantity']);
                  var string = <?= current($user)['lang'] == 'RU' ?
                                  "arr[property_id]['quantity']+' шт. в наличии'" : ("arr[property_id]['quantity']>1?arr[property_id]['quantity']+' pieces in stock':arr[property_id]['quantity']+' piece in stock'") ?>;
                  quantity.innerHTML = string;
                  selected = property_id;
                }
              </script>
            <? endif ?>
            <!-- Количество -->
            <div class="col-12  quantity">
              <div class="row justify-content-around">
                <div class="col-auto ">
                  <div class="input-group ">
                    <a class="px-1 btn left btn-outline-secondary input-group-text" onclick="decrease()">-</a>
                    <input type="number " class="form-control px-0 text-center" value="1">
                    <a class=" px-1 btn right btn-outline-secondary input-group-text" onclick="increase()">+</a>
                  </div>
                </div>
                <!-- Button -->
                <div class="col-auto">
                  <a href="#" class="btn btn-warning cart_btn px-3">Add to cart</a>
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>
</form>

<div class="container-lg product_description description_block g-4 product_actions">
  <div class="row ">
    <div class="col py-3">
      <h3 class="text-center">Гибрид</h3>
      <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Alias ea maiores unde, suscipit at inventore est
        eaque error deleniti ad illo non cum corporis eum eos illum dolorum quaerat hic?</p>

      <p>1234</p>

      <p>1234</p>

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
<? $script = ob_get_clean() ?>