<?php

namespace app\controllers;

use ishop\Cache;
use \RedBeanPHP\R as R; // тут

class MainController extends AppController
{
    public function indexAction() {
        $brands = R::find('brand',  'LIMIT 3'); // запрос на вывод брендов на главной 3 шт.
        $this->setMeta( 'Главная страница', 'описание...', 'Ключевые фразы...');
        $this->set(compact('brands'));
    }
}