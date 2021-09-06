<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\Manual;
use app\models\Status;
use yii\helpers\ArrayHelper;


/* @var $this yii\web\View */
/* @var $model app\models\Manualdetalle */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="manualdetalle-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'codigo')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'fkManual')->dropDownList(
        ArrayHelper::map(Manual::find()->all(),
        'IDManual','nombre'),
        ['prompt'=>'Seleccione el manual']); ?>  

    <?= $form->field($model, 'numeroPaso')->textInput() ?>

    <?= $form->field($model, 'resumen')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'contenido')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'documento')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'fkStatus')->dropDownList(
        ArrayHelper::map(Status::find()->all(),
        'IDStatus','nombre'),
        ['prompt'=>'Seleccione Estatus']); ?>

    <?php //= $form->field($model, 'fkUser')->textInput() ?>

    <?php //= $form->field($model, 'visitas')->textInput() ?>

    <?= $form->field($model, 'nombre')->textInput(['maxlength' => true]) ?>

    <?php //= $form->field($model, 'vistoCompletamente')->textInput(['maxlength' => true]) ?>

    <?php //= $form->field($model, 'created_at')->textInput() ?>

    <?php //= $form->field($model, 'update_at')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
