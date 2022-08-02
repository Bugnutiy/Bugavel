<div class="row justify-content-center">
    <div class="col-6">
        <?php if ($order) : ?>
            <div class="alert alert-success">
                Заказ успешно оформлен! В ближайшее время с вами свяжется оператор!
            </div>
        <?php else : ?>
            <div class="alert alert-danger">
                <strong>Ошибка!</strong> Что-то пошло не так, ваша <strong>корзина</strong> почему-то <strong>пуста</strong>!
            </div>
        <?php endif ?>
        <a href="/" class="btn btn-outline-secondary">Вернуться на главную</a>
    </div>
</div>