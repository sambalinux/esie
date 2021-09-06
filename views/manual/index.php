<?php

/* @var $this yii\web\View */
use yii\bootstrap4\Breadcrumbs;
use yii\helpers\Html;
use app\components\adminManuales;


$this->title = 'Manuals';
$this->params['breadcrumbs'][] = ['label' => 'panel', 'url' => ['/site/dashboard']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="container">
   <div class="row py">
<div class="manual-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Nuevo Manual', ['create'], ['class' => 'btn btn-success']) ?>
        <?= Html::a('Vista Listado', ['/manual/listado'], ['class' => 'btn btn-secondary']) ?>
        
    </p>

    <div class="container py-4">
            <div class="row">
                <div class="col">
                    <div class="blog-posts">
                    <div class="row">
                        <?php echo adminManuales::widget(); ?>
                    </div>
                    </div>
				</div>
    		</div>
	</div>


</div>
</div>




							

									
