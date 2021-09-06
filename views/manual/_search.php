<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\search\ManualSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="manual-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'options' => [
            'data-pjax' => 1
        ],
    ]); ?>

    <?= $form->field($model, 'IDManual') ?>

    <?= $form->field($model, 'codigo') ?>

    <?= $form->field($model, 'nombre') ?>

    <?= $form->field($model, 'identificador') ?>

    <?= $form->field($model, 'descripcion') ?>

    <?php // echo $form->field($model, 'costo') ?>

    <?php // echo $form->field($model, 'fkCategoria') ?>

    <?php // echo $form->field($model, 'fkSubcategoria') ?>

    <?php // echo $form->field($model, 'fkTipo') ?>

    <?php // echo $form->field($model, 'fkAutor') ?>

    <?php // echo $form->field($model, 'visitas') ?>

    <?php // echo $form->field($model, 'foto') ?>

    <?php // echo $form->field($model, 'votos') ?>

    <?php // echo $form->field($model, 'fkStatus') ?>

    <?php // echo $form->field($model, 'created_at') ?>

    <?php // echo $form->field($model, 'updated_at') ?>

    <?php // echo $form->field($model, 'fkUser') ?>

    <?php // echo $form->field($model, 'like') ?>

    <?php // echo $form->field($model, 'temario') ?>

    <?php // echo $form->field($model, 'fkSeccion') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
