<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\search\ManualsubcategoriaSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="manualsubcategoria-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'options' => [
            'data-pjax' => 1
        ],
    ]); ?>

    <?= $form->field($model, 'IDSubCat') ?>

    <?= $form->field($model, 'nombre') ?>

    <?= $form->field($model, 'fkcategoria') ?>

    <?= $form->field($model, 'fktiposmodulos') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
