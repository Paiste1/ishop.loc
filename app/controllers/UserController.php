<?php

namespace app\controllers;

use app\models\User;
use RedBeanPHP\R;

class UserController extends AppController
{
    public function signupAction(){
        if(!empty($_POST)){
            $user = new User();
            $data = $_POST;
            $user->load($data);
            if(!$user->validate($data) || !$user->checkUnique()){
                $user->getErrors();
                $_SESSION['form_data'] = $data;
            } else {
                $user->attributes['password'] = password_hash($user->attributes['password'], PASSWORD_DEFAULT);
                if($user->save('user')){
                    $_SESSION['success'] = 'Пользователь зарегистрирован!';
                } else {
                    $_SESSION['error'] = 'Ошибка!';
                }
            }
            redirect();
        }
        $this->setMeta('Регистрация');
    }

    public function loginAction(){
        if(!empty($_POST)){
            $user = new User();
            if($user->login()){
                $_SESSION['success'] = 'Вы успешно авторизованы!';
                redirect('/user/cabinet');
            } else {
                $_SESSION['error'] = 'Логин или пароль введен не верно!';
            }
            redirect();
        }
        /*if(@$_SESSION['user']){
            header("refresh: 1.5; url=/");
        }*/
        $this->setMeta('Вход');
    }

    public function logoutAction(){
        if(isset($_SESSION['user'])) unset($_SESSION['user']);
        redirect();
    }

    public function cabinetAction(){
        if(!User::checkAuth()){
            redirect();
        }
        $this->setMeta('Личный кабинет');
    }

    public function editAction(){
        if(!User::checkAuth()){
            redirect('/user/login');
        }
        if(!empty($_POST)){
            $user = new \app\models\admin\User();
            $data = $_POST;
            $data['id'] = $_SESSION['user']['id'];
            $data['role'] = $_SESSION['user']['role'];
            $user->load($data);
            if(!$user->attributes['password']){
                unset($user->attributes['password']);
            } else {
                $user->attributes['password'] = password_hash($user->attributes['password'], PASSWORD_DEFAULT);
            }
            if(!$user->validate($data) || !$user->checkUnique()){
                $user->getErrors();
                redirect();
            }
            if($user->update('user', $data['id'])){
                foreach($user->attributes as $k => $v){
                    if($k != 'password') $_SESSION['user'][$k] = $v;
                }
                $_SESSION['success'] = 'Изменения сохранены!';
            }
            redirect();
        }
        $this->setMeta('Редактирование данных пользователя');
    }

    public function ordersAction(){
        if(!User::checkAuth()){
            redirect('/user/login');
        }
        $orders = R::findAll('order', "user_id = ?", [$_SESSION['user']['id']]);
        $this->setMeta('История заказов');
        $this->set(compact('orders'));
    }
}