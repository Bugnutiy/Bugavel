<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="shortcut icon" href="/public/images/logo/logo.svg" type="image/svg+xml">
    <link rel="stylesheet" href="/public/styles/default.css">

    <script src="/public/scripts/bootstrap.bundle.min.js"></script>
    <title><?= $title ?></title>
</head>

<body>

    <?php echo $content; ?>


    <script src="/public/scripts/jquery-3.5.1.min.js"></script>
    <script src="/public/scripts/popper.min.js"></script>
    <script src="/public/scripts/bootstrap.min.js"></script>
    <?php
    if (isset($script)) echo $script;
    ?>
</body>

</html>