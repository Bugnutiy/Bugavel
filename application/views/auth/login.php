<?php if (isset($login) and $login) : ?>
    <div class="row justify-content-center">
        <div class="col-6">
            <div class="alert alert-success">
                Вход выполнен успешно!
            </div>
        </div>
    </div>
<?php endif ?>
<?php if (isset($login) and !$login) : ?>
    <div class="row justify-content-center">
        <div class="col-6">
            <div class="alert alert-danger">
                Неверный логин или пароль!
            </div>
        </div>
    </div>
<?php endif ?>

<?php //debug(!empty($login));
?>
<?php if (!isset($logged) and ((isset($login) and !$login) or !isset($login))) : ?>
    <form action="/login" method="POST">
        <div class="row justify-content-center my-2">
            <div class="col-12 col-md-6 p-5 auth">

                <div class="row">
                    <div class="col-12" id="phone_cont">
                        <div class="form-group">
                            <label for="online_phone" class="required-label">Телефон</label>
                            <input id="online_phone" name="login[]" type="tel" maxlength="50" required="required" value="<?= (isset($_POST['phone']) ? $_POST['phone'] : '+7(___)___-__-__') ?>" pattern="\+7\s?[\(]{0,1}9[0-9]{2}[\)]{0,1}\s?\d{3}[-]{0,1}\d{2}[-]{0,1}\d{2}" placeholder="+7(___)___-__-__" class="form-control">
                        </div>
                    </div>
                    <div class="col-12" id="email_cont" hidden>
                        <div class="form-group">
                            <label for="email" class="required-label">Электронная почта</label>
                            <input id="email" class="form-control" type="email" name="login[]">
                        </div>
                    </div>
                </div>

                <div class="row justify-content-between">
                    <label for="radio_phone" class="col-auto">Использовать телефон <input id="radio_phone" class="" type="radio" name="pm_radio" checked></label>

                    <label for="radio_email" class="col-auto">Использовать почту <input id="radio_email" class="" type="radio" name="pm_radio"></label>
                </div>


                <div class="form-group">
                    <label for="password" class="required-label">Пароль</label>
                    <input id="password" class="form-control" type="password" name="password" required>
                </div>
                <button class="btn btn-success" type="submit">Войти</button>
            </div>
        </div>
    </form>

    <?php ob_start() ?>
    <script type="text/javascript">
        function show_mail() {
            var email_cont = document.getElementById('email_cont');
            var email = document.getElementById('email');

            var phone_cont = document.getElementById("phone_cont");
            var online_phone = document.getElementById("online_phone");

            phone_cont.hidden = true;
            online_phone.value = null;
            online_phone.required = false;

            email_cont.hidden = false;
            email.required = true;

        }

        function show_phone() {
            var email_cont = document.getElementById('email_cont');
            var email = document.getElementById('email');

            var phone_cont = document.getElementById("phone_cont");
            var online_phone = document.getElementById("online_phone");

            phone_cont.hidden = false;
            online_phone.required = true;
            online_phone.value = '+7(___)___-__-__';

            email_cont.hidden = true;
            email.required = false;
        }

        window.addEventListener("DOMContentLoaded", function() {
            var radio_phone = document.getElementById("radio_phone");
            radio_phone.addEventListener("change", show_phone, false);


            var radio_email = document.getElementById("radio_email");
            radio_email.addEventListener("change", show_mail, false);
            //input.focus();
            //setCursorPosition(3, input);
        });
    </script>

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
    <?php $script = ob_get_clean(); ?>
<?php endif ?>
<?php if (isset($logged) and !isset($login)) : ?>
    <div class="row justify-content-center">
        <div class="col-6">
            <div class="alert alert-success">
                Вы уже вошли ранее!
            </div>
        </div>
    </div>
<?php endif ?>