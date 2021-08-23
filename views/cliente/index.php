<?php

use yii\helpers\Html;
use yii\grid\GridView;
use app\components\Util;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\ClienteSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Clientes';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="container">
                <div class="row py">

<div class="cliente-index">
    <p>
        <?= Html::a('Create Cliente', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'IDCliente',
            'CveCentroTra',
            'FKTipoTec.nombre',
            'nombre',
            'ncorto',
            
            [
                'attribute' => 'activo',
                'content' => function($model){
                    return html::tag('span', 
                    Util::estatusCliente($model->activo) ? 'Activo':'Inactivo',[
                        'class'=> Util::estatusCliente($model->activo) ? 'badge bg-success': 'badge bg-danger'
                    ]);
                }
            ],
            [
                'attribute' => 'img',
                'content' => function($model){
                    /** @var \models\cliente $cliente */
                    return Html::img($model->getImageUrl(),['style'=>'width:100px']);
                }
            ],
            'create_at:datetime',
            'update_at:datetime',
            'fkUser',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>


</div>
</div>
</div>
