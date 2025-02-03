<!-- Splide -->
<!-- <link rel="stylesheet" href="/public/styles/vendor/splide-default.min.css"> -->
<div class="carousel container p-0">
  <div class="splide index_wrapper_slider" role="group" aria-label="Main Carousel" id="IndexCarouesel">
    <div class="splide__track">
      <ul class="splide__list">
        <li class="splide__slide">
          <div class="image-container">
            <img src="public/images/Carousel/1.jpeg" alt="Image 01" class="d-sm-none">
            <img src="public/images/Carousel/1-h.jpeg" alt="Image 01" class="d-none d-sm-inline">
          </div>
        </li>
        <li class="splide__slide">
          <div class="image-container">
            <img src="public/images/Carousel/2.jpeg" alt="Image 02" class="d-sm-none">
            <img src="public/images/Carousel/2-h.jpeg" alt="Image 02" class="d-none d-sm-inline">
          </div>
        </li>
        <li class="splide__slide">
          <div class="image-container">
            <img src="public/images/Carousel/3.jpeg" alt="Image 03" class="d-sm-none">
            <img src="public/images/Carousel/3-h.jpeg" alt="Image 03" class="d-none d-sm-inline">
          </div>
        </li>
      </ul>
    </div>
  </div>
</div>

<?php
ob_start() ?>

<script>
  //var Scrollers = document.getElementsByClassName("photo_scroller");

  //for (var i = 0; i < Scrollers.length; i++) {

  //new Splide(Scrollers[i], {
  //arrows: false,
  //type: "loop",
  // height: "30em",
  //rewind: true,
  // rewindByDrag: 0,
  // drag: false,
  //perPage: true,
  //width: "100%",
  //padding: 0,
  //gap: 0,
  //pagination: false,
  //autoScroll: {
  //  speed: 0.2,
  //},
  //}).mount(window.splide.Extensions);
  //}

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
</script>
<?php
$script;
if (empty($script))
  $script = ob_get_clean();
else
  $script = $script . ob_get_clean();
?>