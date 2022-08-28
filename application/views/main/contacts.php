<div class="container-lg">
  <!-- 'https://'.$_SERVER['SERVER_NAME'].'/'; -->

  <? if (current($user)['lang'] == 'RU') : ?>
    <div class="container-lg my-3">
      <div class="row justify-content-center">
        <div class="col-12 col-md-6">
          <h3>Контакты</h3>
          <p>По всем вопросам обращайтесь по E-mail <a href="mailto:info@leosmagin.com">info@leosmagin.com</a></p>

        </div>
      </div>
    </div>
  <? else : ?>
    <div class="container-lg my-3">
      <div class="row justify-content-center">
        <div class="col-12 col-md-6">

          <h3>Contacts</h3>
          <p>If you have any questions, please contact us by E-mail <a href="mailto:info@leosmagin.com ">info@leosmagin.com</a></p>
        </div>
      </div>
    </div>
  <? endif ?>
</div>