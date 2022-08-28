<div class="container-lg">
  <!-- 'https://'.$_SERVER['SERVER_NAME'].'/'; -->

  <? if (current($user)['country'] == 'RU') : ?>
    <div class="container-lg my-3">
      <div class="row justify-content-center">
        <div class="col-12 col-md-6">
          <? if (current($user)['lang'] == 'RU') : ?>
            <p>Для оплаты (ввода реквизитов Вашей карты) Вы будете перенаправлены на платежный шлюз ПАО СБЕРБАНК. Соединение с платежным шлюзом и передача информации осуществляется в защищенном режиме с использованием протокола шифрования SSL. В случае если Ваш банк поддерживает технологию безопасного проведения интернет-платежей Verified By Visa или MasterCard SecureCode для проведения платежа также может потребоваться ввод специального пароля. Настоящий сайт поддерживает 256-битное шифрование. Конфиденциальность сообщаемой персональной информации обеспечивается ПАО СБЕРБАНК. Введенная информация не будет предоставлена третьим лицам за исключением случаев, предусмотренных законодательством РФ. Проведение платежей по банковским картам осуществляется в строгом соответствии с требованиями платежных систем МИР, Visa Int. и MasterCard Europe Sprl.
              Возврат переведенных средств, производится на Ваш банковский счет в течение 5—30 рабочих дней (срок зависит от Банка, который выдал Вашу банковскую карту).</p>
          <? else : ?>
            For payment (entering your card details) You will be redirected to the payment gateway of SBERBANK PJSC. The connection to the payment gateway and the transfer of information is carried out in a secure mode using the SSL encryption protocol. If your bank supports the technology of secure Internet payments Verified By Visa or MasterCard SecureCode, you may also need to enter a special password to make a payment. This site supports 256-bit encryption. The confidentiality of the personal information provided is ensured by SBERBANK PJSC. The entered information will not be provided to third parties, except in cases provided for by the legislation of the Russian Federation. Bank card payments are carried out in strict accordance with the requirements of the payment systems MIR, Visa Int. and MasterCard Europe Sprl.
            The refund of the transferred funds is made to your bank account within 5-30 working days (the period depends on the Bank that issued your bank card).
          <? endif ?>
        </div>
      </div>
    </div>
  <? else : ?>
    <div class="container-lg my-3">
      <div class="row justify-content-center">
        <div class="col-12 col-md-6">
          <? if (current($user)['lang'] == 'RU') : ?>
            <p>Для оплаты (ввода реквизитов Вашей карты) Вы будете перенаправлены на платежный шлюз ПАО СБЕРБАНК. Соединение с платежным шлюзом и передача информации осуществляется в защищенном режиме с использованием протокола шифрования SSL. В случае если Ваш банк поддерживает технологию безопасного проведения интернет-платежей Verified By Visa или MasterCard SecureCode для проведения платежа также может потребоваться ввод специального пароля. Настоящий сайт поддерживает 256-битное шифрование. Конфиденциальность сообщаемой персональной информации обеспечивается ПАО СБЕРБАНК. Введенная информация не будет предоставлена третьим лицам за исключением случаев, предусмотренных законодательством РФ. Проведение платежей по банковским картам осуществляется в строгом соответствии с требованиями платежных систем МИР, Visa Int. и MasterCard Europe Sprl.
              Возврат переведенных средств, производится на Ваш банковский счет в течение 5—30 рабочих дней (срок зависит от Банка, который выдал Вашу банковскую карту).</p>
          <? else : ?>
            For payment (entering your card details) You will be redirected to the payment gateway of SBERBANK PJSC. The connection to the payment gateway and the transfer of information is carried out in a secure mode using the SSL encryption protocol. If your bank supports the technology of secure Internet payments Verified By Visa or MasterCard SecureCode, you may also need to enter a special password to make a payment. This site supports 256-bit encryption. The confidentiality of the personal information provided is ensured by SBERBANK PJSC. The entered information will not be provided to third parties, except in cases provided for by the legislation of the Russian Federation. Bank card payments are carried out in strict accordance with the requirements of the payment systems MIR, Visa Int. and MasterCard Europe Sprl.
            The refund of the transferred funds is made to your bank account within 5-30 working days (the period depends on the Bank that issued your bank card).
          <? endif ?>

        </div>
      </div>
    </div>
  <? endif ?>
</div>