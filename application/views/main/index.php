<!-- Хэдер -->
<header class="index_header">
  <div class="carousel">
    <section class="splide index_wrapper_slider">
      <div class="container-lg  arrows_wrapper">
        <div class="splide__arrows">

        </div>
      </div>
      <div class="splide__track">
        <ul class="splide__list">

          <li class="splide__slide">
            <section class="splide photo_scroller">
              <div class="splide__track">
                <ul class="splide__list">
                  <li class="splide__slide"><img src="/public/images/Carousel/HORS/IMG_20230325_204405.jpg" alt="ХОРС"></li>
                  <li class="splide__slide"><img src="/public/images/Carousel/HORS/IMG_20230325_204339.jpg" alt="ХОРС"></li>
                </ul>
              </div>
            </section>
            <div class="content">
              <div class="container-lg">
                <div class="row row-1 justify-content-center align-content-center ">

                  <div class="col-12 col-sm-auto text-center">
                    <div class="row justify-content-center">
                      <div class="col-auto">
                        <h1><?= current($user)['lang'] !== 'RU' ? 'NEW' : 'НОВИНКА' ?><span class="d-sm-none">!</span></h1>
                      </div>
                      <div class="col-auto col-sm-auto text-center">
                        <h1 class="my-0"><?= current($user)['lang'] !== 'RU' ? 'THE DEVICE' : 'АППАРАТ' ?></h1>
                      </div>
                      <div class="col-12 text-center">
                        <h3>&#8222;<?= current($user)['lang'] !== 'RU' ? 'ХОРС' : 'ХОРС' ?>&#8221;</h3>
                      </div>
                    </div>
                  </div>

                  <div class="col-12 text-center mt-1">
                    <a href="/catalog?category=8" class="btn btn-outline-light">
                      <?= current($user)['lang'] !== 'RU' ? 'LEARN MORE' : 'УЗНАТЬ БОЛЬШЕ' ?>
                    </a>
                  </div>

                </div>
              </div>
            </div>
          </li>

          <li class="splide__slide">
            <section class="splide photo_scroller">
              <div class="splide__track">
                <ul class="splide__list">
                  <li class="splide__slide"><img src="/public/images/Carousel/GURU/DSC04312_Dx0.jpg" alt="GURU"></li>
                  <li class="splide__slide"><img src="/public/images/Carousel/GURU/DSC04334_Dx0.jpg" alt="GURU"></li>
                </ul>
              </div>
            </section>
            <div class="content">
              <div class="container-lg">
                <div class="row justify-content-center align-content-center">

                  <div class="col-12 col-sm-auto text-center">
                    <div class="row justify-content-center">
                      <div class="col-auto">
                        <h1 class="my-0"><?= current($user)['lang'] !== 'RU' ? 'MAXIMUM' : 'МАКСИМАЛЬНО' ?></h1>
                      </div>
                      <div class="col-auto col-sm-auto text-center">
                        <h1 class="my-0"><?= current($user)['lang'] !== 'RU' ? 'VERSATILE' : 'УНИВЕРСАЛЬНАЯ' ?></h1>
                      </div>
                      <div class="col-12 text-center">
                        <h3>&#8222;<?= current($user)['lang'] !== 'RU' ? 'GURU' : 'GURU' ?>&#8221;</h3>
                      </div>
                    </div>
                  </div>

                  <div class="col-12 text-center mt-1">
                    <a href="/catalog?category=5" class="btn btn-outline-light">
                      <?= current($user)['lang'] !== 'RU' ? 'LEARN MORE' : 'УЗНАТЬ БОЛЬШЕ' ?>
                    </a>
                  </div>

                </div>

              </div>
            </div>
          </li>

          <li class="splide__slide">
            <section class="splide photo_scroller">
              <div class="splide__track">
                <ul class="splide__list">
                  <li class="splide__slide"><img src="/public/images/Carousel/LOVI/IMG_20220216_170307_967.jpg" alt="Lovi"></li>
                  <li class="splide__slide"><img src="/public/images/Carousel/LOVI/IMG_20220217_212948_149.jpg" alt="Lovi"></li>
                  <li class="splide__slide"><img src="/public/images/Carousel/LOVI/IMG_20220216_170307_967 — копия.jpg" alt="Lovi1"></li>
                  <li class="splide__slide"><img src="/public/images/Carousel/LOVI/IMG_20220217_212948_149 — копия.jpg" alt="Lovi1"></li>
                </ul>
              </div>
            </section>
            <div class="content">
              <div class="container-lg">
                <div class="row justify-content-center align-content-center">

                  <div class="col-12 col-sm-auto text-center">
                    <div class="row justify-content-center">
                      <div class="col-auto">
                        <h1 class="my-0"><?= current($user)['lang'] !== 'RU' ? 'AGELESS' : 'НЕСТАРЕЮЩАЯ' ?></h1>
                      </div>
                      <div class="col-auto col-sm-auto text-center">
                        <h1 class="my-0"><?= current($user)['lang'] !== 'RU' ? 'CLASSIC' : 'КЛАССИКА' ?></h1>
                      </div>
                      <div class="col-12 text-center">
                        <h3>&#8222;<?= current($user)['lang'] !== 'RU' ? 'LOVI' : 'LOVI' ?>&#8221;</h3>
                      </div>
                    </div>
                  </div>

                  <div class="col-12 text-center mt-1">
                    <a href="/catalog?category=6" class="btn btn-outline-light">
                      <?= current($user)['lang'] !== 'RU' ? 'LEARN MORE' : 'УЗНАТЬ БОЛЬШЕ' ?>
                    </a>
                  </div>

                </div>

              </div>
            </div>
          </li>
        </ul>
      </div>
    </section>

  </div>

</header>
<a class="big_logo_rounded row align-items-center" href="/">
  <!-- <div class="col-12"> -->
  <img src="/public/images/logo/sun_logo.png" alt="logo image">
  <!-- </div> -->
</a>
<a class="d-block text-center big_logo_text" href="/">ProLovi</a>
<!-- Приветствие -->
<div class="container-lg greeting ">
  <div class="row">
    <div class="col text-center text-black px-2">
      <div class=" px-3 pt-3 pb-4">
        <? if (current($user)['lang'] == "RU") : ?>
          <p>Мы рады вас приветствовать на нашем сайте! Наша компания занимается производством профессионального оборудования для перманентного макияжа. За 7 лет упорной работы мы выпустили 4 машинки — FANATIKA, LOVI, RAY, GURU, а также переходники и источники питания.</p>
          <p class="mb-0">Множество мастеров России и других стран, уже выбрали нас как приоритетное оборудование для себя, потому-что наши машинки имеют уникальную, неповторимую работу с комфортным, незаметным заживлением и максимальными остатками. Благодарим вас за выбор нашей продукции, и от всей нашей команды желаем вам успехов и процветания! </p>
          <!-- <p>Рад приветствовать вас на моем сайте! Я занимаюсь производством тату машинок с 2003 года. За 19 лет упорной работы я создавал классические аппараты, разработал и запатентовал уникальные гибридные машинки (HYBRID V1, GORILLA HYBRID V2 , HYBRAY, DIESEL BEE HYBRID V3). Благодаря сочетанию хлесткого удара индукции и стабильности ротора, они дают по настоящему наилучшую работу в нанесении татуировки на сегодняшний день.</p>
          <p class="mb-0">Лучшие мастера России и мира уже выбрали нас как приоритетное оборудование для себя. Я люблю создавать по настоящему особенные и уникальные машинки для татуировки.</p> -->
        <? else : ?>
          <p>We are glad to welcome you to our website! Our company is engaged in the production of professional equipment for permanent makeup. For 7 years of hard work, we have produced 4 machines — FANATIKA, LOVI, RAY, GURU, and also adapters and power supplies.</p>
          <p class="mb-0">A lot of craftsmen from Russia and other countries have already chosen us as a priority equipment for themselves, because our machines have a unique, unsurpassed work with comfortable, imperceptible healing and maximum residues. Thank you for choosing our products, and from our entire team we wish you success and prosperity!</p>
        <? endif ?>

      </div>
    </div>
  </div>
</div>

<!-- Категории -->
<div class="index_categories mt-3">
  <div class="container-lg">
    <div class="header row align-items-center justify-content-center">
      <h1 class="col-auto my-2"><?= current($user)['lang'] !== 'RU' ? 'Categories' : 'Категории' ?></h1>
    </div>

    <div class="cards row">
      <? $categories = array_reverse($categories, 1) ?>
      <? foreach ($categories as $cat_id => $cat_node) : ?>
        <div class="card col-6 col-sm-3 col-md-3 col-xl-2 mb-4">
          <div class="text-center">
            <a href="/catalog?category=<?= $cat_id ?>"><img class="card-img-top" src="/<?= current(json_decode($cat_node['images'], 1)) ?>" alt="Category image" /></a>
            <div class="card-body p-0">
              <h4 class="card-title"><a href="/catalog?category=<?= $cat_id ?>"><?= current($user)['lang'] !== 'RU' ? $cat_node['name_en'] : $cat_node['name'] ?></a></h4>
            </div>
          </div>
        </div>
      <? endforeach ?>

    </div>
  </div>
</div>



<!-- Скрипты -->
<?php ob_start() ?>
<script src="/public/scripts/splide.min.js"></script>
<script src="/public/scripts/splide.autoscroll.min.js"></script>
<script>
  var Scrollers = document.getElementsByClassName("photo_scroller");
  // dd(Scrollers);
  for (var i = 0; i < Scrollers.length; i++) {
    // dd("Scrollers:")
    // dd(Scrollers[i]);
    new Splide(Scrollers[i], {
      arrows: false,
      type: "loop",
      // height: "30em",
      rewind: true,
      // rewindByDrag: 0,
      drag: false,
      perPage: true,
      // width: "100%",
      padding: 0,
      gap: 0,
      pagination: false,
      autoScroll: {
        speed: .5,
        pauseOnHover: 0,
      },
    }).mount(window.splide.Extensions);
  }

  var Sliders = document.getElementsByClassName('index_wrapper_slider')
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
      pagination: false,
      // focus: 2,
      autoplay: 1,
      // interval: 4000,
      interval: 6000,

      speed: 300,
      // autoScroll: false,
    }).mount();
  }

  // Carous = document.getElementById("text_index_slider");
  // console.log(Carous);
</script>
<?php $script = ob_get_clean(); ?>