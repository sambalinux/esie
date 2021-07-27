<?php
use yii\bootstrap4\Nav;
use yii\bootstrap4\NavBar;
use webvimark\modules\UserManagement\UserManagementModule;
?>

<?php
    NavBar::begin([
        'brandLabel' => Yii::$app->name,
        'brandUrl' => Yii::$app->homeUrl,
        //comentado para bootstrap4 zea
        'options' => [
        'class' => 'navbar navbar-expand-lg navbar-light bg-light',
        ],
    ]);

    /*$menuItems = [
    ['label' => '<span class="glyphicon glyphicon-home"></span>', 'url' =>
    ['/site/dashboard']],
    ];*/
    if (Yii::$app->user->isGuest) {
        $menuItems = [
        ['label' => '<i class="fas fa-church"></i> Menu 1',
        'items' =>[
        ['label' => '<i class="fa fa-child" aria-hidden="true"></i>
        Conocenos' , 'url' => ['/site/contact']],
        ['label' => '<i class="fa fa-child" aria-hidden="true"></i> Submenu
        1' , 'url' => ['/site/about']],
        ['label' => '<i class="fa fa-child" aria-hidden="true"></i>
        Contacto' , 'url' => ['/site/contact']],
        ]
        ],
        ['label' => 'Home', 'url' => ['/site/index']],
        ['label' => 'About', 'url' => ['/site/about']],
        ['label' => 'Contact', 'url' => ['/site/contact']],
        ['label' => 'Datos', 'url' => ['/site/about']],
        ['label' => 'Login', 'url' => ['/user-management/auth/login']],
        ];
    }
    else {
        $menuItems= [
        [
        /*Menú para usuarios logueados*/
        'label' => 'Frontend routes',
        'items'=>[
        ['label'=>'Registration', 'url'=>['/usermanagement/auth/registration']],
        ['label'=>'Change own password', 'url'=>['/usermanagement/auth/change-own-password']],
        ['label'=>'Password recovery', 'url'=>['/usermanagement/auth/password-recovery']],
        ['label'=>'E-mail confirmation', 'url'=>['/usermanagement/auth/confirm-email']],
        ],
        ],

        ['label' => '<i class="fas fa-book-open"></i> Menu admin',
        'items' =>[
        ['label' => '<i class="fas fa-book"></i> Sub Menu 1' , 'url' =>
        ['#']],
        ['label' => '<i class="fas fa-ankh"></i> Sub Menu 2' , 'url' =>
        ['#']],
        ]
        ],
        ['label' => '<i class="fas fa-book-open"></i> Menu admin 2',
        'items' =>[
        ['label' => '<i class="fas fa-book"></i> Sub Menu 1' , 'url' =>
        ['#']],
        ]
        ],
        ];
        /*Menú personalizado por cada tipo de usuario*/
    if(Yii::$app->user->identity->hasRole('superadmin')): 
        //Menú para el role superadmin

        $menuItems = [
        ['label' => '<i class="fas fa-home"></i>', 'url' =>
        ['/site/dashboard']],
        ['label' => '<i class="fas fa-users-cog"></i> Administrador',
        'items'=>UserManagementModule::menuItems()],

        ];
    endif;
        $menuItems[] = [
        'label' => '<i class="fas fa-door-closed"></i> Cerrar Sesión (' . Yii::$app->user->identity->username . ')',
        'url' => ['/user-management/auth/logout'],
        'linkOptions' => ['data-method' => 'post'],
        ];
    }
        echo Nav::widget([
        'options' => ['class' => 'navbar-nav navbar-right ml-auto'],
        'encodeLabels' => false,
        'items' => $menuItems,
        ]);
        NavBar::end();
?>
