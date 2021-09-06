<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%manualtipo}}".
 *
 * @property int $IDManualTipo
 * @property string|null $nombre
 *
 * @property Manual[] $manuals
 */
class Manualtipo extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%manualtipo}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nombre'], 'string', 'max' => 30],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'IDManualTipo' => 'Id Manual Tipo',
            'nombre' => 'Nombre',
        ];
    }

    /**
     * Gets query for [[Manuals]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\ManualQuery
     */
    public function getManuals()
    {
        return $this->hasMany(Manual::className(), ['fkTipo' => 'IDManualTipo']);
    }

    /**
     * {@inheritdoc}
     * @return \app\models\query\ManualtipoQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \app\models\query\ManualtipoQuery(get_called_class());
    }
}
