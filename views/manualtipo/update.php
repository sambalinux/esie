<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Manualtipo */

$this->title = 'Update Manualtipo: ' . $model->IDManualTipo;
$this->params['breadcrumbs'][] = ['label' => 'panel', 'url' => ['/site/dashboard']];
$this->params['breadcrumbs'][] = ['label' => 'Manualtipos', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->IDManualTipo, 'url' => ['view', 'id' => $model->IDManualTipo]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="container">
   <div class="row py">
<div class="manualtipo-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
    </div>
    </div>