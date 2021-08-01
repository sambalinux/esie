<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model app\models\ContactForm */

use yii\helpers\Html;
use yii\bootstrap4\ActiveForm;
use yii\captcha\Captcha;

$this->title = 'Contactanos';
$this->params['breadcrumbs'][] = $this->title;
?>
				<div class="container">

					<div class="row py-4">
						<div class="col-lg-7 appear-animation" data-appear-animation="fadeIn" data-appear-animation-delay="650">

							<div class="offset-anchor" id="contact-sent"></div>

							<?php
							if (isset($arrResult)) {
								if($arrResult['response'] == 'success') {
								?>
								<div class="alert alert-success">
									<strong>Success!</strong> Your message has been sent to us.
								</div>
								<?php
								} else if($arrResult['response'] == 'error') {
								?>
								<div class="alert alert-danger">
									<strong>Error!</strong> There was an error sending your message.
									<span class="font-size-xs mt-2 d-block"><?php echo $arrResult['errorMessage'];?></span>
								</div>
								<?php
								} else if($arrResult['response'] == 'captchaError') {
								?>
								<div class="alert alert-danger">
									<strong>Error!</strong> Verification failed.
								</div>
								<?php
								}
							}
							?>

							<h2 class="font-weight-bold text-7 mt-2 mb-0">Contactanos</h2>
							<p class="mb-4">Escriba su pregunta y le contestaremos de inmediato!</p>

							<form id="contactFormAdvanced" action="<?php echo basename($_SERVER['PHP_SELF']); ?>#contact-sent" method="POST" enctype="multipart/form-data">
								<input type="hidden" value="true" name="emailSent" id="emailSent">
								<div class="row">
									<div class="form-group col-md-6">
										<label class="form-label mb-1 text-2">Nombre completo</label>
										<input type="text" value="" data-msg-required="Escriba su nombre." maxlength="100" class="form-control text-3 h-auto py-2" name="name" id="name" required>
									</div>
									<div class="form-group col-md-6">
										<label class="form-label mb-1 text-2">Correo electrónico</label>
										<input type="email" value="" data-msg-required="Escriba su correo electrónico." data-msg-email="Please enter a valid email address." maxlength="100" class="form-control text-3 h-auto py-2" name="email" id="email" required>
									</div>
								</div>
								<div class="row">
									<div class="form-group col-md-12">
										<label class="form-label mb-1 text-2">Tema</label>
										<select data-msg-required="Entre su tema." class="form-control text-3 h-auto py-2" name="subject" id="subject" required>
											<option value="">...</option>
											<option value="Option 1">Interes por obtener el SIE</option>
											<option value="Option 2">Soporte técnico a clientes</option>
											<option value="Option 3">Otro</option>
										</select>
									</div>
								</div>
								<div class="row">
									<div class="form-group col-md-6">
										
										<div class="form-check form-check-inline">
											<label class="form-check-label">
												<input class="form-check-input" name="checkboxes[]" type="checkbox" data-msg-required="Please select at least one option." id="inlineCheckbox1" value="option1"> Soy cliente SIE
											</label>
										</div>
										
									</div>
									
								</div>

								<div class="row">
									<div class="form-group col-md-12 mb-4">
										<label class="form-label mb-1 text-2">Mensaje</label>
										<textarea maxlength="5000" data-msg-required="Entrar su mensaje." rows="6" class="form-control text-3 h-auto py-2" name="message" id="message" required></textarea>
									</div>
								</div>
								<div class="row">
									<div class="form-group col-md-12 mb-0">
										<label class="form-label mb-1 text-2">Soy humano</label>
									</div>
								</div>
								<div class="row pt-2">
									<div class="form-group col-md-4">
										<div class="captcha form-control text-3 h-auto p-0">
											<div class="captcha-image">
												<?php
												//echo '<img id="captcha-image" src="' . "php/simple-php-captcha/simple-php-captcha.php/" . $_SESSION['captcha']['image_src'] . '" alt="CAPTCHA code">';
												?>
											</div>
											<div class="captcha-refresh">
												<a href="#" id="refreshCaptcha"><i class="fas fa-sync"></i></a>
											</div>
										</div>
									</div>
									<div class="form-group col-md-8">
										<input type="text" value="" maxlength="6" data-msg-captcha="Wrong verification code." data-msg-required="Escriba el texto de la imagen." placeholder="Escriba el texto de la imagen." class="form-control text-3 h-auto py-2 form-control-lg captcha-input" name="captcha" id="captcha" required>
									</div>
								</div>
								<div class="row">
									<div class="form-group col-md-12">
										<hr>
									</div>
								</div>
								<div class="row">
									<div class="form-group col-md-12 mb-5">
										<input type="submit" id="contactFormSubmit" value="Enviar mensaje" class="btn btn-primary btn-modern pull-right" data-loading-text="Loading...">
									</div>
								</div>
							</form>

						</div>
						<div class="col-lg-5">

							<div class="overflow-hidden mb-1">
								<h4 class="text-primary mb-0 appear-animation" data-appear-animation="maskUp" data-appear-animation-delay="200">Obten el <strong>SIE</strong></h4>
							</div>
							<div class="overflow-hidden mb-3">
								<p class="lead text-4 mb-0 appear-animation" data-appear-animation="maskUp" data-appear-animation-delay="400">El sie es un sistema informático para la administración escolar, administrativa y académica para las instituciones de educación superior.</p>
							</div>
							<div class="overflow-hidden">
								<p class="mb-0 appear-animation" data-appear-animation="maskUp" data-appear-animation-delay="600">Uno de los principios del S.I.E es la adaptabilidad a procesos académicos institucionales.</p>
							</div>

							<div class="appear-animation" data-appear-animation="fadeInUpShorter" data-appear-animation-delay="800">
								<h4 class="text-primary pt-5">Nuestra <strong>Oficina</strong></h4>
								<ul class="list list-icons list-icons-style-3 mt-2">
									<li><i class="fas fa-map-marker-alt top-6"></i> <strong>Address:</strong> Cd. industrial av.cobre</li>
									<li><i class="fas fa-phone top-6"></i> <strong>Phone:</strong> 9931810654</li>
									<li><i class="fas fa-envelope top-6"></i> <strong>Email:</strong> <a href="info@esie.mx">info@esie.mx</a></li>
								</ul>

								

								<h4 class="text-primary pt-5">Servicios <strong>Horarios</strong></h4>
								<ul class="list list-icons list-dark mt-2">
									<li><i class="far fa-clock top-6"></i> Lun-Vie: 8:30 am to 5:00 pm</li>
									<li><i class="far fa-clock top-6"></i> Sabado: 9:30 am to 1:00 pm</li>
									<li><i class="far fa-clock top-6"></i> Domingo: Cerrado</li>
								</ul>
							</div>

						</div>

					</div>

				</div>