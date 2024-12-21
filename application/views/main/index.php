<!-- Хэдер -->
<header class="index_header">
  <? require("parts/index_carousel.php"); ?>

</header>
<a class="big_logo row align-items-center" href="/">
  <div class="col-12">
    <img src="/public/images/logo/logo.png" alt="logo image">
  </div>
</a>
<!-- Приветствие -->
<div class="container-lg greeting ">
  <div class="row">
    <div class="col text-center text-black px-2">
      <div class=" px-3 pt-3 pb-4">
        <? if (current($user)['lang'] == "RU") : ?>
          <p>Добро пожаловать! Меня зовут Смагин Леонид, и я рад Вам представить проект STRONG & BOLD , созданный в сотрудничестве с талантливой татуировщицей Ефименко Натальей. Мы объединили мое стремление к качеству и стильному дизайну с творческой энергией Натальи, чтобы создать нечто уникальное — коллекцию оригинальных джинсов из Selvedge denim.</p>
          <p>Каждая пара джинсов — это не просто одежда, а произведение искусства. Используя премиальный деним и вдохновляясь суб-культурой, мы сделали джинсы, которые выделяются индивидуальностью, долговечностью и вниманием к деталям. </p>
          <p class="mb-0">Эти джинсы — для тех, кто ценит эксклюзивность и готов подчеркнуть свой стиль.</p>
        <? else : ?>
          <p>Welcome! My name is Leonid Smagin, and I am glad to present you the project STRONG & BOLD, created in collaboration with the talented tattoo artist Natalia Efimenko. We combined my passion for quality and stylish design with Natalia's creative energy to create something unique — a collection of original jeans from Selvedge denim.</p>
          <p>Each pair of jeans is not just a piece of clothing, but a work of art. Using premium denim and inspired by sub-culture, we have created jeans that stand out for their individuality, durability and attention to detail. </p>
          <p class="mb-0">These jeans are for those who value exclusivity and are ready to emphasize their style.</p>
        <? endif ?>

      </div>
    </div>
  </div>
</div>

<!-- Категории -->
<!-- <div class="index_categories mt-3">
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
</div> -->


<? require("parts/products_cards.php") ?>


<!-- Скрипты -->