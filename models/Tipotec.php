<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%tipotec}}".
 *
 * @property int $IDTipoTec
 * @property string $nomcorto
 * @property string $nombre
 *
 * @property Clientes[] $clientes
 */
class Tipotec extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%tipotec}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nomcorto', 'nombre'], 'required'],
            [['nomcorto'], 'string', 'max' => 5],
            [['nombre'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'IDTipoTec' => 'Id Tipo Tec',
            'nomcorto' => 'Nomcorto',
            'nombre' => 'Nombre',
        ];
    }

    /**
     * Gets query for [[Clientes]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\ClientesQuery
     */
    public function getClientes()
    {
        return $this->hasMany(Clientes::className(), ['FKTipoTec' => 'IDTipoTec']);
    }

    /**
     * {@inheritdoc}
     * @return \app\models\query\TipotecQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \app\models\query\TipotecQuery(get_called_class());
    }
}
