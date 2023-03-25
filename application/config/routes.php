<?php
return [
	'test' => [
		'controller' => 'admin',
		'action' => 'test'
	],
	/************************************MAIN**********************************************/
	'' => [
		'controller' => 'main',
		'action' => 'index'
	],
	'catalog' => [
		'controller' => 'main',
		'action' => 'catalog'
	],
	'catalog/product' => [
		'controller' => 'main',
		'action' => 'product'
	],
	'cart' => [
		'controller' => 'main',
		'action' => 'cart'
	],
	/***********************************About********************************************/
	'about/policy' => [
		'controller' => 'main',
		'action' => 'policy'
	],
	'about/payment' => [
		'controller' => 'main',
		'action' => 'payment'
	],
	'about/contacts' => [
		'controller' => 'main',
		'action' => 'contacts'
	],
	'about/delivery' => [
		'controller' => 'main',
		'action' => 'delivery'
	],
	/***********************************Admin shop******************************************/
	////////////////////////categories//////////////////////////
	'admin/categories' => [
		'controller' => 'admin',
		'action' => 'categories',
	],
	'admin/categories/delete' => [
		'controller' => 'admin',
		'action' => 'categoriesDelete',
	],
	'admin/categories/new' => [
		'controller' => 'admin',
		'action' => 'categoriesEdit',
	],
	'admin/categories/edit' => [
		'controller' => 'admin',
		'action' => 'categoriesEdit',
	],
	'admin/categories/copy' => [
		'controller' => 'admin',
		'action' => 'categoriesEdit',
	],
	/////////////////////////products/////////////////////////
	'admin/products' => [
		'controller' => 'admin',
		'action' => 'products',
	],
	'admin/products/delete' => [
		'controller' => 'admin',
		'action' => 'productsDelete',
	],
	'admin/products/new' => [
		'controller' => 'admin',
		'action' => 'productsEdit',
	],
	'admin/products/edit' => [
		'controller' => 'admin',
		'action' => 'productsEdit',
	],
	'admin/products/copy' => [
		'controller' => 'admin',
		'action' => 'productsEdit',
	],
	////////////////////////////Properties//////////////////////
	'admin/products/properties' => [
		'controller' => 'admin',
		'action' => 'properties',
	],
	'admin/products/properties/edit' => [
		'controller' => 'admin',
		'action' => 'propertiesEdit',
	],
	'admin/products/properties/delete' => [
		'controller' => 'admin',
		'action' => 'propertiesDelete',
	],
///////////////////////////////ORDERS////////////////////////////
	'admin/orders' => [
		'controller' => 'admin',
		'action' => 'orders',
	],
	'admin/orders/edit' => [
		'controller' => 'admin',
		'action' => 'ordersEdit',
	],
	'admin/coredb' => [
		'controller' => 'admin',
		'action' => 'coredb',
	],
	/////////////////////////////SBER////////////////////////////
	// 'admin/sber' => [
	// 	'controller' => 'admin',
	// 	'action' => 'sber',
	// ],
	/////////////////////////////=////////////////////////////

	// 'admin/modul' => [
	// 	'controller' => 'admin',
	// 	'action' => 'categories',
	// ],

];
