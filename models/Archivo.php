<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%archivo}}".
 *
 * @property int $IDArchivo
 * @property int $fkUser
 * @property string $nombre
 * @property string|null $tipo
 * @property int|null $tamano
 * @property string|null $descripcion
 * @property int $created_at
 * @property int $updated_at
 * @property string|null $titulo
 * @property string|null $ruta
 * @property int $descargas
 *
 * @property User $fkUser0
 * @property Manualarchivo[] $manualarchivos
 * @property Manual[] $fkManuals
 * @property Manualarchivodetalle[] $manualarchivodetalles
 * @property Manualdetalle[] $fkManualDetalles
 */
class Archivo extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%archivo}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['fkUser', 'nombre', 'created_at', 'updated_at'], 'required'],
            [['fkUser', 'tamano', 'created_at', 'updated_at', 'descargas'], 'integer'],
            [['descripcion'], 'string'],
            [['nombre'], 'string', 'max' => 100],
            [['tipo', 'titulo', 'ruta'], 'string', 'max' => 255],
            [['fkUser'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['fkUser' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'IDArchivo' => 'Id Archivo',
            'fkUser' => 'Fk User',
            'nombre' => 'Nombre',
            'tipo' => 'Tipo',
            'tamano' => 'Tamano',
            'descripcion' => 'Descripcion',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'titulo' => 'Titulo',
            'ruta' => 'Ruta',
            'descargas' => 'Descargas',
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
     * Gets query for [[Manualarchivos]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\ManualarchivoQuery
     */
    public function getManualarchivos()
    {
        return $this->hasMany(Manualarchivo::className(), ['fkArchivo' => 'IDArchivo']);
    }

    /**
     * Gets query for [[FkManuals]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\ManualQuery
     */
    public function getFkManuals()
    {
        return $this->hasMany(Manual::className(), ['IDManual' => 'fkManual'])->viaTable('{{%manualarchivo}}', ['fkArchivo' => 'IDArchivo']);
    }

    /**
     * Gets query for [[Manualarchivodetalles]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\ManualarchivodetalleQuery
     */
    public function getManualarchivodetalles()
    {
        return $this->hasMany(Manualarchivodetalle::className(), ['fkArchivo' => 'IDArchivo']);
    }

    /**
     * Gets query for [[FkManualDetalles]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\ManualdetalleQuery
     */
    public function getFkManualDetalles()
    {
        return $this->hasMany(Manualdetalle::className(), ['IDManualDetalle' => 'fkManualDetalle'])->viaTable('{{%manualarchivodetalle}}', ['fkArchivo' => 'IDArchivo']);
    }

    /**
     * {@inheritdoc}
     * @return \app\models\query\ArchivoQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \app\models\query\ArchivoQuery(get_called_class());
    }
}
