<?php

namespace app\controllers\admin;

use app\models\User;
use ishop\libs\Pagination;
use RedBeanPHP\R;

class UserController extends AppController
{
    public function loginAdminAction(){
        if(!empty($_POST)){
            $user = new User();
            if(!$user->login(true)){
                $_SESSION['error'] = 'Логин/пароль введены не верно';
            }
            if(User::isAdmin()){
                redirect(ADMIN);
            } else {
                redirect();
            }
        }
        $this->template = 'login';
    }

    public function editAction(){
        $user_id = $this->getRequestID();
        $user = R::load('user', $user_id);
        $this->setMeta('Редактирование профиля пользователя {$user->name}');
        $this->set(compact('user'));
    }

    public function indexAction(){
        $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
        $perpage = 3;
        $count = R::count('user');
        $pagination = new Pagination($page, $perpage, $count);
        $start = $pagination->getStart();
        $users = R::findAll('user', "LIMIT $start, $perpage");
        $this->setMeta('Список пользователей');
        $this->set(compact('users', 'pagination', 'count'));
    }
}