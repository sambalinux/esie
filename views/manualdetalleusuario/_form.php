<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Manualdetalleusuario */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="manualdetalleusuario-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'fkManuelDetalleUsuario')->textInput() ?>

    <?= $form->field($model, 'fkUser')->textInput() ?>

    <?= $form->field($model, 'contador')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
