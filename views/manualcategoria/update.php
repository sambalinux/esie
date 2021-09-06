<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Manualcategoria */

$this->title = 'Update Manualcategoria: ' . $model->IDCategoria;
$this->params['breadcrumbs'][] = ['label' => 'panel', 'url' => ['/site/dashboard']];
$this->params['breadcrumbs'][] = ['label' => 'Manualcategorias', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->IDCategoria, 'url' => ['view', 'id' => $model->IDCategoria]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="container">
   <div class="row py">
<div class="manualcategoria-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
    </div>
    </div>
