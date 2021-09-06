<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%manualarchivodetalle}}".
 *
 * @property int $fkArchivo
 * @property int $fkManualDetalle
 *
 * @property Archivo $fkArchivo0
 * @property Manualdetalle $fkManualDetalle0
 */
class Manualarchivodetalle extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%manualarchivodetalle}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['fkArchivo', 'fkManualDetalle'], 'required'],
            [['fkArchivo', 'fkManualDetalle'], 'integer'],
            [['fkArchivo', 'fkManualDetalle'], 'unique', 'targetAttribute' => ['fkArchivo', 'fkManualDetalle']],
            [['fkArchivo'], 'exist', 'skipOnError' => true, 'targetClass' => Archivo::className(), 'targetAttribute' => ['fkArchivo' => 'IDArchivo']],
            [['fkManualDetalle'], 'exist', 'skipOnError' => true, 'targetClass' => Manualdetalle::className(), 'targetAttribute' => ['fkManualDetalle' => 'IDManualDetalle']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'fkArchivo' => 'Fk Archivo',
            'fkManualDetalle' => 'Fk Manual Detalle',
        ];
    }

    /**
     * Gets query for [[FkArchivo0]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\ArchivoQuery
     */
    public function getFkArchivo0()
    {
        return $this->hasOne(Archivo::className(), ['IDArchivo' => 'fkArchivo']);
    }

    /**
     * Gets query for [[FkManualDetalle0]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\ManualdetalleQuery
     */
    public function getFkManualDetalle0()
    {
        return $this->hasOne(Manualdetalle::className(), ['IDManualDetalle' => 'fkManualDetalle']);
    }

    /**
     * {@inheritdoc}
     * @return \app\models\query\ManualarchivodetalleQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \app\models\query\ManualarchivodetalleQuery(get_called_class());
    }
}
