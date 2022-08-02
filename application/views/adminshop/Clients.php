<h1>Пользователи магазина</h1>

<table class="table table-striped">
    <thead class="thead-light">
        <tr>
            <th><span class="btn btn-link" onclick="order_id()">id</span></th>
            <th>Имя</th>
            <th>Телефон</th>
            <th>email</th>
            <th>Адрес</th>
            <th>Квартира</th>
            <th>Дополнительно</th>
            <th><span class="btn btn-link" onclick="orders()">Количество заказов</span></th>
            <th><span class="btn btn-link" onclick="created_at()">Зарегистрирован</span></th>
            <th><span class="btn btn-link" onclick="changed_at()">Последнее посещение</span></th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($clients as $user_id => $user_node) : ?>
            <tr>
                <td><?= $user_id ?></td>
                <td><?= $user_node['user_name'] ?></td>
                <td><?= $user_node['phone'] ?></td>
                <td><?= $user_node['email'] ?></td>
                <td><?= $user_node['address'] ?></td>
                <td><?= $user_node['apartment'] ?></td>
                <td><?= $user_node['additions'] ?></td>
                <td><?= $user_node['orders'] ?></td>
                <td><?= $user_node['created_at'] ?></td>
                <td><?= $user_node['changed_at'] ?></td>
            </tr>
        <?php endforeach ?>
    </tbody>
</table>

<?php ob_start() ?>
<script>
    function orders() {
        href = window.location.href;
        if (href.lastIndexOf('?') == -1)
            href += '?order=orders&direct=DESC';

        if (href.lastIndexOf('order=id') != -1) {
            href = href.replace('order=id', 'order=orders');
        }
        if (href.lastIndexOf('order=created_at') != -1) {
            href = href.replace('order=created_at', 'order=orders');
        }
        if (href.lastIndexOf('order=changed_at') != -1) {
            href = href.replace('order=changed_at', 'order=orders');
        }

        if (href.lastIndexOf('DESC') == -1) {
            href = href.replace('ASC', 'DESC');
        } else if (href.lastIndexOf('ASC') == -1) {
            href = href.replace('DESC', 'ASC');
        }
        console.log(href);
        window.location.href = href;
        //console.log(href.lastIndexOf('order=id'));
    }

    function order_id() {
        href = window.location.href;
        if (href.lastIndexOf('?') == -1)
            href += '?order=id&direct=DESC';

        if (href.lastIndexOf('order=orders') != -1) {
            href = href.replace('order=orders', 'order=id');
        }
        if (href.lastIndexOf('order=created_at') != -1) {
            href = href.replace('order=created_at', 'order=id');
        }
        if (href.lastIndexOf('order=changed_at') != -1) {
            href = href.replace('order=created_at', 'order=id');
        }


        if (href.lastIndexOf('DESC') == -1) {
            href = href.replace('ASC', 'DESC');
        } else if (href.lastIndexOf('ASC') == -1) {
            href = href.replace('DESC', 'ASC');
        }

        window.location.href = href;
    }

    function created_at() {
        href = window.location.href;
        if (href.lastIndexOf('?') == -1)
            href += '?order=orders&direct=DESC';

        if (href.lastIndexOf('order=id') != -1) {
            href = href.replace('order=id', 'order=created_at');
        }
        if (href.lastIndexOf('order=orders') != -1) {
            href = href.replace('order=orders', 'order=created_at');
        }
        if (href.lastIndexOf('order=changed_at') != -1) {
            href = href.replace('order=changed_at', 'order=created_at');
        }


        if (href.lastIndexOf('DESC') == -1) {
            href = href.replace('ASC', 'DESC');
        } else if (href.lastIndexOf('ASC') == -1) {
            href = href.replace('DESC', 'ASC');
        }
        console.log(href);
        window.location.href = href;
        //console.log(href.lastIndexOf('order=id'));
    }

    function changed_at() {
        href = window.location.href;
        if (href.lastIndexOf('?') == -1)
            href += '?order=orders&direct=DESC';

        if (href.lastIndexOf('order=id') != -1) {
            href = href.replace('order=id', 'order=orders');
        }
        if (href.lastIndexOf('order=created_at') != -1) {
            href = href.replace('order=created_at', 'order=changed_at');
        }
        if (href.lastIndexOf('order=orders') != -1) {
            href = href.replace('order=orders', 'order=changed_at');
        }

        if (href.lastIndexOf('DESC') == -1) {
            href = href.replace('ASC', 'DESC');
        } else if (href.lastIndexOf('ASC') == -1) {
            href = href.replace('DESC', 'ASC');
        }

        console.log(href);
        window.location.href = href;
        //console.log(href.lastIndexOf('order=id'));
    }
</script>
<?php $scripts = ob_get_clean() ?>