<?php

namespace app\controllers;

use ishop\Cache;
use \RedBeanPHP\R as R; // тут

class MainController extends AppController
{
    public function indexAction() {
        $brands = R::find('brand',  'LIMIT 3'); // запрос из БД на вывод брендов 3 шт.
        $hits = R::find('product', "status = '1' AND hit = '1' LIMIT 8"); // запрос из БД на вывод хитов 8шт.
        $this->setMeta( 'Главная страница', 'описание...', 'Ключевые фразы...');
        $this->set(compact('brands', 'hits')); // вывод на главной
    }
}