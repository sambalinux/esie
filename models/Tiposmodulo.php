<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%tiposmodulo}}".
 *
 * @property int $IDTipoMod
 * @property string|null $nombre
 *
 * @property Manualsubcategoria[] $manualsubcategorias
 */
class Tiposmodulo extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%tiposmodulo}}';
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
            'IDTipoMod' => 'Id Tipo Mod',
            'nombre' => 'Nombre',
        ];
    }

    /**
     * Gets query for [[Manualsubcategorias]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\ManualsubcategoriaQuery
     */
    public function getManualsubcategorias()
    {
        return $this->hasMany(Manualsubcategoria::className(), ['fktiposmodulos' => 'IDTipoMod']);
    }

    /**
     * {@inheritdoc}
     * @return \app\models\query\TiposmoduloQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \app\models\query\TiposmoduloQuery(get_called_class());
    }
}
