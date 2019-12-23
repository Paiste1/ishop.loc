<?php


namespace ishop;


class App
{

    public static $app;

    public function __construct()
    {
        $query = trim($_SERVER['QUERY_STRING'], '/');
        session_start();
        self::$app = Registry::instanse();
        $this->getParams();
        new ErrorHandler();
        Router::dispatch($query);
    }

    protected function getParams()
    {
        $params = require_once CONFIG . '/params.php';
        if(!empty($params)) {
            foreach ($params as $k => $v) {
                self::$app->setProperty($k, $v);
            }
        }
    }
}