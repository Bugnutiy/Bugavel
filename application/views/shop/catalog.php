<?php
// dd($categories);
// dd($categories);
// dd($categories);
$category = $shop->categories->getDb($_GET['category_id']);

?>
<div class="row catalog">
    <div class="col-12">
        <h3 class="razdel my-4"><?= $category['name'] ?></h3>
    </div>
    <!-- <div class="col-12 sort"> -->
    <nav class="nav">
        <li class="nav-item">
            <span class="nav-link">Сортировать по: </span>
        </li>
        <li class="nav-item">
            <a href="/catalog?category_id=<?= $_GET['category_id'] ?>" class="nav-link <?= empty($_GET['sort']) ? 'disabled' : '' ?>">по новизне</a>
        </li>
        <li class="nav-item">
            <?php if (!empty($_GET['ASC'])) {
                if ($_GET['ASC'] !== 'DESC') {
                    $asc = 'DESC';
                } else {
                    $asc = 'ASC';
                }
            } else {
                $asc = 'ASC';
            } ?>
            <a href="/catalog?category_id=<?= $_GET['category_id'] ?>&sort=average_price&ASC=<?= $asc ?>" class="nav-link <?= !empty($_GET['sort']) and $_GET['sort'] === 'average_price' ? 'disabled' : '' ?>">по цене</a>
        </li>
    </nav>
    <!-- </div> -->
    <div class="col-12">
        <?php //dd($products) 
        ?>
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 product_cards">
            <?php foreach ($products as $product_id => $product) : ?>
                <?php $product = $shop->AllAboutProduct($product_id);
                //unset($product['product']['description']);
                if ($product) : ?>
                    <?php
                    $different = $product['data_struct']['different'];
                    $suffix = '';
                    if ($different === 'Вес' or $different === 'вес') {
                        $suffix = ' кг';
                    }
                    //dd($product)
                    ?>
                    <a class="card text-center col" href="/product?id=<?= $product_id ?>">
                        <img src="/public/images/photos/<?= current(json_decode($product['product']['photos'], true)) ?>" class="card-img-top" alt="">
                        <div class="card-body">
                            <h5 class="card-title"><?= $product['product']['name'] ?></h5>
                        </div>

                        <div class="card-footer">

                            <table class="w-100">
                                <tr>
                                    <th class="text-left"><small><?= $different ?></small></th>
                                    <th class="text-right"><small>цена</small></th>
                                </tr>
                                <?php foreach (array_reverse($product['samples'], true) as $property_id => $samples) : ?>
                                    <?php if ($different === 'Вес' or $different === 'вес') {
                                        $samples[$different] = rtrim($samples[$different], '0');
                                        $samples[$different] = rtrim($samples[$different], '.');
                                    }
                                    ?>
                                    <tr>

                                        <td class="text-left"><?= $samples[$different] . $suffix ?></td>

                                        <td class="text-right"><span class="price"><?= $samples['цена'] . ' руб' ?></span></td>

                                    </tr>
                                <?php endforeach ?>
                            </table>

                        </div>

                    </a>
                <?php endif ?>
            <?php endforeach ?>
        </div>
    </div>
</div>