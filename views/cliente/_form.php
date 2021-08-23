<?php

use yii\helpers\Html;

use yii\helpers\ArrayHelper;
//use yii\widgets\ActiveForm;
use kartik\widgets\Fileinput;
//use yii\bootstrap4\ActiveForm;
use app\models\Tipotec;
use kartik\widgets\ActiveForm;


/* @var $this yii\web\View */
/* @var $model app\models\Cliente */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="cliente-form">

    <?php $form = ActiveForm::begin(
        [
            'id' => 'contact-form',
            'class'=> 'contact-form form-style-3',
            'options'=>['enctype'=>'multipart/form-data',], 
        ]
    ); ?>

    <?= $form->field($model, 'CveCentroTra',
    [
        'template' => '
            <div class="form-group col-lg-6">
            <label class="form-label mb-1 text-2">Nombre</label>
                {input}
            </div>
            {error}',
        'inputOptions' => [
            'placeholder' => 'Cve Centro de trabajo',
            'class'=>'form-control text-3 h-auto py-2',
        ]])->textInput(['maxlength' => true]) ?>
    
    
    <?= $form->field($model, 'FKTipoTec',[
        'template' => '
        <div class="form-group col-lg-6">
        <label class="form-label mb-1 text-2"> Tipo tec</label>
            {input}
        </div>
        {error}',
        'inputOptions' => [
        'class'=>'form-select form-control h-auto',
        ]])->dropDownList(
        ArrayHelper::map(Tipotec::find()->all(),
        'IDTipoTec','nomcorto'),
        ['prompt'=>'Seleccione Tipo Tec']); ?>
 

    <?= $form->field($model, 'nombre',
    [
        'template' => '
            <div class="form-group col-lg-6">
            <label class="form-label mb-1 text-2">Nombre</label>
                {input}
            </div>
            {error}',
        'inputOptions' => [
            'placeholder' => 'Nombre ...',
            'class'=>'form-control text-3 h-auto py-2',
        ]])->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'ncorto',
    [
        'template' => '
            <div class="form-group col-lg-6">
            <label class="form-label mb-1 text-2">Nombre</label>
                {input}
            </div>
            {error}',
        'inputOptions' => [
            'placeholder' => 'Nombre Corto',
            'class'=>'form-control text-3 h-auto py-2',
        ]])->textInput(['maxlength' => true]) ?>
    

    
    <?php
    echo $form->field($model,'activo',[
        'template' => '
        <div class="form-group col-lg-6">
        <label class="form-label mb-1 text-2"> Tipo tec</label>
            {input}
        </div>
        {error}',
        'inputOptions' => [
        'class'=>'form-select form-control h-auto',
        ]])->dropDownList(['V'=>'Vigente','F'=>'No Vigente'],['prompt'=>'Seleccione una opción']);?>

        <?php
            if ($model->img!='') {
                echo "<h1>Imagen actual</h1>";
                echo Html::img($model->getImageUrl(),['style'=>'width:50%']);
            }    
        ?>

         <?php echo $form->field($model, 'imageFile')->widget(
             FileInput::classname(), [
            'options' => ['accept' => 'image/*'],
            ]);?>
 

        <!-- Botón para subir archivos -->
        <?php /* echo FileInput::widget([
                        'id'=>'image',
                        'name'=>'image',
                        'model' => 'image',
                        'options' => ['accept' => 'image/*'],
                        'pluginOptions' => [
                            //'uploadUrl' => Url::to(['/archivo/subir-archivo']),
                            'showPreview' => true,
                            'showCaption' => true,
                            'showRemove' => true,
                            'showUpload' => false,
                            'fileActionSettings'=>[
                                'showRemove' => true, //quita el icono de borrar en el preview
                                'showUpload' => false, //quita el icono de subir en el preview
                                'showZoom'=>true,
                                ],
                            'maxFileCount' => 1,
                            'initialPreview'=>[
                                //"http://webservice.dev/web".$ruta,
                                ],
                            'allowedFileExtensions'=>['jpg','gif','png'], //solo acepta pdf
                            'maxFileSize'=> '3024',           //tamaño maximo de carga 200 default
                        ],
                       
                    ]);*/
        ?>        

    
    

    <?= $form->field($model, 'url',
        [
            'template' => '
                <div class="form-group col-lg-6">
                <label class="form-label mb-1 text-2">Url</label>
                    {input}
                </div>
                {error}',
            'inputOptions' => [
                'placeholder' => 'Https://www....',
                'class'=>'form-control text-3 h-auto py-2',
            ]])->textInput(['maxlength' => true]) ?>
    
    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>
 
</div>
