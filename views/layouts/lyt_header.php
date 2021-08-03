<?php
use yii\bootstrap4\Nav;
use yii\bootstrap4\NavBar;
use webvimark\modules\UserManagement\UserManagementModule;
use yii\helpers\Html;
use webvimark\modules\UserManagement\models\User;
?>
			<header id="header" data-plugin-options="{'stickyEnabled': true, 'stickyEnableOnBoxed': true, 'stickyEnableOnMobile': false, 'stickyStartAt': 164, 'stickySetTop': '-164px', 'stickyChangeLogo': false}">
				<div class="header-body border-0">
					<div class="header-top header-top-default border-bottom-0 bg-color-primary">
						<div class="container">
							<div class="header-row py-2">
								<div class="header-column justify-content-start">
									<div class="header-row">
										<nav class="header-nav-top">
											<ul class="nav nav-pills text-uppercase text-2">
												<li class="nav-item nav-item-anim-icon">
													<?= Html::a('<i class="fas fa-angle-right"></i> Acerca de SIE', ['/site/about'], ['class' => 'nav-link ps-0 text-light opacity-7']) ?>
												</li>
												<li class="nav-item nav-item-anim-icon">
													
													<?= Html::a('<i class="fas fa-angle-right"></i> Contactanos', ['/site/contact'], ['class' => 'nav-link text-light opacity-7 pe-0']) ?>
												</li>
												<li class="nav-item nav-item-anim-icon">

													<?= Html::a('<i class="fas fa-angle-right"></i> Ingresar', ['/user-management/auth/login'], ['class' => 'nav-link text-light opacity-7 pe-0']) ?>
												</li>
											</ul>
										</nav>
									</div>
								</div>
								<div class="header-column justify-content-end">
									<div class="header-row">
										<ul class="header-social-icons social-icons d-none d-sm-block social-icons-clean social-icons-icon-light">
											<li class="social-icons-facebook"><a href="http://www.facebook.com/" target="_blank" title="Facebook"><i class="fab fa-facebook-f"></i></a></li>
											<li class="social-icons-twitter"><a href="http://www.twitter.com/" target="_blank" title="Twitter"><i class="fab fa-twitter"></i></a></li>
											<li class="social-icons-linkedin"><a href="http://www.linkedin.com/" target="_blank" title="Linkedin"><i class="fab fa-linkedin-in"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="header-container container">
						<div class="header-row py-3">
							<div class="header-column justify-content-start w-50 order-md-1 d-none d-md-flex">
								<div class="header-row">
									<ul class="header-extra-info">
										<li class="m-0">
											<div class="feature-box feature-box-style-2 align-items-center">
											<div class="feature-box-icon">
													<i class="fab fa-whatsapp text-7 p-relative" style="top: -2px;"></i>
													
												</div>
							
												<div class="feature-box-info">
													<p class="pb-0 font-weight-semibold line-height-5 text-2"><a href="tel:9931810654" class="text-decoration-none text-color-default text-color-hover-primary">(993) 1810654</a><br><a href="tel:9931810654" class="text-decoration-none text-color-default text-color-hover-primary">(993) 1810654</a></p>
												</div>
											</div>
											
										</li>
									</ul>
								</div>
							</div>
							<div class="header-column justify-content-start justify-content-md-center order-1 order-md-2">
								<div class="header-row">
									<div class="header-logo">
										<a href="index.html">
											<img alt="Porto" width="64" height="64"src="<?= Yii::getAlias('@web') ?>/img/sie/logosie_v1.jpg">
										</a>
									</div>
								</div>
							</div>
							<div class="header-column justify-content-end w-50 order-2 order-md-3">
								<div class="header-row">
									<ul class="header-extra-info">
										<li class="m-0">
											<div class="feature-box reverse-allres feature-box-style-2 align-items-center">
												<div class="feature-box-icon">
													<i class="fas fa-envelope text-7 p-relative" style="top: -2px;"></i>
												</div>
												<div class="feature-box-info">
													<p class="pb-0 font-weight-semibold line-height-5 text-2">info@esie.mx</p>
												</div>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="header-nav-bar header-nav-bar-top-border bg-light">
						<div class="header-container container">
							<div class="header-row">
								<div class="header-column">
									<div class="header-row justify-content-end">
										<div class="header-nav p-0">
											<div class="header-nav header-nav-line header-nav-divisor header-nav-spaced justify-content-lg-center">
												<div class="header-nav-main header-nav-main-square header-nav-main-effect-1 header-nav-main-sub-effect-1">
													<nav class="collapse">
														<ul class="nav nav-pills flex-column flex-lg-row" id="mainNav">
															<li class="dropdown">
																
																<?= Html::a('INICIO', ['/site/index'], ['class' => 'dropdown-item dropdown-toggle']) ?>
																
															</li>


															<li class="dropdown">
																<a class="dropdown-item dropdown-toggle" href="#">
																	Identidad
																</a>
																<ul class="dropdown-menu">
																	<li><?= Html::a('Acerca de SIE', ['/site/about'], ['class' => 'dropdown-item']) ?></li>
																	<li><?= Html::a('Equipo SIE', ['/site/team'], ['class' => 'dropdown-item']) ?></li>
																</ul>
															</li>
															<li class="dropdown">
																<a class="dropdown-item dropdown-toggle" href="#">
																	Clientes
																</a>
																<ul class="dropdown-menu">
																	<li><a class="dropdown-item" href="#">Clientes sie</a></li>
																	<li><a class="dropdown-item" href="#">Casos de estudio</a></li>
																</ul>
															</li>
															<li class="dropdown">
																<a class="dropdown-item dropdown-toggle" href="#">
																	Servicios
																</a>
																<ul class="dropdown-menu">
																	<li><a class="dropdown-item" href="#">Capacitación</a></li>
																	<li><a class="dropdown-item" href="#">Consultoria</a></li>
																	<li><a class="dropdown-item" href="#">Respaldos</a></li>
																</ul>
															</li>
															<li class="dropdown">
																<a class="dropdown-item dropdown-toggle" href="#">
																	Soporte
																</a>
																<ul class="dropdown-menu">
																	<li><a class="dropdown-item" href="#">Preguntas frecuentes</a></li>
																	<li><a class="dropdown-item" href="#">Manuales</a></li>
																	<li><a class="dropdown-item" href="#">Actualizaciones</a></li>
																</ul>
															</li>

															<li class="dropdown">
																
																<?php if (Yii::$app->user->isGuest) { ?>
																
																		<?= Html::a('Iniciar Sesión', ['/user-management/auth/login'], ['class' => 'dropdown-item']) ?>
																
																<?php }else{ ?>
																
																		<?= Html::a('Cerrar sesión (' . Yii::$app->user->identity->username . ')', ['/user-management/auth/logout'], ['class' => 'dropdown-item dropdown-toggle']) ?>
																		<?php if(User::hasRole('superadmin')): ?>
																		<ul class="dropdown-menu">
																			<li>
																			<?= Html::a('Usuarios', ['/user-management/user/index'], ['class' => 'dropdown-item']) ?>
																			</li>
																			<li><?= Html::a('Roles', ['/user-management/role/index'], ['class' => 'dropdown-item']) ?></li>
																			<li><?= Html::a('Permisos', ['/user-management/permission/index'], ['class' => 'dropdown-item']) ?></li>
																		</ul>
																		<?php endif;?>
																	
																<?php }?>
																
															</li>
																											
														</ul>
													</nav>
												</div>
												<button class="btn header-btn-collapse-nav" data-bs-toggle="collapse" data-bs-target=".header-nav-main nav">
													<i class="fas fa-bars"></i>
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</header>			