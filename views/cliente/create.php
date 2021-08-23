<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Cliente */

$this->title = 'Create Cliente';
$this->params['breadcrumbs'][] = ['label' => 'Clientes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="container">
                <div class="row py-4">

<!--<div class="cliente-create">-->

<div class="card mb-4">
    <div class="card-body">
        <div class="row">
        <div class="col">
    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
    </div>
    </div>
    </div>
    </div>

</div>
</div>
<!--</div>-->
