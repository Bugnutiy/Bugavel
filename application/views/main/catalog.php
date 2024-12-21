    <? $category = [] ?>
    <!-- Хэдер -->
    <? if (!empty($_GET['category'])) : ?>
      <? $category = $categories[$_GET['category']];
      $category['id'] = $_GET['category']; ?>
      <header class="category_header ">
        <div class="container-lg">
          <div class="row text-light">
            <?= $category['videos'] ?>
          </div>

        </div>
      </header>
    <? endif ?>
    <? if (empty($category['videos'])) : ?>
      <div class="mb-5"></div>
    <? endif ?>

    <a class="big_logo row align-items-center" href="/">
      <div class="col-12">
        <img src="/public/images/logo/logo.png" alt="">
      </div>
    </a>
    <!-- Блок описания -->
    <? if (!empty($category) && strlen($category['description']) != 11) : ?>
      <div class="container-lg description_block g-4 mb-3">
        <div class="row ">
          <div class="col py-3">
            <h3 class="text-center"><?= current($user)['lang'] !== 'RU' ? (!empty($category) ? $category['name_en'] : "Catalog") :  $category['name'] ?></h3>

            <?= current($user)['lang'] !== 'RU' ? (!empty($category) ? $category['description_en'] : "") : $category['description'] ?>

          </div>
        </div>
      </div>
    <? endif ?>
    <!-- Товары -->
    <? require("parts/products_cards.php")?>