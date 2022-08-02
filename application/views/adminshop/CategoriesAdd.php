<form action="/admin/categories/add/form" method="POST">
    <p><input type="text" name="name" placeholder="Название категории"></p>
    <p>
        Свойства:
        <select name="properties">
            <?foreach ($properties as $id => $property):?>
            <option value="<?= $id ?>"><?= $property['name'] ?></option>
            <? endforeach ?>
        </select>
    </p>
    <p>
        Родительская категория:
        <select name="parent">
            <option value="NULL">NULL</option>
            <?foreach ($categories as $id => $property):?>
            <option value="<?= $id ?>"><?= $property['name'] ?></option>
            <? endforeach ?>
        </select>
    </p>

    <input type="submit" value="Отпрваить">
</form>