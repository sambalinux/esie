<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\widgets\Fileinput;
use yii\helpers\ArrayHelper;
use app\models\Manualcategoria;
use app\models\Manualsubcategoria;
use app\models\Manualtipo;
use app\models\Status;
use app\models\Manualseccion;
use yii\helpers\Url;
/* @var $this yii\web\View */
/* @var $model app\models\Manual */
/* @var $form yii\widgets\ActiveForm */
?>

</script>
<div class="manual-form">

    <?php $form = ActiveForm::begin(
        [
            'id' => 'contact-form',
            'class'=> 'contact-form form-style-3',
            'options'=>['enctype'=>'multipart/form-data',], 
        ]
    ); ?>
    <div class="row">
    <?= $form->field($model, 'codigo',
    [
        'template' => '
            <div class="form-group col-lg-2">
            <label class="form-label mb-1 text-2">Código</label>
                {input}
            </div>
            {error}',
        'inputOptions' => [
            'placeholder' => 'Código',
            'class'=>'form-control bg-color-primary text-3 h-auto py-2',
        ]
    ])->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'nombre',
    [
        'template' => '
            <div class="form-group col-lg-4">
            <label class="form-label mb-1 text-2">Nombre</label>
                {input}
            </div>
            {error}',
        'inputOptions' => [
            'placeholder' => 'Nombre',
            'class'=>'form-control text-3 h-auto py-2',
        ]]
    )->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'identificador',
    [
        'template' => '
            <div class="form-group col-lg-2">
            <label class="form-label mb-1 text-2">Identificador</label>
                {input}
            </div>
            {error}',
        'inputOptions' => [
            'placeholder' => 'Identificador',
            'class'=>'form-control text-3 h-auto py-2',
        ]]
    )->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'descripcion',
     [
        'template' => '
            <div class="form-group col-lg-8">
            <label class="form-label mb-1 text-2">Descripción</label>
                {input}
            </div>
            {error}',
        'inputOptions' => [
            'placeholder' => 'Descripción',
            'class'=>'form-control text-3 h-auto py-2',
        ]]
    )->textarea(['rows' => 6]) ?>


    <?php /*$form->field($model, 'fkAutor')->textInput() */?>

    <?php //= $form->field($model, 'visitas')->textInput(['maxlength' => true]) ?>
    <?php
            if ($model->foto!='') {
                echo "<h1>Imagen actual</h1>";
                echo Html::img($model->getImageUrl(),['style'=>'width:50%']);
            }    
        ?>

    <?php echo $form->field($model, 'imageFile',
     [
        'template' => '
            <div class="form-group col-lg-8">
            <label class="form-label mb-1 text-2">Foto del Manual</label>
                {input}
            </div>
            {error}',
        'inputOptions' => [
            'placeholder' => 'Foto de Manual',
            'class'=>'form-control text-3 h-auto py-2',
        ]]
    
    )->widget(
        FileInput::classname(), [
    'options' => ['accept' => 'image/*'],
    ]);?>
    

    <?php //= $form->field($model, 'votos')->textInput() ?>
    
    <?= $form->field($model, 'costo',
    [
        'template' => '
            <div class="form-group col-lg-3">
            <label class="form-label mb-1 text-2">Costo</label>
                {input}
            </div>
            {error}',
        'inputOptions' => [
            'placeholder' => 'Costo',
            'class'=>'form-control text-3 h-auto py-2',
        ]]
    )->textInput(['maxlength' => true]) ?>

<?= $form->field($model, 'fkCategoria',
    [
        'template' => '
        <div class="form-group col-lg-6">
        <label class="form-label mb-1 text-2"> Categoría</label>
            {input}
        </div>
        {error}',
        'inputOptions' => [
        'class'=>'form-select form-control h-auto',
        ]] 
    )->dropDownList(
        ArrayHelper::map(Manualcategoria::find()->all(),
        'IDCategoria','nombre'),
        ['prompt'=>'Seleccione una Categoría']); ?>

    <?= $form->field($model, 'fkSubcategoria',
    [
        'template' => '
        <div class="form-group col-lg-6">
        <label class="form-label mb-1 text-2"> SubCategoría</label>
            {input}
        </div>
        {error}',
        'inputOptions' => [
        'class'=>'form-select form-control h-auto',
        ]] 
    )->dropDownList(
        ArrayHelper::map(Manualsubcategoria::find()->all(),
        'IDSubCat','nombre'),
        ['prompt'=>'Seleccione una SubCategoría']); ?>

    <?= $form->field($model, 'fkTipo',
    [
        'template' => '
        <div class="form-group col-lg-6">
        <label class="form-label mb-1 text-2"> Tipo Manual</label>
            {input}
        </div>
        {error}',
        'inputOptions' => [
        'class'=>'form-select form-control h-auto',
        ]] 
    )->dropDownList(
        ArrayHelper::map(Manualtipo::find()->all(),
        'IDManualTipo','nombre'),
        ['prompt'=>'Seleccione Tipo de manual']); ?>

    <?= $form->field($model, 'fkStatus',
    [
        'template' => '
        <div class="form-group col-lg-6">
        <label class="form-label mb-1 text-2"> Estatus del manual</label>
            {input}
        </div>
        {error}',
        'inputOptions' => [
        'class'=>'form-select form-control h-auto py-2',
        ]]
    )->dropDownList(
        ArrayHelper::map(Status::find()->all(),
        'IDStatus','nombre'),
        ['prompt'=>'Seleccione Estatus']); ?>

    <?php //= $form->field($model, 'created_at')->textInput() ?>

    <?php //= $form->field($model, 'updated_at')->textInput() ?>

    <?php //= $form->field($model, 'fkUser')->textInput() ?>

    <?php //= $form->field($model, 'like')->textInput() ?>

    <?= $form->field($model, 'temario',
    [
        'template' => '
        <div class="form-group col-lg-8">
        <label class="form-label mb-1 text-2"> Temario</label>
            {input}
        </div>
        {error}',
        'inputOptions' => [
        'class'=>'form-select form-control h-auto',
        ]]
    
    )->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'fkSeccion',
    [
        'template' => '
        <div class="form-group col-lg-6">
        <label class="form-label mb-1 text-2"> Sección en que aparecerá</label>
            {input}
        </div>
        {error}',
        'inputOptions' => [
        'class'=>'form-control bg-color-primary text-3 h-auto py-2',
        ]]
    )->dropDownList(
        ArrayHelper::map(Manualseccion::find()->all(),
        'IDSeccion','nombre'),
        ['prompt'=>'Seleccione Sección']); ?>


    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
