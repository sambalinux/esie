<?php

namespace app\models;

use Yii;
use yii\behaviors\BlameableBehavior;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "{{%manualdetalle}}".
 *
 * @property int $IDManualDetalle
 * @property string|null $codigo
 * @property int $fkManual
 * @property int|null $numeroPaso
 * @property string|null $resumen
 * @property string|null $contenido
 * @property string|null $documento
 * @property int $fkStatus
 * @property int $fkUser
 * @property int|null $visitas
 * @property string|null $nombre
 * @property int|null $vistoCompletamente
 * @property int|null $created_at
 * @property int|null $update_at
 *
 * @property Manualarchivodetalle[] $manualarchivodetalles
 * @property Archivo[] $fkArchivos
 * @property Manual $fkManual0
 * @property Status $fkStatus0
 * @property User $fkUser0
 * @property Manualdetalleusuario[] $manualdetalleusuarios
 * @property User[] $fkUsers
 */
class Manualdetalle extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%manualdetalle}}';
    }

    public function behaviors(){
        return[
            [
                'class' => BlameableBehavior::className(),
                'createdByAttribute' => 'fkUser',
                'updatedByAttribute' => 'update_by',
            ],
            'timestamp' => [
            'class' => 'yii\behaviors\TimestampBehavior',
            'attributes' => [
                ActiveRecord::EVENT_BEFORE_INSERT => ['created_at', 'update_at'],
                ActiveRecord::EVENT_BEFORE_UPDATE => ['update_at'],
            ],
        ],
    ];
    }
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['fkManual', 'fkStatus'], 'required'],
            [['fkManual', 'numeroPaso', 'fkStatus', 'fkUser', 'visitas', 'vistoCompletamente', 'created_at', 'update_at','update_by'], 'integer'],
            [['resumen', 'contenido'], 'string'],
            [['codigo'], 'string', 'max' => 50],
            [['documento'], 'string', 'max' => 400],
            [['nombre'], 'string', 'max' => 100],
            [['fkManual'], 'exist', 'skipOnError' => true, 'targetClass' => Manual::className(), 'targetAttribute' => ['fkManual' => 'IDManual']],
            [['fkStatus'], 'exist', 'skipOnError' => true, 'targetClass' => Status::className(), 'targetAttribute' => ['fkStatus' => 'IDStatus']],
            [['fkUser'], 'exist', 'skipOnError' => true, 'targetClass' => \webvimark\modules\UserManagement\models\User::className(), 'targetAttribute' => ['fkUser' => 'id']],
            [['update_by'], 'exist', 'skipOnError' => true, 'targetClass' => \webvimark\modules\UserManagement\models\User::className(), 'targetAttribute' => ['fkUser' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'IDManualDetalle' => 'Id Manual Detalle',
            'codigo' => 'Código',
            'fkManual' => 'Manual',
            'numeroPaso' => 'Hoja Número',
            'resumen' => 'Resumen',
            'contenido' => 'Contenido Video',
            'documento' => 'Documento',
            'fkStatus' => 'Estatus de la hoja',
            'fkUser' => 'Fk User',
            'visitas' => 'Visitas',
            'nombre' => 'Nombre de la hoja',
            'vistoCompletamente' => 'Visto Completamente',
            'created_at' => 'Created At',
            'update_at' => 'Update At',
            'update_by' => 'Update By',
        ];
    }

    /**
     * Gets query for [[Manualarchivodetalles]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\ManualarchivodetalleQuery
     */
    public function getManualarchivodetalles()
    {
        return $this->hasMany(Manualarchivodetalle::className(), ['fkManualDetalle' => 'IDManualDetalle']);
    }

    /**
     * Gets query for [[FkArchivos]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\ArchivoQuery
     */
    public function getFkArchivos()
    {
        return $this->hasMany(Archivo::className(), ['IDArchivo' => 'fkArchivo'])->viaTable('{{%manualarchivodetalle}}', ['fkManualDetalle' => 'IDManualDetalle']);
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
     * Gets query for [[FkStatus0]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\StatusQuery
     */
    public function getFkStatus0()
    {
        return $this->hasOne(Status::className(), ['IDStatus' => 'fkStatus']);
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
     * Gets query for [[Manualdetalleusuarios]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\ManualdetalleusuarioQuery
     */
    public function getManualdetalleusuarios()
    {
        return $this->hasMany(Manualdetalleusuario::className(), ['fkManuelDetalleUsuario' => 'IDManualDetalle']);
    }

    /**
     * Gets query for [[FkUsers]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\UserQuery
     */
    public function getFkUsers()
    {
        return $this->hasMany(User::className(), ['id' => 'fkUser'])->viaTable('{{%manualdetalleusuario}}', ['fkManuelDetalleUsuario' => 'IDManualDetalle']);
    }

    /**
     * {@inheritdoc}
     * @return \app\models\query\ManualdetalleQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \app\models\query\ManualdetalleQuery(get_called_class());
    }
}
