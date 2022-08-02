<!-- Рандомные Товары -->
<h3 class="razdel my-4">Популярные товары</h3>

<div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 product_cards">
    <?php
    $rand = $products->random_products(20);
    //dd($rand);
    unset($rand[key($rand)]['description']);
    //debug($rand[key($rand)]);
    foreach ($rand as $product_id => $product) : ?>
        <?php $product = $shop->AllAboutProduct($product_id);
        if ($product) : ?>
            <?php
            //unset($product['product']['description']);
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
                <?
        // dd(count($property));
        ?>
                <div class="card-footer">

                    <table class="w-100">
                        <tr>
                            <th class="text-left"><small><?= $different ?></small></th>
                            <th class="text-right"><small>цена</small></th>
                        </tr>
                        <? foreach (array_reverse($product['samples'], true) as $property_id => $samples):?>
                        <?php if ($different === 'Вес' or $different === 'вес') {
                            $samples[$different] = rtrim($samples[$different], '0');
                            $samples[$different] = rtrim($samples[$different], '.');
                        }
                        ?>
                        <tr>

                            <td class="text-left"><?= $samples[$different] . $suffix ?></td>

                            <td class="text-right"><span class="price"><?= $samples['цена'] . ' руб' ?></span></td>

                        </tr>
                        <? endforeach ?>
                    </table>

                </div>

            </a>
        <?php endif ?>
    <?php endforeach ?>
</div>
<?
//dd($categories);
//dd($products);
//dd($samples);
?>

<!-- Конец товаров -->