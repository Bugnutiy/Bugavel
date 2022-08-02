<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <link rel="stylesheet" href="/public/styles/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="/public/styles/admin.css">
    <script src="/public/scripts/jquery-3.5.1.min.js"></script>

    <title><?php echo $title; ?></title>

</head>

<body>
    <div class="container-fluid">
        <a href="/">Домой</a>
        <a href="/admin/categories">Категории</a>
        <a href="/admin/properties">Свойства</a>
        <a href="/admin/products">Товары</a>
        <a href="/admin/orders">Заказы</a>
        <a href="/admin/clients">Пользователи</a>
        <a href="/admin/sales_acc">Учет</a>
    </div>

    <?php echo $content; ?>

    <?php if (isset($scripts)) echo $scripts; ?>
</body>

</html>