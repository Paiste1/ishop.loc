<?php

namespace app\models\admin;

use app\models\AppModel;
use RedBeanPHP\R;

class Product extends AppModel {

    public $attributes = [
        'title' => '',
        'category_id' => '',
        'keywords' => '',
        'description' => '',
        'price' => '',
        'old_price' => '',
        'content' => '',
        'status' => '',
        'hit' => '',
        'alias' => '',
    ];

    public $rules = [
        'required' => [
            ['title'],
            ['category_id'],
            ['price'],
        ],
        'integer' => [
            ['category_id'],
        ],
    ];

    public function editRelatedProduct($id, $data){
        $relatedProduct = R::getCol('SELECT related_id FROM related_product WHERE product_id = ?', [$id]);
        //если менеджер убрал связанные товары, тогда удаляем их
        if(empty($data['related']) && !empty($relatedProduct)){
            R::exec("DELETE FROM related_product WHERE product_id = ?", [$id]);
            return;
        }
        //если связанные товары добавляются
        if(empty($relatedProduct) && !empty($data['related'])){
            $sql_part = '';
            foreach($data['related'] as $v){
                $v = (int)$v;
                $sql_part .= "($id, $v),";
            }
            $sql_part = rtrim($sql_part, ',');
            R::exec("INSERT INTO related_product (product_id, related_id) VALUES $sql_part");
            return;
        }
        //если изменились связанные товары - удалим и запишем новые
        if(!empty($data['related'])){
            $result = array_diff($relatedProduct, $data['related']);
            if(!empty($result) || count($relatedProduct) != count($data['related'])){
                R::exec("DELETE FROM related_product WHERE product_id = ?", [$id]);
                $sql_part = '';
                foreach($data['related'] as $v){
                    $v = (int)$v;
                    $sql_part .= "($id, $v),";
                }
                $sql_part = rtrim($sql_part, ',');
                R::exec("INSERT INTO related_product (product_id, related_id) VALUES $sql_part");
            }
        }
    }

    public function editFilter($id, $data){
        $filter = R::getCol('SELECT attr_id FROM attribute_product WHERE product_id = ?', [$id]);
        //если менеджер убрал фильтры, тогда удаляем их
        if(empty($data['attrs']) && !empty($filter)){
            R::exec("DELETE FROM attribute_product WHERE product_id = ?", [$id]);
            return;
        }
        //если фильтры добавляются
        if(empty($filter) && !empty($data['attrs'])){
            $sql_part = '';
            foreach($data['attrs'] as $v){
                $sql_part .= "($v, $id),";
            }
            $sql_part = rtrim($sql_part, ',');
            R::exec("INSERT INTO attribute_product (attr_id, product_id) VALUES $sql_part");
            return;
        }
        //если изменились фильтры - удалим и запишем новые
        if(!empty($data['attrs'])){
            $result = array_diff($filter, $data['attrs']);
            if(!$result){
                R::exec("DELETE FROM attribute_product WHERE product_id = ?", [$id]);
                $sql_part = '';
                foreach($data['attrs'] as $v){
                    $sql_part .= "($v, $id),";
                }
                $sql_part = rtrim($sql_part, ',');
                R::exec("INSERT INTO attribute_product (attr_id, product_id) VALUES $sql_part");
            }
        }

    }

}