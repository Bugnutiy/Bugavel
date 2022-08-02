<div class="container-fluid">
    <?php
    $data_struct = json_decode($properties_pointer['data_struct'], true);
    // dd($product);
    // dd($category);
    // dd($properties_pointer);
    // dd($property);
    $node = [];
    if (!empty($property)) {

        $node = current($property);
        //debug($node);
        $node['id'] = key($property);
    }
    // dd($node['Лечебный']);
    ?>
    <h1><?= $add ? 'Добавление экземпляра' : 'Редактирование экземпляра' ?></h1>
    <form action="/admin/products/change/property/form" method="POST">
        <input type="text" hidden name="tname" value="<?= $properties_pointer['name'] ?>">
        <? if(!empty($node['id']) and !$add):?>
        <input type="text" hidden name="property_id" value="<?= $node['id'] ?>">
        <? endif ?>
        <input type="text" hidden name="fields[product_id]" value="<?= $_GET['product_id'] ?>">
        <?foreach ($data_struct['fields'] as $name => $properties):?>
        <p>
            <? if(!($name=='created_at' or $name=='changed_at')):?>
            <label>
                <?= $name ?>:
                <?php
                switch ($properties['data_type']) {
                    case 'BOOLEAN': ?>
                        Да <input value="1" type="radio" name="fields[<?= $name ?>]" <?= ($properties['NULL'] == 'NOT NULL') ? 'required' : '' ?> <?= (!empty($node) and $node[$name] == '1') ? 'checked' : '' ?>>
                        Нет <input value="0" type="radio" name="fields[<?= $name ?>]" <?= ($properties['NULL'] == 'NOT NULL') ? 'required' : '' ?> <?= (!empty($node) and $node[$name] == '1') ? '' : 'checked' ?>>
                        <?if($properties['NULL']=='NULL'):?>
                        NULL <input value="NULL" type="radio" name="fields[<?= $name ?>]" <? if(!empty($node)){ if($node[$name]==NULL) echo 'checked' ; }else echo 'checked' ?>>
                        <? endif ?>
                    <?php break;

                    case 'FLOAT': ?>
                        <input type="number" step="any" name="fields[<?= $name ?>]" placeholder="Число" <?= ($properties['NULL'] == 'NOT NULL') ? 'required' : '' ?> value="<?= !empty($node) ? $node[$name] : '' ?>">
                    <?php break;

                    case 'DECIMAL(19,2)': ?>
                        <input type="number" step="0.01" name="fields[<?= $name ?>]" placeholder="Число" <?= ($properties['NULL'] == 'NOT NULL') ? 'required' : '' ?> value="<?= !empty($node) ? $node[$name] : '' ?>">
                    <?php break;

                    case 'DECIMAL(19,3)': ?>
                        <input type="number" step="0.001" name="fields[<?= $name ?>]" placeholder="Число" <?= ($properties['NULL'] == 'NOT NULL') ? 'required' : '' ?> value="<?= !empty($node) ? $node[$name] : '' ?>">
                    <?php break;

                    default: ?>
                        <input type="text" name="fields[<?= $name ?>]" id="" placeholder="Текст" <?= ($properties['NULL'] == 'NOT NULL') ? 'required' : '' ?> value="<?= !empty($node) ? $node[$name] : '' ?>">
                <?php break;
                }

                ?>
            </label>
            <? endif ?>
        </p>
        <? endforeach ?>
        <input type="submit">
    </form>
</div>