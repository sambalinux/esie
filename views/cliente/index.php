<?php

use yii\helpers\Html;
use kartik\grid\GridView;
use app\components\Util;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\ClienteSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Clientes';
$this->params['breadcrumbs'][] = ['label' => 'panel', 'url' => ['/site/dashboard']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="container">
<div class="row py">

<div class="cliente-index">
  

    <?php 
        $gridColumns1 = [
            'id'=>[
                'attribute'=>'CveCentroTra',
                 'header'=>'Cve Centro Trabajo',
                 'value'=>'CveCentroTra',
                 'vAlign'=>'middle',
                 'hAlign'=>'middle',
                 'width'=>'20%'
             ],
             'create_at'=>[
                'attribute'=>'ncorto',
                 'header'=>'Nombre corto',
                 'value'=>'ncorto',
                 'vAlign'=>'middle',
                 'hAlign'=>'middle',
                 'width'=>'20%'
             ],
            'activo'=>[
                'attribute' => 'activo',
                'content' => function($model){
                    return html::tag('span', 
                    Util::estatusCliente($model->activo) ? 'Activo':'Inactivo',[
                        'class'=> Util::estatusCliente($model->activo) ? 'badge bg-success': 'badge bg-danger'
                    ]);
                },
                'width'=>'20%'
            ],
            'img'=>[
                 'attribute'=>'img',
                 'header'=>'Imagen',
                 'value'=>'img',
                 'content' => function($model){
                    /** @var \models\cliente $cliente */
                    return Html::img($model->getImageUrl(),['style'=>'width:100px']);
                }
            ],
          
           
                    ['class' => 'yii\grid\ActionColumn'],
            
        ];
    ?>  
    <?=    GridView::widget([
            'dataProvider'=> $dataProvider,
            'filterModel' => $searchModel,
            'columns' => $gridColumns1,
            'responsive'=>true,
            'hover'=>true,
            'bordered'=>true,
            'responsive'=>true,
            'resizableColumns'=>true,
            'headerRowOptions' => ['class' => 'kartik-sheet-style'],
            'rowOptions' => ['style'=>'font-size: .9em;color:#000000;'],
            'panel' => [
                        'heading'=>'<h3 style="color:white;text-align:center">CLIENTES</h3>',
                        'type'=> GridView::TYPE_PRIMARY,
                        'before'=>Html::a('<i class="glyphicon glyphicon-plus"></i> Nuevo', ['create'], ['class' => 'btn btn-success']),
                        //'after'=>Html::a('<i class="glyphicon glyphicon-repeat"></i> Reset Grid', ['index'], ['class' => 'btn btn-info']),
                        //'footer'=>true,
                        //'heading'=>true,
                        //'before'=>true,
                    ],
                    
         'pjax'=>true,
         
                       //'showPageSummary' => true
        ]);
    ?>
 

</div>
</div>
</div>
