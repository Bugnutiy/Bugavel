<div class="container-fluid">

    <h1>Экземпляры товара:</h1>

    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>id</th>
                <th>product_id</th>
                <?
            $data_struct=json_decode($properties_pointer['data_struct'],true);
            foreach ($data_struct['fields'] as $field_name => $struct):?>
                <?if(!($field_name=='created_at' or $field_name=='changed_at')):?>
                <th><?= $field_name ?></th>
                <?endif?>
                <? endforeach ?>
                <th>Действия</th>
            </tr>
        </thead>
        <tbody>
            <? foreach($properties as $id=>$fields):?>

            <tr>
                <td><?= $id ?></td>
                <?foreach ($fields as $name => $value):?>
                <?if(!($name=='created_at' or $name=='changed_at')):?>
                <td><?= $value ?></td>
                <?endif?>
                <? endforeach ?>
                <td><a href="/admin/products/change/property/del?tname=<?= $properties_pointer['name'] ?>&id=<?= $id ?>">Удалить</a> <a href="/admin/products/change/property?product_id=<?= $product_id ?>&property_id=<?= $id ?>">Изменить</a></td>
            </tr>

            <? endforeach ?>
        </tbody>
    </table>
    <a href="/admin/products/change/property?product_id=<?= $product_id ?>">Добавить экземпляр</a>
</div>
<? 
// dd($vars);
// dd($product_id);
// dd($product);
// dd($properties_pointer);
// dd($properties);
// dd($category);
?>