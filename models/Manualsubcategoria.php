<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%manualsubcategoria}}".
 *
 * @property int $IDSubCat
 * @property string|null $nombre
 * @property int $fkcategoria
 * @property int $fktiposmodulos
 *
 * @property Manual[] $manuals
 * @property Manualcategoria $fkcategoria0
 * @property Tiposmodulo $fktiposmodulos0
 */
class Manualsubcategoria extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%manualsubcategoria}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['fkcategoria', 'fktiposmodulos'], 'required'],
            [['fkcategoria', 'fktiposmodulos'], 'integer'],
            [['nombre'], 'string', 'max' => 60],
            [['fkcategoria'], 'exist', 'skipOnError' => true, 'targetClass' => Manualcategoria::className(), 'targetAttribute' => ['fkcategoria' => 'IDCategoria']],
            [['fktiposmodulos'], 'exist', 'skipOnError' => true, 'targetClass' => Tiposmodulo::className(), 'targetAttribute' => ['fktiposmodulos' => 'IDTipoMod']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'IDSubCat' => 'Id Sub Cat',
            'nombre' => 'Nombre',
            'fkcategoria' => 'Fkcategoria',
            'fktiposmodulos' => 'Fktiposmodulos',
        ];
    }

    /**
     * Gets query for [[Manuals]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\ManualQuery
     */
    public function getManuals()
    {
        return $this->hasMany(Manual::className(), ['fkSubcategoria' => 'IDSubCat']);
    }

    /**
     * Gets query for [[Fkcategoria0]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\ManualcategoriaQuery
     */
    public function getFkcategoria0()
    {
        return $this->hasOne(Manualcategoria::className(), ['IDCategoria' => 'fkcategoria']);
    }

    /**
     * Gets query for [[Fktiposmodulos0]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\TiposmoduloQuery
     */
    public function getFktiposmodulos0()
    {
        return $this->hasOne(Tiposmodulo::className(), ['IDTipoMod' => 'fktiposmodulos']);
    }

    /**
     * {@inheritdoc}
     * @return \app\models\query\ManualsubcategoriaQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \app\models\query\ManualsubcategoriaQuery(get_called_class());
    }
}
