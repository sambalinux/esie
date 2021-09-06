<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Manualtipo */

$this->title = $model->IDManualTipo;
$this->params['breadcrumbs'][] = ['label' => 'panel', 'url' => ['/site/dashboard']];
$this->params['breadcrumbs'][] = ['label' => 'Manualtipos', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="container">
   <div class="row py">
<div class="manualtipo-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->IDManualTipo], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->IDManualTipo], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'IDManualTipo',
            'nombre',
        ],
    ]) ?>

</div>
    </div>
    </div>