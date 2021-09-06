<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%manualarchivo}}".
 *
 * @property int $fkManual
 * @property int $fkArchivo
 *
 * @property Manual $fkManual0
 * @property Archivo $fkArchivo0
 */
class Manualarchivo extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%manualarchivo}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['fkManual', 'fkArchivo'], 'required'],
            [['fkManual', 'fkArchivo'], 'integer'],
            [['fkManual', 'fkArchivo'], 'unique', 'targetAttribute' => ['fkManual', 'fkArchivo']],
            [['fkManual'], 'exist', 'skipOnError' => true, 'targetClass' => Manual::className(), 'targetAttribute' => ['fkManual' => 'IDManual']],
            [['fkArchivo'], 'exist', 'skipOnError' => true, 'targetClass' => Archivo::className(), 'targetAttribute' => ['fkArchivo' => 'IDArchivo']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'fkManual' => 'Fk Manual',
            'fkArchivo' => 'Fk Archivo',
        ];
    }

    /**
     * Gets query for [[FkManual0]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\ManualQuery
     */
    public function getFkManual0()
    {
        return $this->hasOne(Manual::className(), ['IDManual' => 'fkManual']);
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
     * {@inheritdoc}
     * @return \app\models\query\ManualarchivoQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \app\models\query\ManualarchivoQuery(get_called_class());
    }
}
