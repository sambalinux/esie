<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%status}}".
 *
 * @property int $IDStatus
 * @property string|null $nombre
 * @property int|null $prioridad
 *
 * @property Manual[] $manuals
 */
class Status extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%status}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['prioridad'], 'integer'],
            [['nombre'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'IDStatus' => 'Id Status',
            'nombre' => 'Nombre',
            'prioridad' => 'Prioridad',
        ];
    }

    /**
     * Gets query for [[Manuals]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\ManualQuery
     */
    public function getManuals()
    {
        return $this->hasMany(Manual::className(), ['fkStatus' => 'IDStatus']);
    }

    /**
     * {@inheritdoc}
     * @return \app\models\query\StatusQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \app\models\query\StatusQuery(get_called_class());
    }
}
