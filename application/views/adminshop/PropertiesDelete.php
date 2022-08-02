<div class="container">
    <div class="row justify-content-center">
        <div class="col-12 col-md-6 text-center" style="border: 1px solid black;">
            <form action="/admin/properties/del?id=<?= $id ?>" method="POST">
                <p>Вы действительно хотите удалить свойство "<?= $property['name'] ?>"</p>
                <input type="submit" name="Delete" value="Удалить">
            </form>
        </div>
    </div>
</div>