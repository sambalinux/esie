<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Manualdetalleusuario */

$this->title = $model->fkManuelDetalleUsuario;
$this->params['breadcrumbs'][] = ['label' => 'panel', 'url' => ['/site/dashboard']];
$this->params['breadcrumbs'][] = ['label' => 'Manualdetalleusuarios', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="container">
   <div class="row py">
<div class="manualdetalleusuario-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'fkManuelDetalleUsuario' => $model->fkManuelDetalleUsuario, 'fkUser' => $model->fkUser], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'fkManuelDetalleUsuario' => $model->fkManuelDetalleUsuario, 'fkUser' => $model->fkUser], [
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
            'fkManuelDetalleUsuario',
            'fkUser',
            'contador',
        ],
    ]) ?>

</div>
    </div>
    </div>