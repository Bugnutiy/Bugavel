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
            <div class="col-12 mb-4 price">
              <? ddd($properties);
              ddd($product) ?>
              <? if (current($user)['lang'] == 'RU') : ?>
                <? if (current($product)['min_price'] == current($product)['max_price']) : ?>
                  <p class="mb-0" id=""><?=current($product)['min_price']?> руб.</p>
                <? else : ?>
                  <p class="mb-0" id="product_price"><?=current($product)['min_price']?> - <?=current($product)['max_price']?> руб.</p>
                <? endif ?>
              <? else : ?>
                <? if (current($product)['min_price_en'] == current($product)['max_price_en']) : ?>
                  <p class="mb-0" id="">$<?=current($product)['min_price_en']?></p>
                <? else : ?>
                  <p class="mb-0" id="product_price">$<?=current($product)['min_price_en']?> - <?=current($product)['max_price_en']?></p>
                <? endif ?>
              <? endif ?>

              <span class="small text-success" id="quantity">3 pieces in stock</span>
            </div>
            <!-- Option -->
            <div class="col-12 options">
              <div class="row">
                <div class="col-auto pe-0 align-self-center"><b>МОТОР</b></div>
                <div class="col-auto"><select class="form-select text-truncate" aria-label="Default select example ">
                    <option value="0" selected disabled>Выбрать</option>
                    <option value="1">Мощный мотор аналог MAXON DC MAX</option>
                    <option value="2">Премиальный мотор MAXXON DC MAX</option>
                  </select></div>
              </div>
            </div>
            <!-- Количество -->
            <div class="col-12 mt-3 quantity">
              <div class="row justify-content-around">
                <div class="col-auto ">
                  <div class="input-group ">
                    <a class="px-1 btn left btn-outline-secondary input-group-text">-</a>
                    <input type="number " class="form-control px-0 text-center" value="1">
                    <a class=" px-1 btn right btn-outline-secondary input-group-text">+ </a>
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
    dd('Sliders:');
    dd(Sliders[i]);
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