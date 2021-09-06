<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use app\models\Manual;
\yii\web\YiiAsset::register($this);
?>

<div class="container">
   <div class="row py">
<div class="manualdetalle-view">
    <div class="col-lg-6">
				<h1><?php echo $model->nombre; ?></h1>
               
				<hr class="solid my-4">
    </div>
<!--Video -->
<div class="container pt-2 pb-4">
            <div class="row pb-4 mb-2">
                <div class="col-md-8 mb-4 mb-md-0 appear-animation" data-appear-animation="bounceInRight" data-appear-animation-delay="300">
				<div class="ratio ratio-16x9">
					<iframe src="https://player.vimeo.com/video/<?= $model->codigo;?>?title=0&byline=0&portrait=0&speed=0&badge=0&autopause=0&player_id=0&app_id=58479&h=b124276d09/embed"  allow="autoplay; fullscreen; picture-in-picture" webkitallowfullscreen mozallowfullscreen allowfullscreen frameborder="0" style="position:absolute;top:0;left:0;width:100%;height:100%;"></iframe>
				</div>	

                <hr class="solid my-5 appear-animation" data-appear-animation="fadeIn" data-appear-animation-delay="1000">
                </div>
                <div class="col-md-4">
                    <div class="overflow-hidden">
                        <h2 class="text-color-dark font-weight-normal text-4 mb-0 appear-animation" data-appear-animation="maskUp" data-appear-animation-delay="600"> <strong class="font-weight-extra-bold">Manual<nav></nav></strong></h2>
                    </div>
                    <p class="appear-animation" data-appear-animation="fadeInUpShorter" data-appear-animation-delay="800"> <?=$model->fkManual0->nombre;?> </p>
                    <p class="appear-animation" data-appear-animation="fadeInUpShorter" data-appear-animation-delay="800"> <?=$model->codigo;?></p>
                    <p class="appear-animation" data-appear-animation="fadeInUpShorter" data-appear-animation-delay="800"> <?=$model->resumen;?></p>
                    <p class="appear-animation" data-appear-animation="fadeInUpShorter" data-appear-animation-delay="800"> Visitas: <?=$model->visitas;?></p>
                </div>
            </div>



</div>
    </div>
    </div>