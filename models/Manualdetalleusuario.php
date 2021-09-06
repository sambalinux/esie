<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%manualdetalleusuario}}".
 *
 * @property int $fkManuelDetalleUsuario
 * @property int $fkUser
 * @property int|null $contador
 *
 * @property User $fkUser0
 * @property Manualdetalle $fkManuelDetalleUsuario0
 */
class Manualdetalleusuario extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%manualdetalleusuario}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['fkManuelDetalleUsuario', 'fkUser'], 'required'],
            [['fkManuelDetalleUsuario', 'fkUser', 'contador'], 'integer'],
            [['fkManuelDetalleUsuario', 'fkUser'], 'unique', 'targetAttribute' => ['fkManuelDetalleUsuario', 'fkUser']],
            [['fkUser'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['fkUser' => 'id']],
            [['fkManuelDetalleUsuario'], 'exist', 'skipOnError' => true, 'targetClass' => Manualdetalle::className(), 'targetAttribute' => ['fkManuelDetalleUsuario' => 'IDManualDetalle']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'fkManuelDetalleUsuario' => 'Fk Manuel Detalle Usuario',
            'fkUser' => 'Fk User',
            'contador' => 'Contador',
        ];
    }

    /**
     * Gets query for [[FkUser0]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\UserQuery
     */
    public function getFkUser0()
    {
        return $this->hasOne(User::className(), ['id' => 'fkUser']);
    }

    /**
     * Gets query for [[FkManuelDetalleUsuario0]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\ManualdetalleQuery
     */
    public function getFkManuelDetalleUsuario0()
    {
        return $this->hasOne(Manualdetalle::className(), ['IDManualDetalle' => 'fkManuelDetalleUsuario']);
    }

    /**
     * {@inheritdoc}
     * @return \app\models\query\ManualdetalleusuarioQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \app\models\query\ManualdetalleusuarioQuery(get_called_class());
    }
}
