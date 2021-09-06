<?php

/* @var $this yii\web\View */
use yii\bootstrap4\Breadcrumbs;
use yii\helpers\Html;
use app\components\listarClientes;


$this->title = 'Clientes';
$this->params['breadcrumbs'][] = "Clientes";
?>
<section class="page-header page-header-modern bg-color-light-scale-1 page-header-md ">
    <div class="container-fluid">
        <div class="row align-items-center">
            <div class="col">
                <div class="row">
                    <div class="col-md-12 align-self-center p-static order-2 text-center">
                        <div class="overflow-hidden pb-2">
                            <h1 class="text-dark font-weight-bold text-9 appear-animation" data-appear-animation="maskUp" data-appear-animation-delay="100">Acerca de nuestros clientes</h1>
                        </div>
                    </div>

            </div>
        </div>
    </div>
</section>
<section class="section section-custom-map appear-animation lazyloaded animated fadeInUpShorter appear-animation-visible" data-appear-animation="fadeInUpShorter" data-src-bg="<?= Yii::getAlias('@web') ?>/img/map.png" style="background-color: transparent; background-position: center 0px; background-repeat: no-repeat; animation-delay: 100ms;">
    <section class="section section-default section-footer">
        <div class="container">
        <div class="row mb-5 pb-3">
        <?php echo listarClientes::widget(); ?>
        </div>
        </div>
    </section>
</section>
