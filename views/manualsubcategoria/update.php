<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Manualsubcategoria */

$this->title = 'Update Manualsubcategoria: ' . $model->IDSubCat;
$this->params['breadcrumbs'][] = ['label' => 'panel', 'url' => ['/site/dashboard']];
$this->params['breadcrumbs'][] = ['label' => 'Manualsubcategorias', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->IDSubCat, 'url' => ['view', 'id' => $model->IDSubCat]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="container">
   <div class="row py">
<div class="manualsubcategoria-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
    </div>
    </div>