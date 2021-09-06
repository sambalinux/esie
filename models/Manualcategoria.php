<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%manualcategoria}}".
 *
 * @property int $IDCategoria
 * @property string|null $nombre
 *
 * @property Manual[] $manuals
 * @property Manualsubcategoria[] $manualsubcategorias
 */
class Manualcategoria extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%manualcategoria}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nombre'], 'string', 'max' => 60],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'IDCategoria' => 'Id Categoria',
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
        return $this->hasMany(Manual::className(), ['fkCategoria' => 'IDCategoria']);
    }

    /**
     * Gets query for [[Manualsubcategorias]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\ManualsubcategoriaQuery
     */
    public function getManualsubcategorias()
    {
        return $this->hasMany(Manualsubcategoria::className(), ['fkcategoria' => 'IDCategoria']);
    }

    /**
     * {@inheritdoc}
     * @return \app\models\query\ManualcategoriaQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \app\models\query\ManualcategoriaQuery(get_called_class());
    }
}
