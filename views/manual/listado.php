<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel app\models\search\ManualSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Manuals';
$this->params['breadcrumbs'][] = ['label' => 'panel', 'url' => ['/site/dashboard']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="container">
   <div class="row py">
<div class="manual-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Manual', ['create'], ['class' => 'btn btn-success']) ?>
        <?= Html::a('Vista Cuadros', ['/manual/index'], ['class' => 'btn btn-secondary']) ?>
    </p>

    <?php Pjax::begin(); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'IDManual',
            'codigo',
            'nombre',
            'identificador',
            'descripcion:ntext',
            //'costo',
            //'fkCategoria',
            //'fkSubcategoria',
            //'fkTipo',
            //'fkAutor',
            //'visitas',
            //'foto',
            //'votos',
            //'fkStatus',
            //'created_at',
            //'updated_at',
            //'fkUser',
            //'like',
            //'temario:ntext',
            //'fkSeccion',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

    <?php Pjax::end(); ?>

</div>
</div>
</div>