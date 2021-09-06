<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Tiposmodulo */

$this->title = 'Update Tiposmodulo: ' . $model->IDTipoMod;
$this->params['breadcrumbs'][] = ['label' => 'panel', 'url' => ['/site/dashboard']];
$this->params['breadcrumbs'][] = ['label' => 'Tiposmodulos', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->IDTipoMod, 'url' => ['view', 'id' => $model->IDTipoMod]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="container">
   <div class="row py">
<div class="tiposmodulo-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
    </div>
    </div>