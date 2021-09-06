<?php

/* @var $this yii\web\View */
/* @var $name string */
/* @var $message string */
/* @var $exception Exception */

use yii\helpers\Html;

$this->title = $name;
?>
<div class="container">
   <div class="row py">
<div class="site-error">

    

    <div class="alert alert-danger">
        <?= nl2br(Html::encode($message)) ?>
    </div>
    <h1><?= Html::encode($this->title) ?></h1>

    <p>
       El error ocurrió mientras el servidor web procesaba su solicitud.
    </p>
    <p>
        Por favor contactenos, si piensas que es un error del servidor. Gracias.
    </p>

</div>
</div></div>