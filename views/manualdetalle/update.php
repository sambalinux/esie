<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Manualdetalle */

$this->title = 'Update Manualdetalle: ' . $model->IDManualDetalle;
$this->params['breadcrumbs'][] = ['label' => 'panel', 'url' => ['/site/dashboard']];
$this->params['breadcrumbs'][] = ['label' => 'Manualdetalles', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->IDManualDetalle, 'url' => ['view', 'id' => $model->IDManualDetalle]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="container">
   <div class="row py">
<div class="manualdetalle-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
    </div>
    </div>