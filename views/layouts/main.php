<?php

/* @var $this \yii\web\View */
/* @var $content string */

use app\widgets\Alert;
use yii\helpers\Html;
use yii\bootstrap4\Nav;
use yii\bootstrap4\NavBar;
use yii\bootstrap4\Breadcrumbs;
use app\assets\AppAsset;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?php $this->registerCsrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body data-plugin-page-transition>
<?php $this->beginBody() ?>

<div class="body">
    <?php require_once('lyt_header.php'); ?>
    <div class="container">
        <div class="row align-items-center justify-content-center">
                            <?= Breadcrumbs::widget([
                                    'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
                            ]) ?>
        </div>
    </div>
    <div role="main" class="main">
        
        <?= Alert::widget() ?>
        <?= $content ?>
    </div>


    <?php require_once('lyt_footer.php'); ?>
    <a class="scroll-to-top hidden-mobile visible" href="#"><i class="fas fa-chevron-up"></i></a>
<?php $this->endBody() ?>
        </div> <!--body-->
</body>
</html>
<?php $this->endPage() ?>
