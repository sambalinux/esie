<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%manualseccion}}".
 *
 * @property int $IDSeccion
 * @property string $nombre
 * @property string|null $ubicacion
 *
 * @property Manual[] $manuals
 */
class Manualseccion extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%manualseccion}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nombre'], 'required'],
            [['ubicacion'], 'string'],
            [['nombre'], 'string', 'max' => 100],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'IDSeccion' => 'Id Seccion',
            'nombre' => 'Nombre',
            'ubicacion' => 'Ubicacion',
        ];
    }

    /**
     * Gets query for [[Manuals]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\ManualQuery
     */
    public function getManuals()
    {
        return $this->hasMany(Manual::className(), ['fkSeccion' => 'IDSeccion']);
    }

    /**
     * {@inheritdoc}
     * @return \app\models\query\ManualseccionQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \app\models\query\ManualseccionQuery(get_called_class());
    }
}
