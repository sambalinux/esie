<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Manual */

$this->title = 'Update Manual: ' . $model->IDManual;
$this->params['breadcrumbs'][] = ['label' => 'panel', 'url' => ['/site/dashboard']];
$this->params['breadcrumbs'][] = ['label' => 'Manuals', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->IDManual, 'url' => ['view', 'id' => $model->IDManual]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="container">
   <div class="row py">
<div class="manual-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
    </div>
    </div>