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
use itstructure\ckeditor\ckeditor;
use yii\helpers\Url;
/* @var $this yii\web\View */
/* @var $model app\models\Manual */
/* @var $form yii\widgets\ActiveForm */
$this->registerJsFile(
    'ckfinder/ckfinder.js',
    ['depends' => [\yii\web\JqueryAsset::class]]
);
?>
<script src="https://cdn.ckeditor.com/ckeditor5/12.3.1/classic/ckeditor.js"></script>
<!--<script src="http://esie.local/ckeditor/ckeditor.js'; ?>"></script>-->

<script type="text/javascript">
    function openKCFinder(field) {
     ClassicEditor.create( document.querySelector( '#editor' ), {
         ckfinder: {
             uploadUrl: '/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files&responseType=json'
         },
         toolbar: [ 'ckfinder', 'imageUpload']
         //toolbar: [ 'ckfinder', 'imageUpload', '|', 'heading', '|', 'bold', 'italic', '|', 'undo', 'redo' ]
     } )
     .catch( function( error ) {
         console.error( error );
     } );
    }

    function selectFileWithCKFinder( field ) {
        CKFinder.modal( {
            chooseFiles: true,
            width: 800,
            height: 600,
            onInit: function( finder ) {
                finder.on( 'files:choose', function( evt ) {
                    var file = evt.data.files.first();
                    //var output = document.getElementById( elementId );
                    field.value = file.getUrl();
                } );

                finder.on( 'file:choose:resizedImage', function( evt ) {
                    //var output = document.getElementById( elementId );
                    field.value = evt.data.resizedUrl;
                } );
            }
        } );
    }
</script>
<div class="manual-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'codigo')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'nombre')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'identificador')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'descripcion')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'costo')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'fkCategoria')->dropDownList(
        ArrayHelper::map(Manualcategoria::find()->all(),
        'IDCategoría','nombre'),
        ['prompt'=>'Seleccione una Categoría']); ?> 

    <?= $form->field($model, 'fkSubcategoria')->dropDownList(
        ArrayHelper::map(Manualsubcategoria::find()->all(),
        'IDSubCat','nombre'),
        ['prompt'=>'Seleccione una SubCategoría']); ?>

    <?= $form->field($model, 'fkTipo')->dropDownList(
        ArrayHelper::map(Manualtipo::find()->all(),
        'IDManualTipo','nombre'),
        ['prompt'=>'Seleccione Tipo de manual']); ?>

    <?php /*$form->field($model, 'fkAutor')->textInput() */?>

    <?php //= $form->field($model, 'visitas')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'foto')->textInput(['maxlength' => true, 'onClick' =>'javascript:selectFileWithCKFinder(this)']); ?>
    

    <?php //= $form->field($model, 'votos')->textInput() ?>

    <?= $form->field($model, 'fkStatus')->dropDownList(
        ArrayHelper::map(Status::find()->all(),
        'IDStatus','nombre'),
        ['prompt'=>'Seleccione Estatus']); ?>

    <?php //= $form->field($model, 'created_at')->textInput() ?>

    <?php //= $form->field($model, 'updated_at')->textInput() ?>

    <?php //= $form->field($model, 'fkUser')->textInput() ?>

    <?php //= $form->field($model, 'like')->textInput() ?>

    <?= $form->field($model, 'temario')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'fkSeccion')->dropDownList(
        ArrayHelper::map(Manualseccion::find()->all(),
        'IDSeccion','nombre'),
        ['prompt'=>'Seleccione Sección']); ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
