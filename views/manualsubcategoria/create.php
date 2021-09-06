<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Manualsubcategoria */

$this->title = 'Create Manualsubcategoria';
$this->params['breadcrumbs'][] = ['label' => 'panel', 'url' => ['/site/dashboard']];
$this->params['breadcrumbs'][] = ['label' => 'Manualsubcategorias', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="container">
   <div class="row py">
<div class="manualsubcategoria-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
    </div>
    </div>