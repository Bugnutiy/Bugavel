<div class="container-lg">
  <!-- 'https://'.$_SERVER['SERVER_NAME'].'/'; -->

  <? if (current($user)['country'] == 'RU') : ?>
    <div class="container-lg my-3">
      <div class="row justify-content-center">
        <div class="col-12 col-md-6">
          <? if (current($user)['lang'] == 'RU') : ?>
            <h3>Доставка по России</h3>
            <p>Срок обработки заказа — два-три дня с момента поступления денежных средств на расчетный счет компании. <br>
              Доставка осуществляется курьерской службой Сдэк. <br>
              Срок доставки до 7 рабочих дней. <br>
              Оплата за доставку производится курьеру, при получении товара. <br></p>
          <? else : ?>
            <h3>Delivery in Russia</h3>
            <p>The order processing period is two to three days from the date of receipt of funds to the company's current account. <br>
              Delivery is carried out by the courier service Sdek. <br>
              Delivery time is up to 7 working days. <br>
              Payment for delivery is made to the courier upon receipt of the goods. <br></p>
          <? endif ?>
        </div>
      </div>
    </div>
  <? else : ?>
    <div class="container-lg my-3">
      <div class="row justify-content-center">
        <div class="col-12 col-md-6">
          <? if (current($user)['lang'] == 'RU') : ?>
            <h3>Доставка</h3>
            <p>Стоимость и способ доставки зависят от страны и адреса. Пожалуйста, оформите заказ и дождитесь ответа оператора</p>
          <? else : ?>
            <h3>Delivery</h3>
            <p>The cost and method of delivery depends on the country and address. Please place an order and wait for the operator's response</p>
          <? endif ?>
        </div>
      </div>
    </div>
  <? endif ?>
</div>