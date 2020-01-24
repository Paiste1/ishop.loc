<?php


namespace app\controllers\admin;


use ishop\Cache;

class CacheController extends AppController
{
    public function indexAction(){
        $this->setMeta('Очистить кэш');
    }

    public function deleteAction(){
        $key = isset($_GET['key']) ? $_GET['key'] : null;
        $cache = Cache::instanse();
        switch ($key) {
            case 'category':
                $cache->delete('cats');
                $cache->delete('ishop_menu');
                break;
            case 'filter':
                $cache->delete('filter_group');
                $cache->delete('filter_attrs');
                break;
        }
        $_SESSION['success'] = 'Выбранный КЭШ удален!';
        redirect();
    }
}