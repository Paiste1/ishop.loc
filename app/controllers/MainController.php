<?php

namespace app\controllers;

use ishop\Cache;
use \RedBeanPHP\R as R; // тут

class MainController extends AppController
{
    public function indexAction() {
        $this->setMeta( 'Главная страница', 'описание...', 'Ключевые фразы...');
    }
}