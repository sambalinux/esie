<?php

/* @var $this yii\web\View */
use yii\bootstrap4\Breadcrumbs;
use yii\helpers\Html;
$menus = array("Usuarios","Clientes","Archivos","Manuales","Manual Detalles","Pendiente","Pendiente","Pendiente","Pendiente","Pendiente","Pendiente","Pendiente");
$this->title = 'Panel control';
$this->params['breadcrumbs'][] = "Panel Control";
?>

<section class="page-header page-header-modern bg-color-light-scale-1 page-header-md ">
    <div class="container-fluid">
        <div class="row align-items-center">
            <div class="col">
                <div class="row">
                    <div class="col-md-12 align-self-center p-static order-2 text-center">
                        <div class="overflow-hidden pb-2">
                            <h1 class="text-dark font-weight-bold text-9 appear-animation" data-appear-animation="maskUp" data-appear-animation-delay="100">Panel Control</h1>
                        </div>
                    </div>

            </div>
        </div>
    </div>
</section>
<div class="container">
    <div class="row py">
    <div class="row">
        <div class="col-lg-3 mb-4 mb-lg-0">							
            <div class="accordion" id="accordionPrimary">
                <div class="card card-default">
                    <div class="card-header bg-color-primary" id="collapsePrimaryHeadingOne">
                        <h4 class="card-title m-0">
                            <a class="accordion-toggle text-color-light" data-bs-toggle="collapse" data-bs-target="#collapsePrimaryOne" aria-expanded="true" aria-controls="collapsePrimaryOne">
                            <?php echo "1 - ".$menus[0];?>
                            </a>
                        </h4>
                    </div>
                    <div id="collapsePrimaryOne" class="collapse show" aria-labelledby="collapsePrimaryHeadingOne" data-bs-parent="#accordionPrimary">
                        <div class="card-body" style="padding: 10px 10px 10px 0px">
                        <ol class="list list-ordened list-ordened-style-2">
                            <li><?= Html::a('Usuarios', ['/user-management/user/index']) ?></li>
                            <li><?= Html::a('Roles', ['/user-management/role/index']) ?></li>
                            <li><?= Html::a('Permisos', ['/user-management/permission/index']) ?></li>
                        </ol>
                        </div>
                    </div>
                </div>
                <div class="card card-default">
                    <div class="card-header bg-color-primary" id="collapsePrimaryHeadingTwo">
                        <h4 class="card-title m-0">
                            <a class="accordion-toggle text-color-light" data-bs-toggle="collapse" data-bs-target="#collapsePrimaryTwo" aria-expanded="false" aria-controls="collapsePrimaryTwo">
                            <?php echo "2 - ".$menus[1];?>
                            </a>
                        </h4>
                    </div>
                    <div id="collapsePrimaryTwo" class="collapse" aria-labelledby="collapsePrimaryHeadingTwo" data-bs-parent="#accordionPrimary">
                        <div class="card-body" style="padding: 10px 10px 10px 0px">
                            <ol class="list list-ordened list-ordened-style-2">
                                <li><?= Html::a('Admin', ['/cliente/index']) ?></li>
                                <li><?= Html::a('Lista Clientes', ['/cliente/list']) ?></li>
                                <li><?= Html::a('Tipo Tecs', ['/tipotec/index']) ?></li>
                            </ol>
                        </div>
                    </div>
                </div>
                <div class="card card-default">
                    <div class="card-header bg-color-primary" id="collapsePrimaryHeadingThree">
                        <h4 class="card-title m-0">
                            <a class="accordion-toggle text-color-light" data-bs-toggle="collapse" data-bs-target="#collapsePrimaryThree" aria-expanded="false" aria-controls="collapsePrimaryThree">
                            <?php echo "3 - ". $menus[2];?>
                            </a>
                        </h4>
                    </div>
                    <div id="collapsePrimaryThree" class="collapse" aria-labelledby="collapsePrimaryHeadingThree" data-bs-parent="#accordionPrimary">
                    <div class="card-body" style="padding: 10px 10px 10px 0px">
                            <ol class="list list-ordened list-ordened-style-2">
                                <li><?= Html::a('Admin', ['/archivo/index']) ?></li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 mb-4 mb-lg-0">
            <div class="accordion" id="accordionSecondary">
                <div class="card card-default">
                    <div class="card-header bg-color-secondary" id="collapseSecondaryHeadingOne">
                        <h4 class="card-title m-0">
                            <a class="accordion-toggle text-color-light" data-bs-toggle="collapse" data-bs-target="#collapseSecondaryOne" aria-expanded="true" aria-controls="collapseSecondaryOne">
                            <?php echo "4 - ".$menus[3];?>
                            </a>
                        </h4>
                    </div>
                    <div id="collapseSecondaryOne" class="collapse show" aria-labelledby="collapseSecondaryHeadingOne" data-bs-parent="#accordionSecondary">
                    <div class="card-body" style="padding: 10px 10px 10px 0px">
                            <ol class="list list-ordened list-ordened-style-2">
                                <li><?= Html::a('Admin', ['/manual/index']) ?></li>
                                <li><?= Html::a('Categoría', ['/manualcategoria/index']) ?></li>
                                <li><?= Html::a('Sub Categorías', ['/manualsubcategoria/index']) ?></li>
                                <li><?= Html::a('Tipos Manual', ['/manualtipo/index']) ?></li>
                                <li><?= Html::a('Tipos Módulos', ['/tiposmodulo/index']) ?></li>
                                <li><?= Html::a('Sección de ubicación', ['/manualseccion/index']) ?></li>
                                <li><?= Html::a('Status', ['/status/index']) ?></li>
                            </ol>
                        </div>
                    </div>
                </div>
                <div class="card card-default">
                    <div class="card-header bg-color-secondary" id="collapseSecondaryHeadingTwo">
                        <h4 class="card-title m-0">
                            <a class="accordion-toggle text-color-light" data-bs-toggle="collapse" data-bs-target="#collapseSecondaryTwo" aria-expanded="false" aria-controls="collapseSecondaryTwo">
                            <?php echo "5 - ".$menus[4];?>
                            </a>
                        </h4>
                    </div>
                    <div id="collapseSecondaryTwo" class="collapse" aria-labelledby="collapseSecondaryHeadingTwo" data-bs-parent="#accordionSecondary">
                    <div class="card-body" style="padding: 10px 10px 10px 0px">
                            <ol class="list list-ordened list-ordened-style-2">
                                <li><?= Html::a('Admin', ['/manualdetalle/index']) ?></li>
                                <li><?= Html::a('Detalle usuarios', ['/manualdetalleusuario/index']) ?></li>
                            </ol>
                        </div>
                    </div>
                </div>
                <div class="card card-default">
                    <div class="card-header bg-color-secondary" id="collapseSecondaryHeadingThree">
                        <h4 class="card-title m-0">
                            <a class="accordion-toggle text-color-light" data-bs-toggle="collapse" data-bs-target="#collapseSecondaryThree" aria-expanded="false" aria-controls="collapseSecondaryThree">
                            <?php echo $menus[5];?>
                            </a>
                        </h4>
                    </div>
                    <div id="collapseSecondaryThree" class="collapse" aria-labelledby="collapseSecondaryHeadingThree" data-bs-parent="#accordionSecondary">
                        <div class="card-body">
                            <p class="mb-0">Donec tellus massa, tristique sit amet condim vel, facilisis quis sapien.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 mb-4 mb-lg-0">
            <div class="accordion" id="accordionTertiary">
                <div class="card card-default">
                    <div class="card-header bg-color-tertiary" id="collapseTertiaryHeadingOne">
                        <h4 class="card-title m-0">
                            <a class="accordion-toggle text-color-light" data-bs-toggle="collapse" data-bs-target="#collapseTertiaryOne" aria-expanded="true" aria-controls="collapseTertiaryOne">
                            <?php echo $menus[6];?>
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTertiaryOne" class="collapse show" aria-labelledby="collapseTertiaryHeadingOne" data-bs-parent="#accordionTertiary">
                        <div class="card-body">
                            <p class="mb-0">Donec tellus massa, tristique sit amet condim vel, facilisis quis sapien.</p>
                        </div>
                    </div>
                </div>
                <div class="card card-default">
                    <div class="card-header bg-color-tertiary" id="collapseTertiaryHeadingTwo">
                        <h4 class="card-title m-0">
                            <a class="accordion-toggle text-color-light" data-bs-toggle="collapse" data-bs-target="#collapseTertiaryTwo" aria-expanded="false" aria-controls="collapseTertiaryTwo">
                            <?php echo $menus[7];?>
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTertiaryTwo" class="collapse" aria-labelledby="collapseTertiaryHeadingTwo" data-bs-parent="#accordionTertiary">
                        <div class="card-body">
                            <p class="mb-0">Donec tellus massa, tristique sit amet condim vel, facilisis quis sapien.</p>
                        </div>
                    </div>
                </div>
                <div class="card card-default">
                    <div class="card-header bg-color-tertiary" id="collapseTertiaryHeadingThree">
                        <h4 class="card-title m-0">
                            <a class="accordion-toggle text-color-light" data-bs-toggle="collapse" data-bs-target="#collapseTertiaryThree" aria-expanded="false" aria-controls="collapseTertiaryThree">
                            <?php echo $menus[8];?>
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTertiaryThree" class="collapse" aria-labelledby="collapseTertiaryHeadingThree" data-bs-parent="#accordionTertiary">
                        <div class="card-body">
                            <p class="mb-0">Donec tellus massa, tristique sit amet condim vel, facilisis quis sapien.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="accordion" id="accordionQuaternary">
                <div class="card card-default">
                    <div class="card-header bg-color-quaternary" id="collapseQuaternaryHeadingOne">
                        <h4 class="card-title m-0">
                            <a class="accordion-toggle text-color-light" data-bs-toggle="collapse" data-bs-target="#collapseQuaternaryOne" aria-expanded="true" aria-controls="collapseQuaternaryOne">
                            <?php echo $menus[9];?>
                            </a>
                        </h4>
                    </div>
                    <div id="collapseQuaternaryOne" class="collapse show" aria-labelledby="collapseQuaternaryHeadingOne" data-bs-parent="#accordionQuaternary">
                        <div class="card-body">
                            <p class="mb-0">Donec tellus massa, tristique sit amet condim vel, facilisis quis sapien.</p>
                        </div>
                    </div>
                </div>
                <div class="card card-default">
                    <div class="card-header bg-color-quaternary" id="collapseQuaternaryHeadingTwo">
                        <h4 class="card-title m-0">
                            <a class="accordion-toggle text-color-light" data-bs-toggle="collapse" data-bs-target="#collapseQuaternaryTwo" aria-expanded="false" aria-controls="collapseQuaternaryTwo">
                            <?php echo $menus[10];?>
                            </a>
                        </h4>
                    </div>
                    <div id="collapseQuaternaryTwo" class="collapse" aria-labelledby="collapseQuaternaryHeadingTwo" data-bs-parent="#accordionQuaternary">
                        <div class="card-body">
                            <p class="mb-0">Donec tellus massa, tristique sit amet condim vel, facilisis quis sapien.</p>
                        </div>
                    </div>
                </div>
                <div class="card card-default">
                    <div class="card-header bg-color-quaternary" id="collapseQuaternaryHeadingThree">
                        <h4 class="card-title m-0">
                            <a class="accordion-toggle text-color-light" data-bs-toggle="collapse" data-bs-target="#collapseQuaternaryThree" aria-expanded="false" aria-controls="collapseQuaternaryThree">
                            <?php echo $menus[11];?>
                            </a>
                        </h4>
                    </div>
                    <div id="collapseQuaternaryThree" class="collapse" aria-labelledby="collapseQuaternaryHeadingThree" data-bs-parent="#accordionQuaternary">
                        <div class="card-body">
                            <p class="mb-0">Donec tellus massa, tristique sit amet condim vel, facilisis quis sapien.</p>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
</div>
</div>
