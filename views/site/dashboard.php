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

<div class="row justify-content-center">

							<div class="col-6 col-sm-4 col-lg-2">
								<div class="featured-boxes featured-boxes-modern-style-2 featured-boxes-modern-style-2-hover-only featured-boxes-modern-style-primary m-0 mb-4 pb-3">
									<div class="featured-box featured-box-no-borders featured-box-box-shadow">
                                        <?= Html::a('<span class="box-content px-1 py-4 text-center d-block">
                                        <span class="text-primary text-8 position-relative top-3 mt-3">
                                        <i class="fas fa-user"></i></span>
                                        <span class="font-weight-bold text-uppercase text-1 negative-ls-1 d-block text-dark pt-2">Usuarios</span>
                                        </span>
                                        ', ['/user-management/user/index'],['class'=>'text-decoration-none']); ?>
									</div>
								</div>
							</div>

							<div class="col-6 col-sm-4 col-lg-2">
								<div class="featured-boxes featured-boxes-modern-style-2 featured-boxes-modern-style-2-hover-only featured-boxes-modern-style-primary m-0 mb-4 pb-3">
									<div class="featured-box featured-box-no-borders featured-box-box-shadow">
                                        <?= Html::a('<span class="box-content px-1 py-4 text-center d-block">
                                        <span class="text-primary text-8 position-relative top-3 mt-3">
                                        <i class="fas fa-user-tag"></i></span>
                                        <span class="font-weight-bold text-uppercase text-1 negative-ls-1 d-block text-dark pt-2">Roles</span>
                                        </span>
                                        ', ['/user-management/role/index'],['class'=>'text-decoration-none']); ?>
									</div>
								</div>
							</div>

							<div class="col-6 col-sm-4 col-lg-2">
								<div class="featured-boxes featured-boxes-modern-style-2 featured-boxes-modern-style-2-hover-only featured-boxes-modern-style-primary m-0 mb-4 pb-3">
									<div class="featured-box featured-box-no-borders featured-box-box-shadow">
                                        <?= Html::a('<span class="box-content px-1 py-4 text-center d-block">
                                        <span class="text-primary text-8 position-relative top-3 mt-3">
                                        <i class="fas fa-user-lock"></i></span>
                                        <span class="font-weight-bold text-uppercase text-1 negative-ls-1 d-block text-dark pt-2">Permisos</span>
                                        </span>
                                        ', ['/user-management/permission/index'],['class'=>'text-decoration-none']); ?>
									</div>
								</div>
							</div>

							<div class="col-6 col-sm-4 col-lg-2">
								<div class="featured-boxes featured-boxes-modern-style-2 featured-boxes-modern-style-2-hover-only featured-boxes-modern-style-primary m-0 mb-4 pb-3">
									<div class="featured-box featured-box-no-borders featured-box-box-shadow">
                                        <?= Html::a('<span class="box-content px-1 py-4 text-center d-block">
                                        <span class="text-secondary text-8 position-relative top-3 mt-3">
                                        <i class="fas fa-university"></i></span>
                                        <span class="font-weight-bold text-uppercase text-1 negative-ls-1 d-block text-dark pt-2">Clientes</span>
                                        </span>
                                        ', ['/cliente/index'],['class'=>'text-decoration-none']); ?>
									</div>
								</div>
							</div>

							<div class="col-6 col-sm-4 col-lg-2">
								<div class="featured-boxes featured-boxes-modern-style-2 featured-boxes-modern-style-2-hover-only featured-boxes-modern-style-primary m-0 mb-4 pb-3">
									<div class="featured-box featured-box-no-borders featured-box-box-shadow">
                                        <?= Html::a('<span class="box-content px-1 py-4 text-center d-block">
                                        <span class="text-secondary text-8 position-relative top-3 mt-3">
                                        <i class="fas fa-warehouse"></i></span>
                                        <span class="font-weight-bold text-uppercase text-1 negative-ls-1 d-block text-dark pt-2">Tipo Tecs</span>
                                        </span>
                                        ', ['/tipotec/index'],['class'=>'text-decoration-none']); ?>
									</div>
								</div>
							</div>

							<div class="col-6 col-sm-4 col-lg-2">
								<div class="featured-boxes featured-boxes-modern-style-2 featured-boxes-modern-style-2-hover-only featured-boxes-modern-style-primary m-0 mb-4 pb-3">
									<div class="featured-box featured-box-no-borders featured-box-box-shadow">
                                        <?= Html::a('<span class="box-content px-1 py-4 text-center d-block">
                                        <span class="text-secondary text-8 position-relative top-3 mt-3">
                                        <i class="fas fa-file-archive"></i></span>
                                        <span class="font-weight-bold text-uppercase text-1 negative-ls-1 d-block text-dark pt-2"> Archivos</span>
                                        </span>
                                        ', ['/archivo/index'],['class'=>'text-decoration-none']); ?>
									</div>
								</div>
							</div>
							<div class="col-6 col-sm-4 col-lg-2">
								<div class="featured-boxes featured-boxes-modern-style-2 featured-boxes-modern-style-2-hover-only featured-boxes-modern-style-primary m-0 mb-4 pb-3">
									<div class="featured-box featured-box-no-borders featured-box-box-shadow">
                                        <?= Html::a('<span class="box-content px-1 py-4 text-center d-block">
                                        <span class="text-success text-8 position-relative top-3 mt-3">
                                        <i class="fas fa-book"></i></span>
                                        <span class="font-weight-bold text-uppercase text-1 negative-ls-1 d-block text-dark pt-2">Manuales</span>
                                        </span>
                                        ', ['/manual/index'],['class'=>'text-decoration-none']); ?>
									</div>
								</div>
							</div>

							<div class="col-6 col-sm-4 col-lg-2">
								<div class="featured-boxes featured-boxes-modern-style-2 featured-boxes-modern-style-2-hover-only featured-boxes-modern-style-primary m-0 mb-4 pb-3">
									<div class="featured-box featured-box-no-borders featured-box-box-shadow">
                                        <?= Html::a('<span class="box-content px-1 py-4 text-center d-block">
                                        <span class="text-success text-8 position-relative top-3 mt-3">
                                        <i class="fas fa-file-alt"></i></span>
                                        <span class="font-weight-bold text-uppercase text-1 negative-ls-1 d-block text-dark pt-2">Hoja del manual</span>
                                        </span>
                                        ', ['/manualdetalle/index'],['class'=>'text-decoration-none']); ?>
									</div>
								</div>
							</div>
							<div class="col-6 col-sm-4 col-lg-2">
								<div class="featured-boxes featured-boxes-modern-style-2 featured-boxes-modern-style-2-hover-only featured-boxes-modern-style-primary m-0 mb-4 pb-3">
									<div class="featured-box featured-box-no-borders featured-box-box-shadow">
                                        <?= Html::a('<span class="box-content px-1 py-4 text-center d-block">
                                        <span class="text-success text-8 position-relative top-3 mt-3">
                                        <i class="fas fa-calculator"></i></span>
                                        <span class="font-weight-bold text-uppercase text-1 negative-ls-1 d-block text-dark pt-2">Visitas a Hojas</span>
                                        </span>
                                        ', ['/manualdetalleusuario/index'],['class'=>'text-decoration-none']); ?>
									</div>
								</div>
							</div>

							<div class="col-6 col-sm-4 col-lg-2">
								<div class="featured-boxes featured-boxes-modern-style-2 featured-boxes-modern-style-2-hover-only featured-boxes-modern-style-primary m-0 mb-4 pb-3">
									<div class="featured-box featured-box-no-borders featured-box-box-shadow">
                                        <?= Html::a('<span class="box-content px-1 py-4 text-center d-block">
                                        <span class="text-tertiary text-8 position-relative top-3 mt-3">
                                        <i class="fas fa-stream"></i></span>
                                        <span class="font-weight-bold text-uppercase text-1 negative-ls-1 d-block text-dark pt-2">Categorias</span>
                                        </span>
                                        ', ['/manualcategoria/index'],['class'=>'text-decoration-none']); ?>
									</div>
								</div>
							</div>

							<div class="col-6 col-sm-4 col-lg-2">
								<div class="featured-boxes featured-boxes-modern-style-2 featured-boxes-modern-style-2-hover-only featured-boxes-modern-style-primary m-0 mb-4 pb-3">
									<div class="featured-box featured-box-no-borders featured-box-box-shadow">
                                        <?= Html::a('<span class="box-content px-1 py-4 text-center d-block">
                                        <span class="text-tertiary text-8 position-relative top-3 mt-3">
                                        <i class="fas fa-boxes"></i></span>
                                        <span class="font-weight-bold text-uppercase text-1 negative-ls-1 d-block text-dark pt-2">SubCategorias</span>
                                        </span>
                                        ', ['/manualsubcategoria/index'],['class'=>'text-decoration-none']); ?>
									</div>
								</div>
							</div>
							<div class="col-6 col-sm-4 col-lg-2">
								<div class="featured-boxes featured-boxes-modern-style-2 featured-boxes-modern-style-2-hover-only featured-boxes-modern-style-primary m-0 mb-4 pb-3">
									<div class="featured-box featured-box-no-borders featured-box-box-shadow">
                                        <?= Html::a('<span class="box-content px-1 py-4 text-center d-block">
                                        <span class="text-tertiary text-8 position-relative top-3 mt-3">
                                        <i class="fas fa-book-open"></i></span>
                                        <span class="font-weight-bold text-uppercase text-1 negative-ls-1 d-block text-dark pt-2">Tipos de Manual</span>
                                        </span>
                                        ', ['/manualtipo/index'],['class'=>'text-decoration-none']); ?>
									</div>
								</div>
							</div>


							<div class="col-6 col-sm-4 col-lg-2">
								<div class="featured-boxes featured-boxes-modern-style-2 featured-boxes-modern-style-2-hover-only featured-boxes-modern-style-primary m-0 mb-4 pb-3">
									<div class="featured-box featured-box-no-borders featured-box-box-shadow">
                                        <?= Html::a('<span class="box-content px-1 py-4 text-center d-block">
                                        <span class="text-tertiary text-8 position-relative top-3 mt-3">
                                        <i class="fas fa-braille"></i></span>
                                        <span class="font-weight-bold text-uppercase text-1 negative-ls-1 d-block text-dark pt-2">Tipos de Modulos</span>
                                        </span>
                                        ', ['/tiposmodulo/index'],['class'=>'text-decoration-none']); ?>
									</div>
								</div>
							</div>

							<div class="col-6 col-sm-4 col-lg-2">
								<div class="featured-boxes featured-boxes-modern-style-2 featured-boxes-modern-style-2-hover-only featured-boxes-modern-style-primary m-0 mb-4 pb-3">
									<div class="featured-box featured-box-no-borders featured-box-box-shadow">
                                        <?= Html::a('<span class="box-content px-1 py-4 text-center d-block">
                                        <span class="text-tertiary text-8 position-relative top-3 mt-3">
                                        <i class="fas fa-puzzle-piece"></i></span>
                                        <span class="font-weight-bold text-uppercase text-1 negative-ls-1 d-block text-dark pt-2">Ubicación Sección</span>
                                        </span>
                                        ', ['/manualseccion/index'],['class'=>'text-decoration-none']); ?>
									</div>
								</div>
							</div>
							<div class="col-6 col-sm-4 col-lg-2">
								<div class="featured-boxes featured-boxes-modern-style-2 featured-boxes-modern-style-2-hover-only featured-boxes-modern-style-primary m-0 mb-4 pb-3">
									<div class="featured-box featured-box-no-borders featured-box-box-shadow">
                                        <?= Html::a('<span class="box-content px-1 py-4 text-center d-block">
                                        <span class="text-tertiary text-8 position-relative top-3 mt-3">
                                        <i class="fas fa-eye"></i></span>
                                        <span class="font-weight-bold text-uppercase text-1 negative-ls-1 d-block text-dark pt-2">Estatus</span>
                                        </span>
                                        ', ['/status/index'],['class'=>'text-decoration-none']); ?>
									</div>
								</div>
							</div>



            </div>
        </div>
    </div>
</div>
</div>
