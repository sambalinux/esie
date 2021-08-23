<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Tipotec */

$this->title = 'Update Tipotec: ' . $model->IDTipoTec;
$this->params['breadcrumbs'][] = ['label' => 'Tipotecs', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->IDTipoTec, 'url' => ['view', 'id' => $model->IDTipoTec]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="container">
                <div class="row py-4">

<div class="tipotec-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
</div>
</div>
