<table class="table table-striped table-bordered">
    <thead>
        <tr>
            <th scope="col">id</th>
            <th scope="col">Имя пользователя</th>
            <th scope="col">Статус <select name="state" id="state" onchange="StateChange(this)">
                    <option value="" <?= empty($_GET['state']) ? 'selected' : '' ?>>Все заказы</option>
                    <?php foreach ($shop::ORDER_STATES as $value) : ?>
                        <option value="<?= $value ?>" <?= (!empty($_GET['state']) and $_GET['state'] == $value) ? 'selected' : '' ?>><?= $value ?></option>
                    <?php endforeach ?>
                </select></th>
            <th scope="col">Оплачен</th>
            <th scope="col">Отменен
                <input type="checkbox" name="canceled" id="canceled" <?= !empty($_GET['canceled']) ? 'checked' : '' ?> onchange="Canceled(this)">
            </th>
            <th scope="col">Создан</th>
            <th scope="col">Изменен</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($orders as $order_id => $order_node) : ?>
            <tr onclick="document.location = '/admin/orders/order?id=<?= $order_id ?>'">
                <td><?= $order_id ?></td>
                <td><?= $order_node['user_name'] ?></td>
                <td><?= $order_node['state'] ?></td>
                <td><?= $order_node['payment_state'] ? 'Оплачен' : 'Не оплачен' ?></td>
                <td><?= $order_node['canceled'] ? '<span class="text-danger">Отменен</span>' : '' ?></td>
                <td><?= $order_node['created_at'] ?></td>
                <td><?= $order_node['changed_at'] ?></td>
            </tr>
        <?php endforeach ?>
    </tbody>
</table>

<?php ob_start() ?>
<script>
    function Canceled(el) {

        let href = window.location.href;

        if (el.checked) {
            if (href.lastIndexOf('?') == -1)
                href += '?';
            href += '&canceled=1';

        } else {
            href = href.replace('&canceled=1', '');
        }
        //console.log(href);
        window.location.href = href;

    }

    function StateChange(el) {
        if (el.value)
            window.location.href = '/admin/orders?state=' + el.value;
        else window.location.href = '/admin/orders';
    }
</script>
<?php $scripts = ob_get_clean() ?>