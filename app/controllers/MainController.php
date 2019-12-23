<?php

namespace app\controllers;

use ishop\Cache;
use \RedBeanPHP\R as R; // тут

class MainController extends AppController
{
    public function indexAction() {
        $posts = R::findAll('test');
        $post = R::findOne('test', 'WHERE id = ?', [2]);
        $this->setMeta( 'Главная страница', 'описание...', 'Ключевые фразы...');
        $name = 'John';
        $age = 30;
        $names = ['Alex', 'Johny', 'Anton', 'Ololo'];
        $cache = Cache::instanse();
//        $cache->set('test', $names);
//        $cache->delete('test');
        $data = $cache->get('test');
        if(!$data){
            $cache->set('test', $names);
        }
        debug($data);
        $this->set(compact('name', 'age', 'names', 'posts'));
    }
}