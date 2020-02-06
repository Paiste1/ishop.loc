<?php


namespace ishop;

use \RedBeanPHP\R as R; // тут

class Db
{
    use TSingleton;

    protected function __construct()
    {
        $db = require_once CONFIG . '/config_db.php';
        R::setup($db['dsn'], $db['user'], $db['pass']);
        if( !R::testConnection() )
        {
            throw new \Exception('Нет соединения с БД!', 500);
        }
        R::freeze( TRUE );
        if(DEBUG)
        {
            R::debug(true, 1);
        }

        R::ext('xdispense', function ($type){
            return R::getRedBean()->dispense($type);
        });
    }

}