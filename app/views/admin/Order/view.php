<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Заказ №<?=$order['id'];?>
        <?php if(!$order['status']): ?>
            <a href="<?=ADMIN;?>/order/change?id=<?=$order['id'];?>&status=1" class="btn btn-success btn-xs">Завершить</a>
        <?php else: ?>
            <a href="<?=ADMIN;?>/order/change?id=<?=$order['id'];?>&status=0" class="btn btn-default btn-xs">Вернуть на доработку</a>
        <?php endif; ?>
        <a href="<?=ADMIN;?>/order/delete?id=<?=$order['id'];?>" class="btn btn-danger btn-xs delete">Удалить</a>
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?=ADMIN;?>"><i class="fa fa-dashboard"></i> Главная</a></li>
        <li><a href="<?=ADMIN;?>/order">Список заказов</a></li>
        <li class="active">Заказ № <?=$order['id'];?></li>
    </ol>
</section>
<!-- Main content -->
<section class="content">
    <!-- Small boxes (Stat box) -->
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="box-body">
                    <div class="table-responsive">
                        <table class="table teble-bordered table-hover">
                            <tbody>
                                <tr>
                                    <td><b>Номер заказа</b></td>
                                    <td><?=$order['id'];?></td>
                                </tr>
                                <tr>
                                    <td><b>Имя заказчика</b></td>
                                    <td><?=$order['name'];?></td>
                                </tr>
                                <tr>
                                    <td><b>Email заказчика</b></td>
                                    <td><?=$order['email'];?></td>
                                </tr>
                                <tr>
                                    <td><b>Телефон</b></td>
                                    <td><?=$order['phone'];?></td>
                                </tr>
                                <tr>
                                    <td><b>Дата заказа</b></td>
                                    <td><?=$order['date'];?></td>
                                </tr>
                                <tr>
                                    <td><b>Дата изменения</b></td>
                                    <td><?=$order['update_at'];?></td>
                                </tr>
                                <tr>
                                    <td><b>Кол-во позиций в заказе</b></td>
                                    <td><?=count($order_products);?></td>
                                </tr>
                                <tr>
                                    <td><b>Сумма заказа</b></td>
                                    <td><b><?=$order['sum'];?></b> <?=$order['currency'];?></td>
                                </tr>
                                <tr>
                                    <td><b>Статус</b></td>
                                    <td><?=$order['status'] ? 'Завершено' : 'Новый';?></td>
                                </tr>
                                <tr>
                                    <td><b>Комментарий к заказу</b></td>
                                    <td><?=$order['note'];?></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <h3>Детали заказа</h3>
            <div class="box">
                <div class="box-body">
                    <div class="table-responsive">
                        <table class="table teble-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Наименование</th>
                                    <th>Кол-во</th>
                                    <th>Цена</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $qty = 0; foreach($order_products as $product): ?>
                                    <tr>
                                        <td><?=$product->id;?></td>
                                        <td><?=$product->title;?></td>
                                        <td><?=$product->qty; $qty += $product->qty?></td>
                                        <td><?=$product->price;?></td>
                                    </tr>
                                <?php endforeach;?>
                                <tr class="active">
                                    <td colspan="2">
                                        <b>Итого: </b>
                                    </td>
                                    <td><b><?=$qty;?></b></td>
                                    <td><b><?=$order['sum'];?> <?=$order['currency'];?></b></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.row -->
</section>
<!-- /.content -->