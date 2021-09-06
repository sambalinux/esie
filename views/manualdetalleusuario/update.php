<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Manualdetalleusuario */

$this->title = 'Update Manualdetalleusuario: ' . $model->fkManuelDetalleUsuario;
$this->params['breadcrumbs'][] = ['label' => 'panel', 'url' => ['/site/dashboard']];
$this->params['breadcrumbs'][] = ['label' => 'Manualdetalleusuarios', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->fkManuelDetalleUsuario, 'url' => ['view', 'fkManuelDetalleUsuario' => $model->fkManuelDetalleUsuario, 'fkUser' => $model->fkUser]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="container">
   <div class="row py">
<div class="manualdetalleusuario-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
    </div>
    </div>