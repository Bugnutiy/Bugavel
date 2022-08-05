<?php
return [
	'test' => [
		'controller' => 'admin',
		'action' => 'test'
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
	/////////////////////////////SBER////////////////////////////
	'admin/sber' => [
		'controller' => 'admin',
		'action' => 'sber',
	],
	/////////////////////////////=////////////////////////////


	'admin/orders' => [
		'controller' => 'admin',
		'action' => 'categories',
	],


	'admin/modul' => [
		'controller' => 'admin',
		'action' => 'categories',
	],


];
