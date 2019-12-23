<?php

define("DEBUG", 1);
define("ROOT", dirname(__DIR__));
define("WWW", ROOT . "/public");
define("APP", ROOT . "/app");
define("CORE", ROOT . "/vendor/ishop/core");
define("LIBS", ROOT . "/vendor/ishop/core/libs");
define("CACHE", ROOT . "/tmp/cache");
define("CONFIG", ROOT . "/config");
define("TEMPLATE", "watches"); // название шаблона по умолчанию

//  http://ishop.loc/public/index.php
$app_path = "http://{$_SERVER['HTTP_HOST']}{$_SERVER['PHP_SELF']}"; //получаем полный адрес

//  http://ishop.loc/public/
$app_path = preg_replace("#[^/]+$#", '', $app_path); //ищем все кроме слеша, начиная с конца строки и все это замещаем пустой строкой в $app_path

//  http://ishop.loc
$app_path = str_replace("/public/", '', $app_path); // получили url главной страницы

define("PATH", $app_path);
define("ADMIN", PATH . "/admin");

require_once ROOT . "/vendor/autoload.php";