<?php

use yii\helpers\Html;
use yii\helpers\ArrayHelper;
//use yii\widgets\ActiveForm;
use yii\bootstrap4\ActiveForm;
use app\models\Tipotec;

/* @var $this yii\web\View */
/* @var $model app\models\Cliente */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="cliente-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'CveCentroTra')->textInput(['maxlength' => true]) ?>
    <?php //= $form->field($model, 'FKTipoTec')->textInput(['maxlength' => true]) ?>
    
    <?= $form->field($model, 'FKTipoTec')->dropDownList(
        ArrayHelper::map(Tipotec::find()->all(),
        'IDTipoTec','nomcorto'),
        ['prompt'=>'Seleccione Tipo Tec']); ?>
 

    <?= $form->field($model, 'nombre')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'ncorto')->textInput(['maxlength' => true]) ?>

    <?php /*= $form->field($model, 'fkUser')->textInput(['maxlength' => true]) */?>

    <?= $form->field($model, 'activo')->textInput(['maxlength' => true]) ?>

    
    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
