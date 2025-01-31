<?php

namespace app\controllers\admin;

use ishop\libs\Pagination;
use RedBeanPHP\R;

class OrderController extends AppController
{
    public function indexAction(){
        $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
        $perpage = 20; // количество отображаемых заказов на странице
        $count = R::count('order');
        $pagination = new Pagination($page,$perpage,$count);
        $start = $pagination->getStart();
        $orders = R::getAll("SELECT `order`.`id`, `order`.`user_id`, `order`.`status`, `order`.`date`, `order`.`update_at`, `order`.`currency`, `order`.`sum`, `user`.`name` 
        FROM `order` JOIN `user` ON `order`.`user_id` = `user`.`id` JOIN `order_product` ON `order`.`id` = `order_product`.`order_id` GROUP BY `order`.`id` ORDER BY `order`.`status`, `order`.`id` 
        LIMIT $start, $perpage");
//        debug($orders,1);
        $this->setMeta('Список заказов');
        $this->set(compact('orders', 'pagination', 'count'));
    }

    public function viewAction(){
        $order_id = $this->getRequestID();
        $order = R::getRow("SELECT `order`.*, `user`.`name`, `user`.`address`, `user`.`email`,`user`.`phone` FROM `order` JOIN `user` ON `order`.`user_id` = `user`.`id` 
        JOIN `order_product` ON `order`.`id` = `order_product`.`order_id` WHERE `order`.`id` = ?
        GROUP BY `order`.`id` ORDER BY `order`.`status`, `order`.`id` LIMIT 1", [$order_id]);
//        debug($order,1);
        if(!$order){
            throw new \Exception('Страница не найдена!', 404);
        }
        $order_products = R::findAll('order_product', "order_id = ?", [$order_id]);
        $link = R::findOne('product', 'id = ?', [$order_id]);
        $this->setMeta("Заказ № {$order_id}");
        $this->set(compact('order', 'order_products', 'link'));
    }

    public function changeAction(){
        $order_id = $this->getRequestID();
        $status = !empty($_GET['status']) ? '1' : '0';
        $order = R::load('order', $order_id);
        if(!$order){
            throw new \Exception('Страница не найдена', 404);
        }
        $order->status = $status;
        $order->update_at = date("Y-m-d H:i:s");
        R::store($order);
        if($order) {
            $_SESSION['success'] = 'Изменения сохранены';
        } else {
            $_SESSION['error'] = 'Ошибка';
        }
        redirect();
    }

    public function deleteAction(){
        $order_id = $this->getRequestID();
        $order = R::load('order', $order_id);
        R::trash($order);
        $_SESSION['success'] = 'Заказ удален!';
        redirect(ADMIN . '/order');
    }
}