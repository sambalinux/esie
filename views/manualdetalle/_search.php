<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\search\ManualdetalleSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="manualdetalle-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'options' => [
            'data-pjax' => 1
        ],
    ]); ?>

    <?= $form->field($model, 'IDManualDetalle') ?>

    <?= $form->field($model, 'codigo') ?>

    <?= $form->field($model, 'fkManual') ?>

    <?= $form->field($model, 'numeroPaso') ?>

    <?= $form->field($model, 'resumen') ?>

    <?php // echo $form->field($model, 'contenido') ?>

    <?php // echo $form->field($model, 'documento') ?>

    <?php // echo $form->field($model, 'fkStatus') ?>

    <?php // echo $form->field($model, 'fkUser') ?>

    <?php // echo $form->field($model, 'visitas') ?>

    <?php // echo $form->field($model, 'nombre') ?>

    <?php // echo $form->field($model, 'vistoCompletamente') ?>

    <?php // echo $form->field($model, 'created_at') ?>

    <?php // echo $form->field($model, 'update_at') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
