<?php
namespace app\Components;
use yii\helpers\Html;

use Yii;
Class Util {

    public static function estatusCliente($estatus){
        if($estatus=='V'){
            $valorRetorno = 1;
        }else{
            $valorRetorno = 0;
        }
        return $valorRetorno;
    }

     //borra archivo despues de subir nueva imagen
     public static function borrarArchivo($nombre){
        $file = Yii::$app->basePath . '/web/uploads/institutos/'. $nombre;
        if (empty($file) || !file_exists($file)) {
            return false;
        }
        if (!unlink($file)) {
            return false;
        }
        return true;
    }
}
?>