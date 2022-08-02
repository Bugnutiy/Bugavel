<?php if (!isset($registered)) : ?>
    <form action="/register" method="POST">
        <div class="row justify-content-center my-2">
            <div class="col-12 col-md-6 p-5 auth">
                <div class="form-group">
                    <label for="username" class="required-label">Ваше имя</label>
                    <input id="username" class="form-control" type="text" name="user_name" required>
                </div>
                <div class="row">
                    <div class="col-12 col-lg-6 ">
                        <div class="form-group">
                            <label for="online_phone" class="required-label">Телефон</label>
                            <input id="online_phone" name="phone" type="tel" maxlength="50" required="required" value="<?= (isset($_POST['phone']) ? $_POST['phone'] : '+7(___)___-__-__') ?>" pattern="\+7\s?[\(]{0,1}9[0-9]{2}[\)]{0,1}\s?\d{3}[-]{0,1}\d{2}[-]{0,1}\d{2}" placeholder="+7(___)___-__-__" class="form-control">
                        </div>
                    </div>
                    <div class="col-12 col-lg-6 align-self-end">
                        <div class="form-group">
                            <label for="email">Электронная почта</label>
                            <input id="email" class="form-control" type="email" name="email">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="required-label">Пароль</label>
                    <input id="password" class="form-control" type="password" name="password" required>
                </div>
                <div class="form-group">
                    <label for="address">Адрес доставки</label>
                    <textarea id="address" class="form-control" name="address" rows="2"></textarea>
                </div>
                <div class="row align-items-end">
                    <div class="col-12 col-lg-3">
                        <div class="form-group">
                            <label for="apartment">Номер квартиры</label>
                            <input id="apartment" class="form-control" type="text" name="apartment">
                        </div>
                    </div>
                    <div class="col-12 col-lg">
                        <div class="form-group">
                            <label for="additions">Дополнительно</label>
                            <textarea id="additions" class="form-control" name="additions" rows="1" placeholder="Например, номер подъезда"></textarea>
                        </div>
                    </div>
                </div>

                <button class="btn btn-success" type="submit">Зарегистрироваться</button>
            </div>
        </div>
    </form>


    <?php ob_start() ?>
    <script type="text/javascript">
        function setCursorPosition(pos, e) {
            e.focus();
            if (e.setSelectionRange) e.setSelectionRange(pos, pos);
            else if (e.createTextRange) {
                var range = e.createTextRange();
                range.collapse(true);
                range.moveEnd("character", pos);
                range.moveStart("character", pos);
                range.select()
            }
        }

        function mask(e) {
            //console.log('mask',e);
            var matrix = this.placeholder, // .defaultValue
                i = 0,
                def = matrix.replace(/\D/g, ""),
                val = this.value.replace(/\D/g, "");
            def.length >= val.length && (val = def);
            matrix = matrix.replace(/[_\d]/g, function(a) {
                return val.charAt(i++) || "_"
            });
            this.value = matrix;
            i = matrix.lastIndexOf(val.substr(-1));
            i < matrix.length && matrix != this.placeholder ? i++ : i = matrix.indexOf("_");
            setCursorPosition(i, this)
        }
        window.addEventListener("DOMContentLoaded", function() {
            var input = document.querySelector("#online_phone");
            input.addEventListener("input", mask, false);
            //input.focus();
            //setCursorPosition(3, input);
        });
    </script>
    <?php $script = ob_get_clean() ?>
<?php else : ?>
    <div class="row justify-content-center">
        <?php if ($registered) : ?>
            <div class="col-12 col-md-6">
                <div class="alert alert-success">
                    Регистрация прошла успешно!
                </div>
            </div>
        <?php else : ?>
            <div class="col-12 col-md-6">
                <div class="alert alert-danger">
                    Такой аккаунт уже существует
                </div>
            </div>
        <?php endif ?>
        <div class="w-100"></div>
        <div class="col-6">
            <a href="/" class="btn btn-outline-primary">Вернуться на главную</a>
        </div>
    </div>
<?php endif ?>