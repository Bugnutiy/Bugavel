<div class="container-lg cart_header">
  <h1 class="mt-3">Корзина</h1>
</div>
<? if (empty($cart)) : ?>
  <?= current($user)['lang'] == 'RU' ? 'Ваша корзина пуста' : 'Your cart is empty' ?>
<? endif ?>
<? foreach ($cart as $cart_id => $cart_node) : ?>
  <div class="container-lg g-4 cart_page description_block mt-2">
    <div class="row">
      <div class="col">
        <div class="row justify-content-center">
          <div class="col-12 cart">
            <div class="row">
              <div class="col-12 item">
                <div class="row">
                  <div class="col-3 cart_image g-0">
                    <img src="<?= '/' . current(json_decode($products[$cart_node['product_id']]['images'], 1)) ?>" alt="Picture">
                  </div>
                  <div class="col body align-self-center">
                    <div class="row justify-content-around">
                      <div class="col-auto align-self-center">
                        <h2 class="name m-0"><a href="">Hybrid black/gold</a></h2>
                        <? if (!empty($properties[$cart_node['property_id']]['classname']) and current($user)['lang'] == 'RU') : ?>
                          <span class="small">
                            <?= $properties[$cart_node['property_id']]['classname'] ?>: <?= $properties[$cart_node['property_id']]['name'] ?>
                          </span>
                        <? endif ?>
                        <? if (!empty($properties[$cart_node['property_id']]['classname_en']) and current($user)['lang'] == 'EN') : ?>
                          <span class="small">
                            <?= $properties[$cart_node['property_id']]['classname_en'] ?>: <?= $properties[$cart_node['property_id']]['name_en'] ?>
                          </span>
                        <? endif ?>
                      </div>
                      <div class="col-auto align-self-center">
                        <div class="input-group quantity">
                          <div class="btn btn-outline-secondary" onclick="decrease('q<?=$cart_id?>')">-</div>
                          <input type="number" class="form-control p-0 text-center" value="<?= $cart_node['quantity'] ?>" id="q<?=$cart_id?>" name[<?=$cart_id?>]="quantity" onchange="cost(this)">
                          <div class="btn btn-outline-secondary" onclick="increase('q<?=$cart_id?>')">+</div>
                        </div>
                      </div>
                      <div class="col-auto align-self-center">
                        <span class="amount" id="cq<?=$cart_id?>">$12000</span>
                      </div>
                    </div>
                  </div>
                  <div class="col-auto px-1">
                    <a href="#" class="bi bi-x-circle text-secondary"></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
<? endforeach ?>
<div class="container-lg mb-3 cart_button">
  <div class="row justify-content-end">
    <div class="col-auto align-self-center">
      Итого: <span id="valuta">$</span><span id="summ">36000</span>
    </div>
    <div class="col-auto">
      <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal">Оформить
        заказ</button>
    </div>
  </div>
  <!-- Button trigger modal -->

  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen-lg-down">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Оформление заказа</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form action="" action="#" method="POST">
          <div class="modal-body">
            <div class="mb-3">
              <label for="order_fullname" class="form-label required">Full name</label>
              <input type="text" class="form-control" id="order_fullname" required>
            </div>

            <div class="mb-3">
              <label for="order_phone" class="form-label required" title="Обязательнеое поле">Phone number</label>
              <input type="text" class="form-control" id="order_phone" required>
            </div>

            <div class="mb-3">
              <label for="order_email" class="form-label required">Email address</label>
              <input type="email" class="form-control" id="order_email" aria-describedby="emailHelp" required>
              <div id="emailHelp" class="form-text">We'll never share your data with anyone else.</div>
            </div>

            <div class="mb-3 form-check">
              <input type="checkbox" class="form-check-input" id="exampleCheck1">
              <label class=" form-check-label" for="exampleCheck1"><small>I agree with the current privacy policy
                  and terms of use</small></label>
            </div>
          </div>
          <div class="modal-footer">
            <button type="submit" class="btn btn-primary">Подтвердить</button>
          </div>
        </form>
      </div>
    </div>
  </div>

</div>