<!-- Splide -->
<!-- <link rel="stylesheet" href="/public/styles/vendor/splide-default.min.css"> -->
<div class="carousel">
  <section class="splide index_wrapper_slider">
    <div class="container-lg  arrows_wrapper">
      <div class="splide__arrows">

      </div>
    </div>
    <div class="splide__track">
      <ul class="splide__list">

        <li class="splide__slide"><!-- *****************************************************************!-->
          <section class="splide photo_scroller">
            <div class="splide__track">
              <ul class="splide__list">
                <li class="splide__slide"><img src="/public/images/Carousel/1/IMG_20241215_150553.jpg" alt="Image"></li>
                <li class="splide__slide"><img src="/public/images/Carousel/1/IMG_20241215_150553.jpg" alt="Image"></li>
                <li class="splide__slide"><img src="/public/images/Carousel/1/IMG_20241215_150553.jpg" alt="Image"></li>
              </ul>
            </div>
          </section>
          <div class="content">
            <div class="container-lg">
              <div class="row row-1 justify-content-center align-content-center ">

                <div class="col-12 col-sm-auto text-center">
                  <div class="row justify-content-center">
                    <div class="col-auto">
                      <h1><?= current($user)['lang'] !== 'RU' ? 'COLLABORATION ' : 'COLLABORATION ' ?></h1>
                    </div>
                    <!-- <div class="col-auto col-sm-auto text-center">
                      <h1 class="my-0"><? //= current($user)['lang'] !== 'RU' ? 'HYBRID' : 'ГИБРИД' 
                                        ?> V3</h1>
                    </div> -->
                    <!-- <div class="col-12 text-center">
                      <h3>&#8222;<? //= current($user)['lang'] !== 'RU' ? 'DIESEL BEE' : 'DIESEL BEE' 
                                  ?>&#8221;</h3>
                    </div> -->
                  </div>
                </div>

                <!-- <div class="col-12 text-center mt-1">
                  <a href="/catalog?category=10" class="btn btn-outline-light">
                    <? //= current($user)['lang'] !== 'RU' ? 'LEARN MORE' : 'УЗНАТЬ БОЛЬШЕ' 
                    ?>
                  </a>
                </div> -->

              </div>
            </div>
          </div>
        </li>

        <li class="splide__slide"><!-- *****************************************************************!-->
          <section class="splide photo_scroller">
            <div class="splide__track">
              <ul class="splide__list">
                <li class="splide__slide"><img src="/public/images/Carousel/2/IMG_20241215_162234.jpg" alt="BJJJEANS"></li>
                <li class="splide__slide"><img src="/public/images/Carousel/2/IMG_20241215_162234.jpg" alt="BJJJEANS"></li>
                <li class="splide__slide"><img src="/public/images/Carousel/2/IMG_20241215_162234.jpg" alt="BJJJEANS"></li>
              </ul>
            </div>
          </section>
          <div class="content">
            <div class="container-lg">
              <div class="row justify-content-center align-content-center">

                <div class="col-12 col-sm-auto text-center">
                  <div class="row justify-content-center">
                    <div class="col-auto">
                      <h1 class="my-0"><?= current($user)['lang'] !== 'RU' ? 'BJJJEANS' : 'BJJJEANS' ?></h1>
                    </div>
                    <!-- <div class="col-auto col-sm-auto text-center">
                      <h1 class="my-0"><?= current($user)['lang'] !== 'RU' ? 'CLASSIC' : 'КЛАССИКА' ?></h1>
                    </div> -->
                    <!-- <div class="col-12 text-center">
                      <h3>&#8222;<?= current($user)['lang'] !== 'RU' ? 'DIRECT DRIVE' : 'DIRECT DRIVE' ?>&#8221;</h3>
                    </div> -->
                  </div>
                </div>

                <!-- <div class="col-12 text-center mt-1">
                  <a href="/catalog?category=4" class="btn btn-outline-light">
                    <?= current($user)['lang'] !== 'RU' ? 'LEARN MORE' : 'УЗНАТЬ БОЛЬШЕ' ?>
                  </a>
                </div> -->

              </div>

            </div>
          </div>
        </li>

        <li class="splide__slide"> <!-- *****************************************************************!-->
          <section class="splide photo_scroller">
            <div class="splide__track">
              <ul class="splide__list">
                <li class="splide__slide"><img src="/public/images/Carousel/3/IMG_20241215_162421.jpg" alt="image"></li>
                <li class="splide__slide"><img src="/public/images/Carousel/3/IMG_20241215_162421.jpg" alt="image"></li>
                <li class="splide__slide"><img src="/public/images/Carousel/3/IMG_20241215_162421.jpg" alt="image"></li>
              </ul>
            </div>
          </section>
          <div class="content">
            <div class="container-lg">
              <div class="row justify-content-center align-content-center">

                <div class="col-12 col-sm-auto text-center">
                  <div class="row justify-content-center">
                    <div class="col-auto">
                      <h1> <?= current($user)['lang'] !== 'RU' ? 'SELVEDGE DENIM' : 'SELVEDGE DENIM' ?></h1>
                    </div>
                    <div class="col-auto col-sm-auto text-center">
                    </div>
                    <!-- <div class="col-12 text-center">
                      <h3>&#8222;<?= current($user)['lang'] !== 'RU' ? 'GORILLA' : 'GORILLA' ?>&#8221;</h3>
                    </div> -->
                  </div>
                </div>

                <!-- <div class="col-12 text-center mt-1">
                  <a href="/catalog?category=6" class="btn btn-outline-light">
                    <?= current($user)['lang'] !== 'RU' ? 'LEARN MORE' : 'УЗНАТЬ БОЛЬШЕ' ?>
                  </a>
                </div> -->

              </div>

            </div>
          </div>
        </li>
      </ul>
    </div>
  </section>

</div>

<?php
ob_start() ?>

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
      width: "100%",
      padding: 0,
      gap: 0,
      pagination: false,
      autoScroll: {
        speed: 0.5,
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
      // type: "loop",
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
      lazyLoad: true,
      speed: 300,
      // autoScroll: false,
    }).mount();
  }

  // Carous = document.getElementById("text_index_slider");
  // console.log(Carous);
</script>
<?php
$script;
if (empty($script))
  $script = ob_get_clean();
else
  $script = $script.ob_get_clean();
?>