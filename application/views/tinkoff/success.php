<div class="container-lg text-justify text-md-center py-3">
  <div class="row justify-content-center">
    <div class="col-12 col-md-5">
      <h1 class="text-success text-center">Заказ принят!</h1>
      <p>В ближайшее время с вами свяжется оператор по электронной почте, указанной на сайте банка.</p>
      <p>Чтобы ускорить обработку заказа, а также указать более удобный вид связи, вы можете заполнить форму</p>
    </div>
    <div class="w-100"></div>
    <div class="col-auto">
      <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#tinkoffOrderModal"><?= current($user)['lang'] == 'RU' ? 'Заполнить форму' : 'Заполнить форму' ?></button>
    </div>
  </div>

<form action="?order=1" method="POST" enctype="multipart/form-data" class="modal fade" id="tinkoffOrderModal" tabindex="-1" role="dialog" aria-hidden="true">
  <input type="hidden" name=>
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title"><?= current($user)['lang'] == 'RU' ? 'Уточнить заказ' : 'Information' ?></h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="mb-3 col-12 col-sm">
              <label for="order_first_name" class="form-label required"><?= current($user)['lang'] == 'RU' ? 'Имя' : 'First name' ?></label>
              <input type="text" required class="form-control" name="first_name" id="order_first_name" placeholder="<?= current($user)['lang'] == 'RU' ? 'Имя' : 'First name' ?>" value="<?= current($user)['first_name'] ?>">
            </div>
            <div class="mb-3 col-12 col-sm">
              <label for="order_second_name" class="form-label required"><?= current($user)['lang'] == 'RU' ? 'Фамилия' : 'Second name' ?></label>

              <input type="text" required class="form-control" name="second_name" id="order_second_name" placeholder="<?= current($user)['lang'] == 'RU' ? 'Фамилия' : 'Second name' ?>" value="<?= current($user)['second_name'] ?>">
            </div>
          </div>

          <!-- Email -->
          <div class="mb-3">
            <label for="order_email" class="form-label required">E-mail</label>
            <input type="email" required class="form-control" name="email" id="order_email" placeholder="<?= current($user)['lang'] == 'RU' ? 'Введите вашу электронную почту' : 'Type your e-mail here' ?>" value="<?= current($user)['email'] ?>">
          </div>
          
          <!-- PHONE -->
          <div class="mb-3 phone">
            <link rel="stylesheet" href="/public/intltel/css/intlTelInput.min.css">

            <label for="order_phone" class="form-label required"><?= current($user)['lang'] == 'RU' ? 'Номер телефона' : 'Phone number' ?></label>
            <input type="tel" class="form-control" name="phone" id="order_phone" required value="<?= empty(current($user)['phone']) ? '+7' : current($user)['phone'] ?>">
            <span id="order_valid-msg" class="d-none text-success">✓ Valid</span>
            <span id="order_error-msg" class="d-none text-danger"></span>

            <script src="/public/intltel/js/intlTelInput.js"></script>
            <script>
              var input = document.querySelector("#order_phone"),
                errorMsg = document.querySelector("#order_error-msg"),
                validMsg = document.querySelector("#order_valid-msg");

              // here, the index maps to the error code returned from getValidationError - see readme
              <? if (current($user)['lang'] == 'RU') : ?>
                var errorMap = ["Неверный номер", "Неверный код страны", "Слишком короткий", "Слишком длинный", "Неверный номер", "Неверный номер", "Неверный номер"];
              <? else : ?>
                var errorMap = ["Invalid number", "Invalid country code", "Too short", "Too long", "Invalid number"];
              <? endif ?>

              // initialise plugin
              var iti = window.intlTelInput(input, {
                utilsScript: "/public/intltel/js/utils.js"
              });

              var reset = function() {
                input.classList.remove("error");
                errorMsg.innerHTML = "";
                errorMsg.classList.add("d-none");
                validMsg.classList.add("d-none");
              };

              // on blur: validate
              input.addEventListener('blur', function() {
                reset();
                if (input.value.trim()) {
                  if (iti.isValidNumber()) {
                    validMsg.classList.remove("d-none");
                  } else {
                    input.classList.add("error");
                    var errorCode = iti.getValidationError();
                    errorMsg.innerHTML = errorMap[errorCode];
                    errorMsg.classList.remove("d-none");
                  }
                }
              });

              // on keyup / change flag: reset
              input.addEventListener('change', reset);
              input.addEventListener('keyup', reset);
            </script>
          </div>

          <!-- Instagram -->
          <div class="mb-3">
            <label for="order_instagram" class="form-label"><?= current($user)['lang'] == 'RU' ? 'Аккаунт инстаграм (необязательно)' : 'Instagram account (optional)' ?></label>
            <input type="text" class="form-control" name="instagram" id="order_instagram" placeholder="instagram" value="<?= current($user)['instagram'] ?>">
          </div>

          <!-- Country -->
          <!-- <div class="mb-3 country">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.12.6/js/standalone/selectize.min.js" integrity="sha256-+C0A5Ilqmu4QcSPxrlGpaZxJ04VjsRjKu+G82kl5UJk=" crossorigin="anonymous"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.12.6/css/selectize.bootstrap3.min.css" integrity="sha256-ze/OEYGcFbPRmvCnrSeKbRTtjG4vGLHXgOqsyLFTRjg=" crossorigin="anonymous" />
            <? if (current($user)['lang'] == 'EN') : ?>
              <label for="billing_country" class="form-label required">Country/Region</label>
              <select name="billing_country" required id="order_billing_country" class="form-control country_select" autocomplete="country" data-placeholder="Select a country / region…" data-label="Country/Region" tabindex="-1" aria-hidden="true" value="<?= current($user)['billing_country'] ?>">
                <option value="" hidden selected>Select a country / region…</option>
                <option value="AF">Afghanistan</option>
                <option value="AX">Åland Islands</option>
                <option value="AL">Albania</option>
                <option value="DZ">Algeria</option>
                <option value="AS">American Samoa</option>
                <option value="AD">Andorra</option>
                <option value="AO">Angola</option>
                <option value="AI">Anguilla</option>
                <option value="AQ">Antarctica</option>
                <option value="AG">Antigua and Barbuda</option>
                <option value="AR">Argentina</option>
                <option value="AM">Armenia</option>
                <option value="AW">Aruba</option>
                <option value="AU">Australia</option>
                <option value="AT">Austria</option>
                <option value="AZ">Azerbaijan</option>
                <option value="BS">Bahamas</option>
                <option value="BH">Bahrain</option>
                <option value="BD">Bangladesh</option>
                <option value="BB">Barbados</option>
                <option value="BY">Belarus</option>
                <option value="PW">Belau</option>
                <option value="BE">Belgium</option>
                <option value="BZ">Belize</option>
                <option value="BJ">Benin</option>
                <option value="BM">Bermuda</option>
                <option value="BT">Bhutan</option>
                <option value="BO">Bolivia</option>
                <option value="BQ">Bonaire, Saint Eustatius and Saba</option>
                <option value="BA">Bosnia and Herzegovina</option>
                <option value="BW">Botswana</option>
                <option value="BV">Bouvet Island</option>
                <option value="BR">Brazil</option>
                <option value="IO">British Indian Ocean Territory</option>
                <option value="BN">Brunei</option>
                <option value="BG">Bulgaria</option>
                <option value="BF">Burkina Faso</option>
                <option value="BI">Burundi</option>
                <option value="KH">Cambodia</option>
                <option value="CM">Cameroon</option>
                <option value="CA">Canada</option>
                <option value="CV">Cape Verde</option>
                <option value="KY">Cayman Islands</option>
                <option value="CF">Central African Republic</option>
                <option value="TD">Chad</option>
                <option value="CL">Chile</option>
                <option value="CN">China</option>
                <option value="CX">Christmas Island</option>
                <option value="CC">Cocos (Keeling) Islands</option>
                <option value="CO">Colombia</option>
                <option value="KM">Comoros</option>
                <option value="CG">Congo (Brazzaville)</option>
                <option value="CD">Congo (Kinshasa)</option>
                <option value="CK">Cook Islands</option>
                <option value="CR">Costa Rica</option>
                <option value="HR">Croatia</option>
                <option value="CU">Cuba</option>
                <option value="CW">Curaçao</option>
                <option value="CY">Cyprus</option>
                <option value="CZ">Czech Republic</option>
                <option value="DK">Denmark</option>
                <option value="DJ">Djibouti</option>
                <option value="DM">Dominica</option>
                <option value="DO">Dominican Republic</option>
                <option value="EC">Ecuador</option>
                <option value="EG">Egypt</option>
                <option value="SV">El Salvador</option>
                <option value="GQ">Equatorial Guinea</option>
                <option value="ER">Eritrea</option>
                <option value="EE">Estonia</option>
                <option value="SZ">Eswatini</option>
                <option value="ET">Ethiopia</option>
                <option value="FK">Falkland Islands</option>
                <option value="FO">Faroe Islands</option>
                <option value="FJ">Fiji</option>
                <option value="FI">Finland</option>
                <option value="FR">France</option>
                <option value="GF">French Guiana</option>
                <option value="PF">French Polynesia</option>
                <option value="TF">French Southern Territories</option>
                <option value="GA">Gabon</option>
                <option value="GM">Gambia</option>
                <option value="GE">Georgia</option>
                <option value="DE">Germany</option>
                <option value="GH">Ghana</option>
                <option value="GI">Gibraltar</option>
                <option value="GR">Greece</option>
                <option value="GL">Greenland</option>
                <option value="GD">Grenada</option>
                <option value="GP">Guadeloupe</option>
                <option value="GU">Guam</option>
                <option value="GT">Guatemala</option>
                <option value="GG">Guernsey</option>
                <option value="GN">Guinea</option>
                <option value="GW">Guinea-Bissau</option>
                <option value="GY">Guyana</option>
                <option value="HT">Haiti</option>
                <option value="HM">Heard Island and McDonald Islands</option>
                <option value="HN">Honduras</option>
                <option value="HK">Hong Kong</option>
                <option value="HU">Hungary</option>
                <option value="IS">Iceland</option>
                <option value="IN">India</option>
                <option value="ID">Indonesia</option>
                <option value="IR">Iran</option>
                <option value="IQ">Iraq</option>
                <option value="IE">Ireland</option>
                <option value="IM">Isle of Man</option>
                <option value="IL">Israel</option>
                <option value="IT">Italy</option>
                <option value="CI">Ivory Coast</option>
                <option value="JM">Jamaica</option>
                <option value="JP">Japan</option>
                <option value="JE">Jersey</option>
                <option value="JO">Jordan</option>
                <option value="KZ">Kazakhstan</option>
                <option value="KE">Kenya</option>
                <option value="KI">Kiribati</option>
                <option value="KW">Kuwait</option>
                <option value="KG">Kyrgyzstan</option>
                <option value="LA">Laos</option>
                <option value="LV">Latvia</option>
                <option value="LB">Lebanon</option>
                <option value="LS">Lesotho</option>
                <option value="LR">Liberia</option>
                <option value="LY">Libya</option>
                <option value="LI">Liechtenstein</option>
                <option value="LT">Lithuania</option>
                <option value="LU">Luxembourg</option>
                <option value="MO">Macao</option>
                <option value="MG">Madagascar</option>
                <option value="MW">Malawi</option>
                <option value="MY">Malaysia</option>
                <option value="MV">Maldives</option>
                <option value="ML">Mali</option>
                <option value="MT">Malta</option>
                <option value="MH">Marshall Islands</option>
                <option value="MQ">Martinique</option>
                <option value="MR">Mauritania</option>
                <option value="MU">Mauritius</option>
                <option value="YT">Mayotte</option>
                <option value="MX">Mexico</option>
                <option value="FM">Micronesia</option>
                <option value="MD">Moldova</option>
                <option value="MC">Monaco</option>
                <option value="MN">Mongolia</option>
                <option value="ME">Montenegro</option>
                <option value="MS">Montserrat</option>
                <option value="MA">Morocco</option>
                <option value="MZ">Mozambique</option>
                <option value="MM">Myanmar</option>
                <option value="NA">Namibia</option>
                <option value="NR">Nauru</option>
                <option value="NP">Nepal</option>
                <option value="NL">Netherlands</option>
                <option value="NC">New Caledonia</option>
                <option value="NZ">New Zealand</option>
                <option value="NI">Nicaragua</option>
                <option value="NE">Niger</option>
                <option value="NG">Nigeria</option>
                <option value="NU">Niue</option>
                <option value="NF">Norfolk Island</option>
                <option value="KP">North Korea</option>
                <option value="MK">North Macedonia</option>
                <option value="MP">Northern Mariana Islands</option>
                <option value="NO">Norway</option>
                <option value="OM">Oman</option>
                <option value="PK">Pakistan</option>
                <option value="PS">Palestinian Territory</option>
                <option value="PA">Panama</option>
                <option value="PG">Papua New Guinea</option>
                <option value="PY">Paraguay</option>
                <option value="PE">Peru</option>
                <option value="PH">Philippines</option>
                <option value="PN">Pitcairn</option>
                <option value="PL">Poland</option>
                <option value="PT">Portugal</option>
                <option value="PR">Puerto Rico</option>
                <option value="QA">Qatar</option>
                <option value="RE">Reunion</option>
                <option value="RO">Romania</option>
                <option value="RU">Russia</option>
                <option value="RW">Rwanda</option>
                <option value="BL">Saint Barthélemy</option>
                <option value="SH">Saint Helena</option>
                <option value="KN">Saint Kitts and Nevis</option>
                <option value="LC">Saint Lucia</option>
                <option value="SX">Saint Martin (Dutch part)</option>
                <option value="MF">Saint Martin (French part)</option>
                <option value="PM">Saint Pierre and Miquelon</option>
                <option value="VC">Saint Vincent and the Grenadines</option>
                <option value="WS">Samoa</option>
                <option value="SM">San Marino</option>
                <option value="ST">São Tomé and Príncipe</option>
                <option value="SA">Saudi Arabia</option>
                <option value="SN">Senegal</option>
                <option value="RS">Serbia</option>
                <option value="SC">Seychelles</option>
                <option value="SL">Sierra Leone</option>
                <option value="SG">Singapore</option>
                <option value="SK">Slovakia</option>
                <option value="SI">Slovenia</option>
                <option value="SB">Solomon Islands</option>
                <option value="SO">Somalia</option>
                <option value="ZA">South Africa</option>
                <option value="GS">South Georgia/Sandwich Islands</option>
                <option value="KR">South Korea</option>
                <option value="SS">South Sudan</option>
                <option value="ES">Spain</option>
                <option value="LK">Sri Lanka</option>
                <option value="SD">Sudan</option>
                <option value="SR">Suriname</option>
                <option value="SJ">Svalbard and Jan Mayen</option>
                <option value="SE">Sweden</option>
                <option value="CH">Switzerland</option>
                <option value="SY">Syria</option>
                <option value="TW">Taiwan</option>
                <option value="TJ">Tajikistan</option>
                <option value="TZ">Tanzania</option>
                <option value="TH">Thailand</option>
                <option value="TL">Timor-Leste</option>
                <option value="TG">Togo</option>
                <option value="TK">Tokelau</option>
                <option value="TO">Tonga</option>
                <option value="TT">Trinidad and Tobago</option>
                <option value="TN">Tunisia</option>
                <option value="TR">Turkey</option>
                <option value="TM">Turkmenistan</option>
                <option value="TC">Turks and Caicos Islands</option>
                <option value="TV">Tuvalu</option>
                <option value="UG">Uganda</option>
                <option value="UA">Ukraine</option>
                <option value="AE">United Arab Emirates</option>
                <option value="GB">United Kingdom (UK)</option>
                <option value="US">United States (US)</option>
                <option value="UM">United States (US) Minor Outlying Islands</option>
                <option value="UY">Uruguay</option>
                <option value="UZ">Uzbekistan</option>
                <option value="VU">Vanuatu</option>
                <option value="VA">Vatican</option>
                <option value="VE">Venezuela</option>
                <option value="VN">Vietnam</option>
                <option value="VG">Virgin Islands (British)</option>
                <option value="VI">Virgin Islands (US)</option>
                <option value="WF">Wallis and Futuna</option>
                <option value="EH">Western Sahara</option>
                <option value="YE">Yemen</option>
                <option value="ZM">Zambia</option>
                <option value="ZW">Zimbabwe</option>
              </select>
            <? else : ?>
              <label for="order_billing_country" class="form-label required">Страна/Регион</label>
              <select name="billing_country" required id="order_billing_country" class="form-control country_select" autocomplete="country" data-placeholder="Выберите страну/регион…" data-label="Страна/регион" tabindex="-1" aria-hidden="true" value="<?= current($user)['billing_country'] ?>">
                <option value="" hidden selected>Выберите страну/регион…</option>
                <option value="SZ">Eswatini</option>
                <option value="AU">Австралия</option>
                <option value="AT">Австрия</option>
                <option value="AZ">Азербайджан</option>
                <option value="AX">Аландские острова</option>
                <option value="AL">Албания</option>
                <option value="DZ">Алжир</option>
                <option value="AS">Американское Самоа</option>
                <option value="AI">Ангилья</option>
                <option value="AO">Ангола</option>
                <option value="AD">Андорра</option>
                <option value="AQ">Антарктика</option>
                <option value="AG">Антигуа и Барбуда</option>
                <option value="AR">Аргентина</option>
                <option value="AM">Армения</option>
                <option value="AW">Аруба</option>
                <option value="AF">Афганистан</option>
                <option value="BS">Багамы</option>
                <option value="BD">Бангладеш</option>
                <option value="BB">Барбадос</option>
                <option value="BH">Бахрейн</option>
                <option value="BY">Беларусь</option>
                <option value="BZ">Белиз</option>
                <option value="BE">Бельгия</option>
                <option value="BJ">Бенин</option>
                <option value="BM">Бермуды</option>
                <option value="BG">Болгария</option>
                <option value="BO">Боливия</option>
                <option value="BQ">Бонайре, Синт-Эстатиус и Саба</option>
                <option value="BA">Босния и Герцеговина</option>
                <option value="BW">Ботсвана</option>
                <option value="BR">Бразилия</option>
                <option value="IO">Британская Территория в Индийском Океане</option>
                <option value="VG">Британские Виргинские острова</option>
                <option value="BN">Бруней</option>
                <option value="BF">Буркина-Фасо</option>
                <option value="BI">Бурунди</option>
                <option value="BT">Бутан</option>
                <option value="VU">Вануату</option>
                <option value="VA">Ватикан</option>
                <option value="GB">Великобритания</option>
                <option value="HU">Венгрия</option>
                <option value="VE">Венесуэла</option>
                <option value="VI">Виргинские острова (США)</option>
                <option value="UM">Внешние малые острова США</option>
                <option value="TL">Восточный Тимор</option>
                <option value="VN">Вьетнам</option>
                <option value="GA">Габон</option>
                <option value="HT">Гаити</option>
                <option value="GY">Гайана</option>
                <option value="GM">Гамбия</option>
                <option value="GH">Гана</option>
                <option value="GP">Гваделупа</option>
                <option value="GT">Гватемала</option>
                <option value="GN">Гвинея</option>
                <option value="GW">Гвинея-Бисау</option>
                <option value="DE">Германия</option>
                <option value="GG">Гернси</option>
                <option value="GI">Гибралтар</option>
                <option value="HN">Гондурас</option>
                <option value="HK">Гонконг</option>
                <option value="GD">Гренада</option>
                <option value="GL">Гренландия</option>
                <option value="GR">Греция</option>
                <option value="GE">Грузия</option>
                <option value="GU">Гуам</option>
                <option value="DK">Дания</option>
                <option value="JE">Джерси</option>
                <option value="DJ">Джибути</option>
                <option value="DM">Доминика</option>
                <option value="DO">Доминиканская Республика</option>
                <option value="EG">Египет</option>
                <option value="ZM">Замбия</option>
                <option value="EH">Западная Сахара</option>
                <option value="ZW">Зимбабве</option>
                <option value="IL">Израиль</option>
                <option value="IN">Индия</option>
                <option value="ID">Индонезия</option>
                <option value="JO">Иордания</option>
                <option value="IQ">Ирак</option>
                <option value="IR">Иран</option>
                <option value="IE">Ирландия</option>
                <option value="IS">Исландия</option>
                <option value="ES">Испания</option>
                <option value="IT">Италия</option>
                <option value="YE">Йемен</option>
                <option value="CV">Кабо-Верде</option>
                <option value="KZ">Казахстан</option>
                <option value="KY">Кайманские острова</option>
                <option value="KH">Камбоджа</option>
                <option value="CM">Камерун</option>
                <option value="CA">Канада</option>
                <option value="QA">Катар</option>
                <option value="KE">Кения</option>
                <option value="CY">Кипр</option>
                <option value="KI">Кирибати</option>
                <option value="CN">Китай</option>
                <option value="CC">Кокосовые (Килинг) острова</option>
                <option value="CO">Колумбия</option>
                <option value="KM">Коморы</option>
                <option value="CG">Конго (Браззавиль)</option>
                <option value="CD">Конго (Киншаса)</option>
                <option value="CR">Коста-Рика</option>
                <option value="CI">Кот-д'Ивуар</option>
                <option value="CU">Куба</option>
                <option value="KW">Кувейт</option>
                <option value="KG">Кыргызстан</option>
                <option value="CW">Кюрасао</option>
                <option value="LA">Лаос</option>
                <option value="LV">Латвия</option>
                <option value="LS">Лесото</option>
                <option value="LR">Либерия</option>
                <option value="LB">Ливан</option>
                <option value="LY">Ливия</option>
                <option value="LT">Литва</option>
                <option value="LI">Лихтенштейн</option>
                <option value="LU">Люксембург</option>
                <option value="MU">Маврикий</option>
                <option value="MR">Мавритания</option>
                <option value="MG">Мадагаскар</option>
                <option value="YT">Майотта</option>
                <option value="MO">Макао</option>
                <option value="MW">Малави</option>
                <option value="MY">Малайзия</option>
                <option value="ML">Мали</option>
                <option value="MV">Мальдивы</option>
                <option value="MT">Мальта</option>
                <option value="MA">Марокко</option>
                <option value="MQ">Мартиника</option>
                <option value="MH">Маршалловы острова</option>
                <option value="MX">Мексика</option>
                <option value="FM">Микронезия</option>
                <option value="MZ">Мозамбик</option>
                <option value="MD">Молдова</option>
                <option value="MC">Монако</option>
                <option value="MN">Монголия</option>
                <option value="MS">Монсеррат</option>
                <option value="MM">Мьянма</option>
                <option value="NA">Намибия</option>
                <option value="NR">Науру</option>
                <option value="NP">Непал</option>
                <option value="NE">Нигер</option>
                <option value="NG">Нигерия</option>
                <option value="NL">Нидерланды</option>
                <option value="NI">Никарагуа</option>
                <option value="NU">Ниуэ</option>
                <option value="NZ">Новая Зеландия</option>
                <option value="NC">Новая Каледония</option>
                <option value="NO">Норвегия</option>
                <option value="AE">Объединённые Арабские Эмираты</option>
                <option value="OM">Оман</option>
                <option value="BV">Остров Буве</option>
                <option value="IM">Остров Мэн</option>
                <option value="NF">Остров Норфолк</option>
                <option value="CX">Остров Рождества</option>
                <option value="SH">Остров Святой Елены</option>
                <option value="HM">Остров Херд и острова Макдональд</option>
                <option value="CK">Острова Кука</option>
                <option value="PK">Пакистан</option>
                <option value="PW">Палау</option>
                <option value="PS">Палестинские территории</option>
                <option value="PA">Панама</option>
                <option value="PG">Папуа-Новая Гвинея</option>
                <option value="PY">Парагвай</option>
                <option value="PE">Перу</option>
                <option value="PN">Питкэрн</option>
                <option value="PL">Польша</option>
                <option value="PT">Португалия</option>
                <option value="PR">Пуэрто-Рико</option>
                <option value="RE">Реюньон</option>
                <option value="RU">Россия</option>
                <option value="RW">Руанда</option>
                <option value="RO">Румыния</option>
                <option value="US">США</option>
                <option value="SV">Сальвадор</option>
                <option value="WS">Самоа</option>
                <option value="SM">Сан-Марино</option>
                <option value="ST">Сан-Томе и Принсипи</option>
                <option value="SA">Саудовская Аравия</option>
                <option value="KP">Северная Корея</option>
                <option value="MK">Северная Македония</option>
                <option value="MP">Северные Марианские острова</option>
                <option value="SC">Сейшельские Острова</option>
                <option value="BL">Сен-Бартелеми</option>
                <option value="SX">Сен-Мартен (Нидерл.)</option>
                <option value="MF">Сен-Мартен (Фр.)</option>
                <option value="PM">Сен-Пьер и Микелон</option>
                <option value="SN">Сенегал</option>
                <option value="VC">Сент-Винсент и Гренадины</option>
                <option value="KN">Сент-Китс и Невис</option>
                <option value="LC">Сент-Люсия</option>
                <option value="RS">Сербия</option>
                <option value="SG">Сингапур</option>
                <option value="SY">Сирия</option>
                <option value="SK">Словакия</option>
                <option value="SI">Словения</option>
                <option value="SB">Соломоновы Острова</option>
                <option value="SO">Сомали</option>
                <option value="SD">Судан</option>
                <option value="SR">Суринам</option>
                <option value="SL">Сьерра-Леоне</option>
                <option value="TJ">Таджикистан</option>
                <option value="TW">Тайвань</option>
                <option value="TH">Тайланд</option>
                <option value="TZ">Танзания</option>
                <option value="TC">Теркс и Кайкос</option>
                <option value="TG">Того</option>
                <option value="TK">Токелау</option>
                <option value="TO">Тонга</option>
                <option value="TT">Тринидад и Тобаго</option>
                <option value="TV">Тувалу</option>
                <option value="TN">Тунис</option>
                <option value="TM">Туркменистан</option>
                <option value="TR">Турция</option>
                <option value="UG">Уганда</option>
                <option value="UZ">Узбекистан</option>
                <option value="UA">Украина</option>
                <option value="WF">Уоллис и Футуна</option>
                <option value="UY">Уругвай</option>
                <option value="FO">Фарерские острова</option>
                <option value="FJ">Фиджи</option>
                <option value="PH">Филиппины</option>
                <option value="FI">Финляндия</option>
                <option value="FK">Фолклендские острова</option>
                <option value="FR">Франция</option>
                <option value="GF">Французская Гвиана</option>
                <option value="PF">Французская Полинезия</option>
                <option value="TF">Французские южные территории</option>
                <option value="HR">Хорватия</option>
                <option value="CF">Центральная Африканская Республика</option>
                <option value="TD">Чад</option>
                <option value="ME">Черногория</option>
                <option value="CZ">Чешская Республика</option>
                <option value="CL">Чили</option>
                <option value="CH">Швейцария</option>
                <option value="SE">Швеция</option>
                <option value="SJ">Шпицберген и Ян-Майен</option>
                <option value="LK">Шри-Ланка</option>
                <option value="EC">Эквадор</option>
                <option value="GQ">Экваториальная Гвинея</option>
                <option value="ER">Эритрея</option>
                <option value="EE">Эстония</option>
                <option value="ET">Эфиопия</option>
                <option value="ZA">Южная Африка</option>
                <option value="GS">Южная Георгия/Сандвичевы острова</option>
                <option value="KR">Южная Корея</option>
                <option value="SS">Южный Судан</option>
                <option value="JM">Ямайка</option>
                <option value="JP">Япония</option>
              </select>
            <? endif ?>
            <script type="text/javascript">
              $(document).ready(function() {
                $('#order_billing_country').selectize({
                  sortField: 'text'
                });
              });
            </script>
          </div> -->
          <!-- Address -->
          <div class="mb-3">
            <label for="order_address" class="form-label required"><?= current($user)['lang'] == 'RU' ? 'Адрес пункта выдачи СДЭК' : 'Full address' ?></label>
            <input type="text" required class="form-control" name="address" id="order_address" placeholder="<?= current($user)['lang'] == 'RU' ? 'Город, улица, дом пункта СДЭК' : 'Country, Region, City, Street...' ?>" value="<?= current($user)['address'] ?>">
            <!-- <input type="text" class="form-control" name="apartment" id="order_apartment" placeholder="<?= current($user)['lang'] == 'RU' ? 'Крыло, подъезд, этаж и т.д. (необязательно)' : 'Apartment, suite, unit, etc. (optional)' ?>" value="<?= current($user)['apartment'] ?>"> -->
          </div>

          <!-- City -->
          <!-- <div class="mb-3">
            <label for="order_city" class="form-label required"><?= current($user)['lang'] == 'RU' ? 'Адрес' : 'Street Address' ?></label>
            <input type="text" class="form-control" name="city" id="order_city" placeholder="<?= current($user)['lang'] == 'RU' ? 'Город / Населенный пункт' : 'Town / City' ?>" required value="<?= current($user)['city'] ?>">

          </div> -->
          <!-- Region/State -->
          <!-- <div class="mb-3">
            <label for="order_region" class="form-label required"><?= current($user)['lang'] == 'RU' ? 'Регион / Область' : 'Region / State / District' ?></label>
            <input type="text" class="form-control" name="region" id="order_region" required placeholder="<?= current($user)['lang'] == 'RU' ? 'Регион / Область' : 'Region / State / District' ?>" value="<?= current($user)['region'] ?>">
          </div> -->

          <!-- Postcode / ZIP (optional) -->
          <!-- <div class="mb-3">
            <label for="order_zip_code" class="form-label"><?= current($user)['lang'] == 'RU' ? 'Почтовый индекс (необязательно)' : 'Postcode / ZIP (optional)' ?></label>
            <input type="text" class="form-control" name="zip_code" id="order_zip_code" placeholder="<?= current($user)['lang'] == 'RU' ? 'Почтовый индекс (необязательно)' : 'Postcode / ZIP (optional)' ?>" value="<?= current($user)['zip_code'] ?>">
          </div> -->
          <!-- Additions -->
          <div class="mb-3">
            <label for="order_additions" class="form-label"><?= current($user)['lang'] == 'RU' ? 'Примечание к заказу (необязательно)' : 'Order notes (optional)' ?></label>

            <textarea name="additions" class="form-control" id="order_additions" cols="30" rows="10" placeholder="<?= current($user)['lang'] == 'RU' ? 'Примечания к вашему заказу, например, особые пожелания отделу доставки.' : 'Notes about your order, e.g. special notes for delivery.' ?>"></textarea>
          </div>
        </div>
        <div class="modal-footer">
          <div class=" form-check">
            <input type="checkbox" class="form-check-input" id="exampleCheck1" required="1" checked="1">
            <label class="form-check-label" for="exampleCheck1">
              <? if (current($user)['lang'] == 'RU') : ?>
                Я солгасен с <a href="/about/policy">политикой конфиденциальности и правилами пользования </a>сайтом
              <? else : ?>
                I agree with the <a href="/about/policy">privacy policy and terms of use</a> of the site
              <? endif ?>
            </label>
          </div>
          <br>
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><?= current($user)['lang'] == 'RU' ? 'Отмена' : 'Cancle' ?></button>
          <button type="success" class="btn btn-primary"><?= current($user)['lang'] == 'RU' ? 'Оформить заказ' : 'Place order' ?></button>
        </div>
      </div>
    </div>
  </form>
</div>