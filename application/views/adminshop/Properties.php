<style>
    th,
    td {
        border: 1px solid black;
        padding: 10px;
    }
</style>
<?
//debug($properties)
?>
<table>
    <tr>
        <th>id</th>
        <th>Название</th>
        <th>Свойства</th>
        <th>Действия</th>
    </tr>
    <?foreach ($properties as $id=>$value):?>
    <tr>
        <td><?= $id ?></td>
        <td><?= $value['name'] ?></td>
        <td>
            <?
            $data_struct=json_decode($value['data_struct'],true);
            foreach ($data_struct['fields'] as $key => $value):?>
            <a class="property"><?= $key ?></a>
            <? endforeach ?>

        </td>
        <td>
            <a href="/admin/properties/del?id=<?= $id ?>">Удалить</a>
            <a href="/admin/properties/change?id=<?= $id ?>">Изменить</a>
        </td>
    </tr>
    <?endforeach?>
</table>

<div><a href="/admin/properties/add">Добавить свойства</a> </div>