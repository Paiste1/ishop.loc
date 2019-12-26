<?php


namespace app\controllers;


use mysql_xdevapi\Exception;
use RedBeanPHP\R;

class ProductController extends AppController
{
    public function viewAction()
    {
        $alias = $this->route['alias'];
        $product = R::findOne('product', "alias = ? AND status = '1'", [$alias]);
        if(!$product) {
            throw new \Exception("Товар {$alias} не найден!", '404');
        }
        // хлебные крошки

        // связанные товары

        // запись в куки запрошенного товара

        // просмотренные товары

        // галерея

        //модификации товара

        $this->setMeta($product['title'], $product['description'], $product['keywords']);
        $this->set(compact('product'));
    }
}