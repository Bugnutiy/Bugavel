<style>
    th,
    td {
        border: 1px solid black;
        padding: 10px;
    }
</style>
<table>
    <tr>
        <th>id</th>
        <th>Название</th>
        <th>Свойства</th>
        <th>Родительская</th>
        <th>Действия</th>
    </tr>
    <?foreach ($categories as $id => $category):?>
    <tr>
        <td><?= $id ?></td>
        <td><?= $category['name'] ?></td>
        <td>
            <?= $properties[$category['properties_id']]['name'] ?>
        </td>
        <td>
            <?
            if($category['parent']!=NULL){
                echo $categories[$category['parent']]['name'];
            }
        ?>
        </td>
        <td><a href="/admin/categories/del?id=<?= $id ?>">Удалить</a></td>
    </tr>
    <? endforeach ?>

</table>
<div><a href="/admin/categories/add">Добавить категории</a> </div>