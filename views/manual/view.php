<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Manual */

$this->title = $model->IDManual;
$this->params['breadcrumbs'][] = ['label' => 'panel', 'url' => ['/site/dashboard']];
$this->params['breadcrumbs'][] = ['label' => 'Manuals', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="container">
   <div class="row py">
<div class="manual-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->IDManual], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->IDManual], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'IDManual',
            'codigo',
            'nombre',
            'identificador',
            'descripcion:ntext',
            'costo',
            'fkCategoria',
            'fkSubcategoria',
            'fkTipo',
            'fkAutor',
            'visitas',
            'foto',
            'votos',
            'fkStatus',
            'created_at',
            'updated_at',
            'fkUser',
            'like',
            'temario:ntext',
            'fkSeccion',
        ],
    ]) ?>

</div>
    </div>
    </div>
    