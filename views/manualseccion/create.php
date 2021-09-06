<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Manualseccion */

$this->title = 'Create Manualseccion';
$this->params['breadcrumbs'][] = ['label' => 'panel', 'url' => ['/site/dashboard']];
$this->params['breadcrumbs'][] = ['label' => 'Manualseccions', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="container">
   <div class="row py">
<div class="manualseccion-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
    </div>
    </div>