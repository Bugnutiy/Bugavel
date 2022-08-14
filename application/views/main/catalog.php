    <? $category = [] ?>
    <!-- Хэдер -->
    <? if (!empty($_GET['category'])) : ?>
      <? $category = $categories[$_GET['category']];
      $category['id'] = $_GET['category']; ?>
      <header class="category_header ">
        <div class="container-lg">
          <div class="row text-light">
            <!-- <iframe src="https://www.youtube.com/embed/sM5VGcw578w" title="тату машинка HYBRAY" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->
            <?= $category['videos'] ?>
          </div>

        </div>
      </header>
    <? endif ?>
    <a class="big_logo row align-items-center" href="/">
      <div class="col-12">
        <img src="/public/images/logo/logo.png" alt="">
      </div>
    </a>


    <!-- Блок описания -->
    <!-- <div class=""> -->
    <? if (!empty($category)) : ?>
      <div class="container-lg description_block g-4 mb-3">
        <div class="row ">
          <div class="col py-3">
            <h3 class="text-center"><?= current($user)['lang'] == 'EN' ? (!empty($category) ? $category['name_en'] : "Catalog") :  $category['name'] ?></h3>

            <?= current($user)['lang'] == 'EN' ? (!empty($category) ? $category['description_en'] : "") : $category['description'] ?>

          </div>
        </div>
      </div>
    <? endif ?>
    <!-- Товары -->
    <div class="category_goods ">
      <div class="container-lg">
        <div class="header row align-items-center justify-content-center">
          <h3 class="col-auto mt-3 mt-md-0 mb-md-4"><?= current($user)['lang'] == 'EN' ? "Catalog" : "Каталог" ?></h3>
        </div>

        <div class="row cards justify-content-center vertical_cards">

          <? $i = 0;
          foreach ($products as $product_id => $product_node) : ?>
            <? if ($product_node['quantity']) : ?>
              <div class="card col-6 col-md-3 col-lg-2 mb-3">
                <div class="slider_wrapper_1">
                  <div class="slider_wrapper_2">
                    <section class="splide goods_slider" aria-label="Splide Basic HTML Example">
                      <div class="splide__track">
                        <div class="splide__list">
                          <? $images = json_decode($product_node['images'], 1);
                          foreach ($images as $src) : ?>
                            <a href="/catalog/product?id=<?= $product_id ?>" class="splide__slide"><img src="/<?= $src ?>" alt="<?= current($user)['lang'] == 'EN' ? "Product image" : "Изображение товара" ?>"></a>
                          <? endforeach ?>
                        </div>
                      </div>
                    </section>
                  </div>
                </div>
                <div class="card-body text-center pt-1 pb-1">
                  <h6 class="card-title m-0"><a href=""><b><?= current($user)['lang'] == 'EN' ? $product_node['name_en'] : $product_node['name'] ?></b></a></h6>
                  <p class="card-text"><?= current($user)['lang'] == 'EN' ? ($product_node['min_price_en'] == $product_node['max_price_en'] ? '$' . $product_node['min_price_en'] : 'from $' . $product_node['min_price_en']) : ($product_node['min_price'] == $product_node['max_price'] ? $product_node['min_price'] . ' руб.' : 'от ' . $product_node['min_price'] . ' руб.') ?></p>
                </div>
                <div class="row justify-content-center">
                  <?
                  if (!empty($_GET['lang'])) unset($_GET['lang']);
                  if (!empty($_GET['addcart'])) unset($_GET['addcart']);

                  $href_tmp = '?';
                  foreach ($_GET as $key => $value) {
                    $href_tmp .= "$key=$value&";
                  }

                  ?>
                  <div class="col-auto align-self-center">
                    <? if (count($product_node['properties']) > 1) : ?>

                      <!-- Button trigger modal -->
                      <a href="#" type="button" class="btn btn-outline-success text-success  text-center" data-bs-toggle="modal" data-bs-target="#propertyChoice<?= $product_id ?>">
                        <span class="bi bi-cart-plus"></span>
                      </a>

                      <!-- Modal -->
                      <div class="modal fade" id="propertyChoice<?= $product_id ?>" tabindex="-1" aria-labelledby="propertyChoiceLabel<?= $product_id ?>" aria-hidden="true">
                        <div class="modal-dialog">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="propertyChoiceLabel<?= $product_id ?>"><?= current($user)['lang'] == 'EN' ? "Please select a modification" : "Пожалуйста, выберите модификацию" ?></h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                              <div class="row row-cols-2 justify-content-between">
                                
                                <? foreach ($product_node['properties'] as $property_id => $property_node) : ?>
                                  <div class="col align-self-center"><?= current($user)['lang'] == 'EN' ? $property_node['name_en'] : $property_node['name'] ?></div>
                                  <div class="col-auto align-self-center"><?= current($user)['lang'] == 'EN' ? '$' . $property_node['price_en'] : $property_node['price'] . ' руб.' ?></div>
                                  <div class="col-auto my-2">
                                    <a href="<?= $href_tmp . "addcart=" . $property_id ?>" class="btn btn-outline-success text-success  text-center">
                                      <span class="bi bi-cart-plus"></span>
                                    </a>
                                  </div>
                                  <div class="w-100">
                                    <hr>
                                  </div>
                                <? endforeach ?>

                              </div>
                            </div>

                          </div>
                        </div>
                      </div>


                    <? else : ?>
                      <a href="<?= $href_tmp . "addcart=" . key($product_node['properties']) ?>" class="btn btn-outline-success text-success  text-center">
                        <span class="bi bi-cart-plus"></span>
                      </a>
                    <? endif ?>
                    <a href="/catalog/product?id=<?= $product_id ?>" class="btn btn-outline-primary text-primary  ms-2 text-center">
                      <span class="bi bi-eye"></span>
                    </a>
                  </div>
                </div>
              </div>
            <? $i++;
            endif; ?>
          <? endforeach ?>
          <?= $i ? '' : '<h3 class="text-center col-auto mt-3 mt-md-0 mb-md-4">' . (current($user)['lang'] == 'EN' ? "There are no products of this category in stock" : "На складе отсутствуют товары данной категории") . '</h3>' ?>

        </div>

        <!-- <div class="row cards horizontal_cards">

          <div class="col-12 mb-2 col-md-6 col-xxl-4">
            <div class="card">
              <div class="row g-0">

                <div class="col-4 align-self-center left">
                  <div class="slider_wrapper_1">
                    <div class="slider_wrapper_2">
                      <section class="splide goods_slider" aria-label="Splide Basic HTML Example">
                        <div class="splide__track">
                          <ul class="splide__list">
                            <li class="splide__slide"><img src="public/images/ALL/DSC02502_DxO.jpg" alt=""></li>
                            <li class="splide__slide"><img src="public/images/ALL/DSC02505_DxO.jpg" alt=""></li>
                            <li class="splide__slide"><img src="public/images/ALL/DSC02508_DxO.jpg" alt=""></li>
                          </ul>
                        </div>
                      </section>
                    </div>
                  </div>
                </div>
                <div class="col-8 align-self-center px-3 right">
                  <div class="row justify-content-center">
                    <div class="col">
                      <small class="text-black-50"><i>Hybrid-machine</i></small>
                      <h4>Hybrid black/gold</h4>
                      <div class="row justify-content-between">
                        <div class="col-auto align-self-center">
                          <span>$1200</span>
                        </div>
                        <div class="col-auto align-self-center">
                          <a href="" class="btn btn-outline-success text-success  text-center">
                            <span class="bi bi-cart-plus"></span>
                          </a>
                          <a href="" class="btn btn-outline-primary text-primary ms-2 text-center">
                            <span class="bi bi-eye"></span>
                          </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

              </div>
            </div>
          </div>

          <div class="col-12 mb-2 col-md-6 col-xxl-4">
            <div class="card">
              <div class="row g-0">

                <div class="col-4 align-self-center left">
                  <div class="slider_wrapper_1">
                    <div class="slider_wrapper_2">
                      <section class="splide goods_slider" aria-label="Splide Basic HTML Example">
                        <div class="splide__track">
                          <ul class="splide__list">
                            <li class="splide__slide"><img src="public/images/ALL/DSC02502_DxO.jpg" alt=""></li>
                            <li class="splide__slide"><img src="public/images/ALL/DSC02505_DxO.jpg" alt=""></li>
                            <li class="splide__slide"><img src="public/images/ALL/DSC02508_DxO.jpg" alt=""></li>
                          </ul>
                        </div>
                      </section>
                    </div>
                  </div>
                </div>
                <div class="col-8 align-self-center px-3 right">
                  <div class="row justify-content-center">
                    <div class="col">
                      <small class="text-black-50"><i>Hybrid-machine</i></small>
                      <h4>Hybrid black/gold</h4>
                      <div class="row justify-content-between">
                        <div class="col-auto align-self-center">
                          <span>$1200</span>
                        </div>
                        <div class="col-auto align-self-center">
                          <a href="" class="btn btn-outline-success text-success  text-center">
                            <span class="bi bi-cart-plus"></span>
                          </a>
                          <a href="" class="btn btn-outline-primary text-primary ms-2 text-center">
                            <span class="bi bi-eye"></span>
                          </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

              </div>
            </div>
          </div>

          <div class="col-12 mb-2 col-md-6 col-xxl-4">
            <div class="card">
              <div class="row g-0">

                <div class="col-4 align-self-center left">
                  <div class="slider_wrapper_1">
                    <div class="slider_wrapper_2">
                      <section class="splide goods_slider" aria-label="Splide Basic HTML Example">
                        <div class="splide__track">
                          <ul class="splide__list">
                            <li class="splide__slide"><img src="public/images/ALL/DSC02502_DxO.jpg" alt=""></li>
                            <li class="splide__slide"><img src="public/images/ALL/DSC02505_DxO.jpg" alt=""></li>
                            <li class="splide__slide"><img src="public/images/ALL/DSC02508_DxO.jpg" alt=""></li>
                          </ul>
                        </div>
                      </section>
                    </div>
                  </div>
                </div>
                <div class="col-8 align-self-center px-3 right">
                  <div class="row justify-content-center">
                    <div class="col">
                      <small class="text-black-50"><i>Hybrid-machine</i></small>
                      <h4>Hybrid black/gold</h4>
                      <div class="row justify-content-between">
                        <div class="col-auto align-self-center">
                          <span>$1200</span>
                        </div>
                        <div class="col-auto align-self-center">
                          <a href="" class="btn btn-outline-success text-success  text-center">
                            <span class="bi bi-cart-plus"></span>
                          </a>
                          <a href="" class="btn btn-outline-primary text-primary ms-2 text-center">
                            <span class="bi bi-eye"></span>
                          </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

              </div>
            </div>
          </div>


        </div> -->
      </div>
    </div>

    <? ob_start() ?>
    <script src="/public/scripts/splide.min.js"></script>
    <script src="/public/scripts/splide.autoscroll.min.js"></script>
    <script>
      var Sliders = document.getElementsByClassName('goods_slider')
      // dd(Scrollers);
      dd('Sliders:');
      for (var i = 0; i < Sliders.length; i++) {
        dd(Sliders[i]);
        new Splide(Sliders[i], {
          arrows: false,
          type: "loop",
          // height: "30em",
          rewind: true,
          // rewindByDrag: 0,
          drag: true,
          perPage: 1,
          // width: "auto",
          pagination: true,
          // focus: 2,
          autoplay: 0,
          // interval: 4000,
          interval: 3000,

          speed: 300,
          // autoScroll: false,
        }).mount();
      }

      // Carous = document.getElementById("text_index_slider");
      // console.log(Carous);
    </script>
    <? $script = ob_get_clean() ?>