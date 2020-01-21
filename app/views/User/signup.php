<!--start-breadcrumbs-->
<div class="breadcrumbs">
    <div class="container">
        <div class="breadcrumbs-main">
            <ol class="breadcrumb">
                <li><a href="<?= PATH ?>">Главная</a></li>
                <li>Регистрация</li>
            </ol>
        </div>
    </div>
</div>
<!--end-breadcrumbs-->
<!--prdt-starts-->
<div class="prdt">
    <div class="container">
        <div class="prdt-top">
            <div class="col-md-12">
                <div class="product-one signup">
                    <div class="register-top heading">
                        <h2>РЕГИСТРАЦИЯ</h2>
                    </div>

                    <div class="register-main">
                        <div class="col-md-6 account-left">
                            <form method="post" action="user/signup" id="signup" role="form" data-toggle="validator">
                                <div class="form-group has-feedback">
                                    <label for="login">Логин</label>
                                    <input type="text" name="login" class="form-control" id="login" placeholder="Логин" value="<?=isset($_SESSION['form-data']['login']) ? h($_SESSION['form-data']['login']) : '';?>" required>
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                </div>
                                <div class="form-group has-feedback">
                                    <label for="pasword">Пароль</label>
                                    <input type="password" name="password" class="form-control" id="pasword" placeholder="Пароль" data-error="Пароль должен содержать не менее 6 символов" data-minlength="6" required>
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    <div class="help-block with-errors"></div>
                                </div>
                                <div class="form-group has-feedback">
                                    <label for="name">Имя</label>
                                    <input type="text" name="name" class="form-control" id="name" placeholder="Имя" value="<?=isset($_SESSION['form-data']['name']) ? h($_SESSION['form-data']['name']) : '';?>" required>
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                </div>
                                <div class="form-group has-feedback">
                                    <label for="email">Email</label>
                                    <input type="email" name="email" class="form-control" id="email" placeholder="Email" value="<?=isset($_SESSION['form-data']['email']) ? h($_SESSION['form-data']['email']) : '';?>" required>
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                </div>
                                <div class="form-group has-feedback">
                                    <label for="phone">Телефон</label>
                                    <input type="phone" name="phone" class="form-control" id="phone" placeholder="Телефон" value="<?=isset($_SESSION['form-data']['phone']) ? h($_SESSION['form-data']['phone']) : '';?>" required>
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                </div>
                                <div class="form-group has-feedback">
                                    <label for="address">Адрес</label>
                                    <input type="text" name="address" class="form-control" id="address" placeholder="Адрес" value="<?=isset($_SESSION['form-data']['address']) ? h($_SESSION['form-data']['address']) : '';?>" required>
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                </div>
                                <button type="submit" class="btn btn-default">Зарегистрироваться</button>
                            </form>
                            <?php if(isset($_SESSION['form-data'])) unset($_SESSION['form-data']);?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--product-end-->