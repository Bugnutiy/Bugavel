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
          <p>Рад приветствовать вас на моем сайте! Я занимаюсь производством тату машинок с 2003 года. За 19 лет упорной работы я создавал классические аппараты, разработал и запатентовал уникальные гибридные машинки (HYBRID V1, GORILLA HYBRID V2 , HYBRAY, DIESEL BEE HYBRID V3). Благодаря сочетанию хлесткого удара индукции и стабильности ротора, они дают по настоящему наилучшую работу в нанесении татуировки на сегодняшний день.</p>
          <p class="mb-0">Лучшие мастера России и мира уже выбрали нас как приоритетное оборудование для себя. Я люблю создавать по настоящему особенные и уникальные машинки для татуировки.</p>
        <? else : ?>
          <p>I am glad to welcome you to my website! I have been producing tattoo machines since 2003 . For 19 years of hard work, I have created classic machines, developed and patented unique hybrid machines (HYBRID V1, GORILLA HYBRID V2, HYBRAY, DIESEL BEE HYBRID V3). Due to the combination of the whiplash of induction and the stability of the rotor, they provide the truly best work in tattooing for today.</p>
          <p class="mb-0">The best masters of Russia and the world have already chosen us as a priority equipment for themselves. I love to create truly special and unique tattoo machines.</p>
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
