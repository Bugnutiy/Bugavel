<div class="container-fluid sales_acc">
    <h1>Период</h1>
    <form action="" method="POST">
        <div class="form-group row">
            <label for="start" class="col-auto">с <input id="start" class="form-control" type="date" name="start" required value="<?= !empty($_POST['start']) ? $_POST['start'] : '' ?>"></label>

            <label for="end" class="col-auto">до <input id="end" class="form-control" type="date" name="end" required value="<?= !empty($_POST['end']) ? $_POST['end'] : '' ?>"></label>

        </div>

        <button type="submit" class="btn btn-primary">Подтвердить</button>
    </form>
    <h1>Учёт</h1>
    <div class="row">
        <div class="col-12 order-12">
            <table class="table table-striped">
                <thead class="thead-light">
                    <tr>
                        <th>№</th>
                        <th>id товара</th>
                        <th>id свойства</th>
                        <th>Название товара</th>
                        <th>Остаток на складе</th>
                        <th>Продано шт.</th>
                        <th>Закупочная цена</th>
                        <th>Цена продажи</th>
                        <th>Выручка</th>
                        <th>Прибыль</th>
                    </tr>
                </thead>
                <tbody>

                    <?php if (!empty($megacart)) : ?>
                        <?php $i = 0;
                        $proceeds = 0;
                        $profit = 0;
                        foreach ($megacart as $product_id => $product_node) : ?>
                            <?php foreach ($product_node['properties'] as $property_id => $property_node) : ?>
                                <tr>
                                    <td><?= ++$i ?></td>
                                    <td><?= $product_id ?></td>
                                    <td><?= $property_id ?></td>
                                    <td><?= $product_node['name'] ?> <span class="text-danger"><?= $property_node['type'] ?></span></td>
                                    <td><?= $property_node['количество'] ?></td>
                                    <td><?= $property_node['quantity'] ?></td>
                                    <td><?= $property_node['закупочная цена'] ?> руб.</td>
                                    <td><?= $property_node['цена'] ?> руб.</td>
                                    <?php $proc = $property_node['цена'] * $property_node['quantity'];
                                    $proceeds += $proc; ?>
                                    <td><?= $proc ?> руб.</td>

                                    <?php $prof = ($property_node['цена'] - $property_node['закупочная цена']) * $property_node['quantity'];
                                    $profit += $prof; ?>
                                    <td><?= $prof ?> руб.</td>

                                </tr>
                            <?php endforeach ?>
                        <?php endforeach ?>
                    <?php endif ?>
                </tbody>
            </table>
        </div>
        <?php if (!empty($megacart)) : ?>
            <div class="col-12 order-1">
                <div class="row justify-content-end p-4">
                    <div class="col-auto">Общая выручка <span class="text-info"><?= number_format($proceeds, '2', '.', ' ') ?> руб.</span></div>
                    <div class="col-auto">Общая прибыль <span class="text-info"><?= number_format($profit, '2', '.', ' ') ?> руб.</span></div>
                </div>
            </div>
        <?php endif ?>
    </div>
</div>