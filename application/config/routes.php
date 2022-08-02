<?php
return [
	/***********************************Admin shop******************************************/
	'admin' => [
		'controller' => 'adminshop',
		'action' => 'mainpage',
	],
	//////////////////////////////////Properties//////////////////////////////////////////
	'admin/properties' => [
		'controller' => 'adminshop',
		'action' => 'properties',
	],
	'admin/properties/add' => [
		'controller' => 'adminshop',
		'action' => 'propertiesAdd',
	],
	'admin/properties/add/form' => [
		'controller' => 'adminshop',
		'action' => 'propertiesAddForm',
	],
	'admin/properties/change' => [
		'controller' => 'adminshop',
		'action' => 'propertiesChange',
	],
	'admin/properties/change/form' => [
		'controller' => 'adminshop',
		'action' => 'propertiesChangeForm',
	],
	'admin/properties/del' => [
		'controller' => 'adminshop',
		'action' => 'propertiesDelete',
	],
	//////////////////////////////////\Properties\//////////////////////////////////////////

	//////////////////////////////////Category//////////////////////////////////////////
	'admin/categories' => [
		'controller' => 'adminshop',
		'action' => 'categories',
	],
	'admin/categories/add' => [
		'controller' => 'adminshop',
		'action' => 'categoriesAdd',
	],
	'admin/categories/add/form' => [
		'controller' => 'adminshop',
		'action' => 'categoriesAddForm',
	],
	'admin/categories/change' => [
		'controller' => 'adminshop',
		'action' => 'categoriesChange',
	],
	'admin/categories/change/form' => [
		'controller' => 'adminshop',
		'action' => 'categoriesChangeForm',
	],
	'admin/categories/del' => [
		'controller' => 'adminshop',
		'action' => 'categoriesDelete',
	],
	//////////////////////////////////\Category\//////////////////////////////////////////

	///////////////////////////////////products//////////////////////////////////////////
	'admin/products' => [
		'controller' => 'adminshop',
		'action' => 'products',
	],
	'admin/products/add' => [
		'controller' => 'adminshop',
		'action' => 'productsAdd',
	],
	'admin/products/add/form' => [
		'controller' => 'adminshop',
		'action' => 'productsAddForm',
	],
	'admin/products/change' => [
		'controller' => 'adminshop',     //
		'action' => 'productsChange',
	],
	'admin/products/change/property' => [
		'controller' => 'adminshop',
		'action' => 'productsChangeProperty',
	],
	'admin/products/change/property/del' => [
		'controller' => 'adminshop',
		'action' => 'productsChangePropertyDelete',
	],
	'admin/products/change/property/form' => [
		'controller' => 'adminshop',
		'action' => 'productsChangePropertyForm',
	],
	'admin/products/change/form' => [
		'controller' => 'adminshop',
		'action' => 'productsChangeForm',
	],
	'admin/products/del' => [
		'controller' => 'adminshop',
		'action' => 'productsDelete',
	],
	///////////////////////////////////\products\//////////////////////////////////////////
	/////////////////////////////////////Orders//////////////////////////////////////////////
	'admin/orders' => [
		'controller' => 'adminshop',
		'action' => 'orders',
	],
	'admin/orders/order' => [
		'controller' => 'adminshop',
		'action' => 'orderview',
	],
	/////////////////////////////////////\Orders\////////////////////////////////////////////
	/////////////////////////////////////Clients//////////////////////////////////////////////
	'admin/clients' => [
		'controller' => 'adminshop',
		'action' => 'clients',
	],
	/////////////////////////////////////\Clients\////////////////////////////////////////////
	/////////////////////////////////////Учет продаж//////////////////////////////////////////////
	'admin/sales_acc' => [
		'controller' => 'adminshop',
		'action' => 'sales_acc',
	],
	/////////////////////////////////////\Учет продаж\////////////////////////////////////////////

	/*********************************Shop for users******************************/

	'' => [
		'controller' => 'shop',
		'action' => 'mainPage',
	],
	'catalog' => [
		'controller' => 'shop',
		'action' => 'catalog',
	],
	'product' => [
		'controller' => 'shop',
		'action' => 'product',
	],
	'cart/add' => [
		'controller' => 'shop',
		'action' => 'cartAdd',
	],
	'cart' => [
		'controller' => 'shop',
		'action' => 'cart',
	],
	'cart/change' => [
		'controller' => 'shop',
		'action' => 'cartChangeQuantity',
	],
	'order' => [
		'controller' => 'shop',
		'action' => 'newOrder',
	],
	/**********************************Auth****************************************/
	'register' => [
		'controller' => 'auth',
		'action' => 'register',
	],
	'login' => [
		'controller' => 'auth',
		'action' => 'login',
	],
	'logout' => [
		'controller' => 'auth',
		'action' => 'logout',
	],
];
