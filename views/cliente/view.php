<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use app\components\Util;
/* @var $this yii\web\View */
/* @var $model app\models\Cliente */

$this->title = $model->IDCliente;
$this->params['breadcrumbs'][] = ['label' => 'Clientes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="container">
                <div class="row py-4">

<div class="cliente-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->IDCliente], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->IDCliente], [
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
            'IDCliente',
            'CveCentroTra',
            'FKTipoTec',
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
            'create_at:datetime',
            'update_at:datetime',
            'fkUser',
            
            
        ],
    ]) ?>
    <?php
            if ($model->img!='') {
                echo "<h1>Imagen actual</h1>";
                echo Html::img($model->getImageUrl(),['style'=>'width:50%']);
            }    
        ?>
</div>
</div>
</div>
