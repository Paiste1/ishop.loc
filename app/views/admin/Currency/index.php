<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Список валют
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?=ADMIN;?>"><i class="fa fa-dashboard"></i> Главная</a></li>
        <li class="active"> Список валют</li>
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
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Наименование</th>
                                <th>Код</th>
                                <th>Значение</th>
                                <th>Действие</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php foreach($currencies as $curr): ?>
                                <tr>
                                    <td><?=$curr->id;?></td>
                                    <td><?=$curr->title;?></td>
                                    <td><?=$curr->code?></td>
                                    <td><?=$curr->value;?></td>
                                    <td>
                                        <a href="<?=ADMIN;?>/currency/edit?id=<?=$curr->id;?>"><i class="fa fa-fw fa-pencil"></i></a>
                                        <a class="delete" href="<?=ADMIN;?>/currency/delete?id=<?=$curr->id;?>"><i class="fa fa-fw fa-close text-danger"></i></a>
                                    </td>
                                </tr>
                            <?php endforeach;?>
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