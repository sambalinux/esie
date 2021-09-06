<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel app\models\search\ManualdetalleusuarioSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Manualdetalleusuarios';
$this->params['breadcrumbs'][] = ['label' => 'panel', 'url' => ['/site/dashboard']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="container">
   <div class="row py">
<div class="manualdetalleusuario-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Manualdetalleusuario', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php Pjax::begin(); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'fkManuelDetalleUsuario',
            'fkUser',
            'contador',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

    <?php Pjax::end(); ?>

</div>
</div>
</div>