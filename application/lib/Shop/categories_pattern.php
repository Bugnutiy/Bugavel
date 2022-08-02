<?php if ($lvl == 0 and empty($category['childs'])) : ?>
    <li class="col-auto col-md-auto my-2">
        <a class="" href="/catalog?category_id=<?= $category['id'] ?>"><?= $category['name'] ?></a>
    </li>
<?php endif ?>

<?php if ($lvl == 0 and !empty($category['childs'])) : ?>
    <li class="col-auto col-md-auto my-2">
        <div class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><?= $category['name'] ?></a>
            <div class="dropdown-menu">

                <?php echo $this->cat_to_string($category['childs'], $lvl + 1); ?>

            </div>
        </div>
    </li>
<?php endif ?>

<?php if ($lvl > 0 and empty($category['childs'])) : ?>
    <a class="dropdown-item" href="/catalog?category_id=<?= $category['id'] ?>"><?= $category['name'] ?></a>
<?php endif ?>

<?php if ($lvl > 0 and !empty($category['childs'])) : ?>
    <div class="dropdown-item">
        <div class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><?= $category['name'] ?></a>
            <div class="dropdown-menu">
                <?php echo $this->cat_to_string($category['childs'], $lvl + 1); ?>
            </div>
        </div>
    </div>


<?php endif ?>