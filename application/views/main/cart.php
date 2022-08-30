<div class="container-lg cart_header">
  <h1 class="mt-3"><?= current($user)['lang'] == 'RU' ? 'Корзина' : 'Your cart' ?></h1>
  <? if (empty($cart)) : ?>
    <p>
      <?= current($user)['lang'] == 'RU' ? 'Ваша корзина пуста' : 'Your cart is empty' ?>
    </p>
  <? endif ?>
</div>

<?
$subtotal_cost = 0;
foreach ($cart as $cart_id => $cart_node) : ?>
  <div class="container-lg g-4 cart_page description_block mt-2">
    <div class="row">
      <div class="col">
        <div class="row justify-content-center">
          <div class="col-12 cart">
            <div class="row">
              <div class="col-12 item">
                <div class="row">
                  <div class="col-4 cart_image g-0">
                    <img src="<?= '/' . current(json_decode($products[$cart_node['product_id']]['images'], 1)) ?>" alt="Picture">
                  </div>
                  <div class="col body align-self-center">
                    <div class="row justify-content-around">
                      <div class="col-auto align-self-center">
                        <h2 class="name m-0"><a href="/catalog/product?id=<?= $cart_node['product_id'] ?>">Hybrid black/gold</a></h2>
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
                      <div class="col-auto align-self-center text-center">
                        <div class="input-group quantity">
                          <div class="btn btn-outline-secondary" onclick="decrease('<?= $cart_id ?>')">-</div>
                          <input type="number" min="1" max="<?= $properties[$cart_node['property_id']]['quantity'] ?>" class="form-control p-0 text-center" value="<?= $cart_node['quantity'] ?>" id="<?= $cart_id ?>" name[<?= $cart_id ?>]="quantity" onchange="cost(this)">
                          <div class="btn btn-outline-secondary" onclick="increase('<?= $cart_id ?>')">+</div>
                        </div>
                        <span id="stock<?= $cart_id ?>" class="small text-<?= $properties[$cart_node['property_id']]['quantity'] > 0 ? 'success' : 'danger' ?>"><?= $properties[$cart_node['property_id']]['quantity'] ?><?= current($user)['lang'] == 'RU' ? ' шт. в наличии' : ' pcs in stock' ?></span>

                      </div>
                      <div class="col-auto align-self-center">
                        <span class="amount" id="cost_q<?= $cart_id ?>">
                          <? if (current($user)['country'] == 'RU') : ?>
                            <? $subtotal_cost += $cart_node['quantity'] * $properties[$cart_node['property_id']]['price'] ?>
                            <?= number_format($cart_node['quantity'] * $properties[$cart_node['property_id']]['price'], 0, ',', ' ') . ' руб.' ?>
                          <? else : ?>
                            <? $subtotal_cost += $cart_node['quantity'] * $properties[$cart_node['property_id']]['price_en'] ?>
                            <? //= '$' . number_format($cart_node['quantity'] * $properties[$cart_node['property_id']]['price_en']) 
                            ?>
                            <?= number_format($cart_node['quantity'] * $properties[$cart_node['property_id']]['price_en']) . ' eur' ?>

                          <? endif ?>
                        </span>
                      </div>
                    </div>
                  </div>
                  <div class="col-auto pe-1 delete">
                    <a type="button" class="bi bi-x-circle text-secondary" data-bs-toggle="modal" data-bs-target="#deleteModal<?= $cart_id ?>"></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="modal fade" id="deleteModal<?= $cart_id ?>" tabindex="-1" aria-labelledby="deleteModalLabel<?= $cart_id ?>" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title text-center" id="deleteModalLabel<?= $cart_id ?>"><?= current($user)['lang'] == 'RU' ? 'Вы уверены?' : 'Are you sure?' ?></h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <?
          $property = $properties[$cart_node['property_id']];
          $product = $products[$cart_node['product_id']];
          echo current($user)['lang'] == 'RU' ? "Вы действительно хотите убрать товар \"$product[name_en] - $property[name_en]\" из корзины" : "Do you really want to remove the product \"$product[name_en] - $property[name_en]\" from the cart" ?>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><?= current($user)['lang'] == 'RU' ? 'Отмена' : 'Cancel' ?></button>
          <a href="/cart?del=<?= $cart_id ?>" class="btn btn-primary"><?= current($user)['lang'] == 'RU' ? 'Удалить' : 'Remove' ?></a>
        </div>
      </div>
    </div>
  </div>
<? endforeach ?>
<? if (!empty($cart)) : ?>
  <div class="container-lg mb-3 cart_button mt-3">
    <div class="row justify-content-end">
      <div class="col-auto align-self-center">
        <span id="subtotal">
          <? //= current($user)['lang'] == 'RU' ? 'Предварительный итог: ' . number_format($subtotal_cost, 0, ',', ' ') . ' руб.' : 'Subtotal: $' . number_format($subtotal_cost) 
          ?>
          <?= current($user)['lang'] == 'RU' ? 'Предварительный итог: ' . number_format($subtotal_cost, 0, ',', ' ') . ' руб.' : 'Subtotal: ' . number_format($subtotal_cost) . ' eur' ?>

        </span>
      </div>
      <div class="col-auto">
        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#indexOrderModal">Оформить заказ</button>
      </div>
    </div>



  </div>
<? endif ?>


<? ob_start() ?>
<script>
  var properties = <?= json_encode($properties) ?>;
  var cart = <?= json_encode($cart) ?>;

  function cost(qelem) {
    if (parseInt(qelem.value) > parseInt(qelem.max)) {
      qelem.value = qelem.max;
    }
    if (parseInt(qelem.value) < parseInt(qelem.min)) {
      qelem.value = qelem.min;
    }
    // dd(qelem);

    var data = {
      id: qelem.id,
      quantity: qelem.value,
    };

    function CreateRequest() {
      var Request = false;

      if (window.XMLHttpRequest) {
        //Gecko-совместимые браузеры, Safari, Konqueror
        Request = new XMLHttpRequest();
      } else if (window.ActiveXObject) {
        //Internet explorer
        try {
          Request = new ActiveXObject("Microsoft.XMLHTTP");
        } catch (CatchException) {
          Request = new ActiveXObject("Msxml2.XMLHTTP");
        }
      }

      if (!Request) {
        alert("Error! Please try to change browser");
      }

      return Request;
    }
    let xhttp = CreateRequest();
    xhttp.open("POST", "/cart", true);
    xhttp.setRequestHeader("Content-Type", "application/json");
    xhttp.send(JSON.stringify(data));
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        // Response
        var response = JSON.parse(this.responseText);

        price = response['cart'][qelem.id]['quantity'] * response['properties'][response['cart'][qelem.id]['property_id']]['<?= current($user)['country'] == 'RU' ? 'price' : 'price_en' ?>'];
        price_elem = document.getElementById('cost_q' + qelem.id);
        <? if (current($user)['country'] == 'RU') : ?>
          price_elem.innerText = number_format(price, 0, ',', ' ') + ' руб.';
        <? else : ?>
          // price_elem.innerText = '$' + number_format(price);
          price_elem.innerText = number_format(price) + ' eur';

        <? endif ?>

        total = response['cart_total']['<?= current($user)['country'] == 'RU' ? 'total_price' : 'total_price_en' ?>']
        total_elem = document.getElementById('subtotal');
        <? if (current($user)['country'] == 'RU') : ?>
          total_elem.innerText = '<?= current($user)['lang'] == 'RU' ? 'Предварительный итог: ' : 'Subtotal: ' ?>' + number_format(total, 0, ',', ' ') + ' руб.';
        <? else : ?>
          // total_elem.innerText = '<?//= current($user)['lang'] == 'RU' ? 'Предварительный итог: $' : 'Subtotal: $' ?>' + number_format(total);
          total_elem.innerText = '<?= current($user)['lang'] == 'RU' ? 'Предварительный итог: ' : 'Subtotal: ' ?>' + number_format(total) + ' eur';

        <? endif ?>
      }
    };
  }

  function increase(id) {
    qelem = document.getElementById(id);
    if (parseInt(qelem.value) < parseInt(qelem.max)) {
      qelem.value++;
      cost(qelem);
    }
  }

  function decrease(id) {
    qelem = document.getElementById(id);
    if (parseInt(qelem.value) > parseInt(qelem.min)) {
      qelem.value--;
      cost(qelem);
    }

  }
</script>
<? $script = ob_get_clean(); ?>