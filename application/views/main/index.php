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
                  <li class="splide__slide"><img src="public/images/Carousel/DIESEL BEE/BEE1.jpg" alt="DIESEL BEE image"></li>
                </ul>
              </div>
            </section>
            <div class="content">
              <div class="container-lg">
                <div class="row row-1 justify-content-center align-content-center ">

                  <div class="col-12 col-sm-auto text-center">
                    <div class="row justify-content-center">
                      <div class="col-auto">
                        <h1><?= current($user)['lang'] == 'EN' ? 'NEW' : 'НОВИНКА' ?><span class="d-sm-none">!</span></h1>
                      </div>
                      <div class="col-auto col-sm-auto text-center">
                        <h1 class="my-0"><?= current($user)['lang'] == 'EN' ? 'HYBRID' : 'ГИБРИД' ?> V3</h1>
                      </div>
                      <div class="col-12 text-center">
                        <h3>&#8222;<?= current($user)['lang'] == 'EN' ? 'DIESEL BEE' : 'ДИЗЕЛЬНАЯ ПЧЕЛА' ?>&#8221;</h3>
                      </div>
                    </div>
                  </div>

                  <div class="col-12 text-center mt-1">
                    <a type="button" class="btn btn-outline-light">
                      <?= current($user)['lang'] == 'EN' ? 'LEARN MORE' : 'УЗНАТЬ БОЛЬШЕ' ?>
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
                  <li class="splide__slide"><img src="public/images/Carousel/COIL/COIL1.jpg" alt="Coil image"></li>
                </ul>
              </div>
            </section>
            <div class="content">
              <div class="container-lg">
                <div class="row justify-content-center align-content-center">

                  <div class="col-12 col-sm-auto text-center">
                    <div class="row justify-content-center">
                      <div class="col-auto">
                        <h1 class="my-0"><?= current($user)['lang'] == 'EN' ? 'AGELESS' : 'НЕСТАРЕЮЩАЯ' ?></h1>
                      </div>
                      <div class="col-auto col-sm-auto text-center">
                        <h1 class="my-0"><?= current($user)['lang'] == 'EN' ? 'CLASSIC' : 'КЛАССИКА' ?></h1>
                      </div>
                      <div class="col-12 text-center">
                        <h3>&#8222;<?= current($user)['lang'] == 'EN' ? 'COIL' : 'ИНДУКЦИЯ' ?>&#8221;</h3>
                      </div>
                    </div>
                  </div>

                  <div class="col-12 text-center mt-1">
                    <a type="button" class="btn btn-outline-light">
                      <?= current($user)['lang'] == 'EN' ? 'LEARN MORE' : 'УЗНАТЬ БОЛЬШЕ' ?>
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
                  <li class="splide__slide"><img src="public/images/Carousel/GORILLA/GORILLA1.jpg" alt="Gorilla image">
                  </li>
                </ul>
              </div>
            </section>
            <div class="content">
              <div class="container-lg">
                <div class="row justify-content-center align-content-center">

                  <div class="col-12 col-sm-auto text-center">
                    <div class="row justify-content-center">
                      <div class="col-auto">
                        <h1> <?= current($user)['lang'] == 'EN' ? 'THE MOST POWERFULL' : 'САМАЯ МОЩНАЯ' ?></h1>
                      </div>
                      <div class="col-auto col-sm-auto text-center">
                      </div>
                      <div class="col-12 text-center">
                        <h3>&#8222;<?= current($user)['lang'] == 'EN' ? 'GORILLA' : 'ГОРИЛЛА' ?>&#8221;</h3>
                      </div>
                    </div>
                  </div>

                  <div class="col-12 text-center mt-1">
                    <a type="button" class="btn btn-outline-light">
                      <?= current($user)['lang'] == 'EN' ? 'LEARN MORE' : 'УЗНАТЬ БОЛЬШЕ' ?>
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
<a class="big_logo row align-items-center" href="/">
  <div class="col-12">
    <img src="public/images/logo/logo.png" alt="logo image">
  </div>
</a>
<!-- Категории -->
<div class="index_categories">
  <div class="container-lg">
    <div class="header row align-items-center justify-content-center">
      <h1 class="col-auto my-2"><?= current($user)['lang'] == 'EN' ? 'Categories' : 'Категории' ?></h1>
    </div>

    <div class="cards row">
      
      <? foreach ($categories as $cat_id => $cat_node) : ?>
        <div class="card col-6 col-sm-3 col-md-3 col-xl-2 mb-4">
          <div class="text-center">
            <a href="/catalog?category=<?= $cat_id ?>"><img class="card-img-top" src="<?= current(json_decode($cat_node['images'], 1)) ?>" alt="Category image" /></a>
            <div class="card-body p-0">
              <h4 class="card-title"><a href="/catalog?category=<?= $cat_id ?>"><?= current($user)['lang'] == 'EN' ? $cat_node['name_en'] : $cat_node['name'] ?></a></h4>
            </div>
          </div>
        </div>
      <? endforeach ?>

    </div>
  </div>
</div>



<!-- Скрипты -->
<?php ob_start() ?>
<script src="public/scripts/splide.min.js"></script>
<script src="public/scripts/splide.autoscroll.min.js"></script>
<script>
  var Scrollers = document.getElementsByClassName("photo_scroller");
  // dd(Scrollers);
  for (var i = 0; i < Scrollers.length; i++) {
    dd("Scrollers:")
    dd(Scrollers[i]);
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
        speed: 0.5,
        pauseOnHover: 0,
      },
    }).mount(window.splide.Extensions);
  }

  var Sliders = document.getElementsByClassName('index_wrapper_slider')
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
      pagination: false,
      // focus: 2,
      autoplay: 1,
      // interval: 4000,
      interval: 3000,

      speed: 300,
      // autoScroll: false,
    }).mount();
  }

  // Carous = document.getElementById("text_index_slider");
  // console.log(Carous);
</script>
<?php $script = ob_get_clean(); ?>