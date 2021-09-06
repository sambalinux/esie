<?php

namespace app\models;

use Yii;
use yii\behaviors\BlameableBehavior;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "{{%manual}}".
 *
 * @property int $IDManual
 * @property string|null $codigo
 * @property string|null $nombre
 * @property string|null $identificador
 * @property string|null $descripcion
 * @property float|null $costo
 * @property int|null $fkCategoria
 * @property int|null $fkSubcategoria
 * @property int|null $fkTipo
 * @property int $fkAutor
 * @property int|null $visitas
 * @property string|null $foto
 * @property int|null $votos
 * @property int|null $fkStatus
 * @property int $created_at
 * @property int $updated_at
 * @property int $fkUser
 * @property int|null $like
 * @property string|null $temario
 * @property int $fkSeccion
 *
 * @property Manualcategoria $fkCategoria0
 * @property Manualsubcategoria $fkSubcategoria0
 * @property User $fkUser0
 * @property User $fkAutor0
 * @property Manualtipo $fkTipo0
 * @property Manualseccion $fkSeccion0
 * @property Status $fkStatus0
 * @property Manualarchivo[] $manualarchivos
 * @property Archivo[] $fkArchivos
 * @property Manualdetalle[] $manualdetalles
 */
class Manual extends \yii\db\ActiveRecord
{
    /**
     * @var yii\web\UploadedFile;
     */

    public $imageFile;
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%manual}}';
    }


    public function behaviors(){
        return[
            [
                'class' => BlameableBehavior::className(),
                'createdByAttribute' => 'fkUser',
                'updatedByAttribute' => 'fkAutor',
            ],
            'timestamp' => [
            'class' => 'yii\behaviors\TimestampBehavior',
            'attributes' => [
                ActiveRecord::EVENT_BEFORE_INSERT => ['created_at', 'updated_at'],
                ActiveRecord::EVENT_BEFORE_UPDATE => ['updated_at'],
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
            [['descripcion', 'temario'], 'string'],
            [['costo'], 'number'],
            [['fkCategoria', 'fkSubcategoria', 'fkTipo', 'fkAutor', 'visitas', 'votos', 'fkStatus', 'created_at', 'updated_at', 'fkUser', 'like', 'fkSeccion'], 'integer'],
            //[['fkAutor', 'created_at', 'updated_at', 'fkUser', 'fkSeccion'], 'required'],
            [['fkSeccion', 'nombre', 'descripcion', 'fkCategoria', 'fkSubcategoria', 'fkTipo', 'fkStatus'], 'required'],
            [['codigo'], 'string', 'max' => 50],
            [['nombre'], 'string', 'max' => 200],
            [['identificador'], 'string', 'max' => 20],
            [['foto'], 'string', 'max' => 300],
            //para subir la imagen
            [['imageFile'], 'safe'],
            [['imageFile'], 'file', 'extensions'=>'jpg, gif, png'],
            [['imageFile'], 'file', 'maxSize'=>'1000000'],
            [['fkCategoria'], 'exist', 'skipOnError' => true, 'targetClass' => Manualcategoria::className(), 'targetAttribute' => ['fkCategoria' => 'IDCategoria']],
            [['fkSubcategoria'], 'exist', 'skipOnError' => true, 'targetClass' => Manualsubcategoria::className(), 'targetAttribute' => ['fkSubcategoria' => 'IDSubCat']],
            [['fkUser'], 'exist', 'skipOnError' => true, 'targetClass' => \webvimark\modules\UserManagement\models\User::className(), 'targetAttribute' => ['fkUser' => 'id']],
            [['fkAutor'], 'exist', 'skipOnError' => true, 'targetClass' => \webvimark\modules\UserManagement\models\User::className(), 'targetAttribute' => ['fkUser' => 'id']],
            [['fkTipo'], 'exist', 'skipOnError' => true, 'targetClass' => Manualtipo::className(), 'targetAttribute' => ['fkTipo' => 'IDManualTipo']],
            [['fkSeccion'], 'exist', 'skipOnError' => true, 'targetClass' => Manualseccion::className(), 'targetAttribute' => ['fkSeccion' => 'IDSeccion']],
            [['fkStatus'], 'exist', 'skipOnError' => true, 'targetClass' => Status::className(), 'targetAttribute' => ['fkStatus' => 'IDStatus']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'IDManual' => 'Id Manual',
            'codigo' => 'Código',
            'nombre' => 'Nombre',
            'identificador' => 'Identificador',
            'descripcion' => 'Descripción',
            'costo' => 'Costo',
            'fkCategoria' => 'Categoria',
            'fkSubcategoria' => 'Subcategoria',
            'fkTipo' => 'Tipo de manual',
            'fkAutor' => 'Fk Autor',
            'visitas' => 'Visitas',
            'foto' => 'Foto',
            'imageFile' => 'Image File',
            'votos' => 'Votos',
            'fkStatus' => 'Estatus inicial',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'fkUser' => 'Fk User',
            'like' => 'Me gusta',
            'temario' => 'Temario',
            'fkSeccion' => 'Sección a ubicat',
        ];
    }

    /**
     * Gets query for [[FkCategoria0]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\ManualcategoriaQuery
     */
    public function getFkCategoria0()
    {
        return $this->hasOne(Manualcategoria::className(), ['IDCategoria' => 'fkCategoria']);
    }

    /**
     * Gets query for [[FkSubcategoria0]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\ManualsubcategoriaQuery
     */
    public function getFkSubcategoria0()
    {
        return $this->hasOne(Manualsubcategoria::className(), ['IDSubCat' => 'fkSubcategoria']);
    }

    /**
     * Gets query for [[FkUser0]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\UserQuery
     */
    public function getFkUser0()
    {
        return $this->hasOne(\webvimark\modules\UserManagement\models\User::className(), ['id' => 'fkUser']);
        //'targetClass' => \webvimark\modules\UserManagement\models\User::className(), 'targetAttribute' => ['fkUser' => 'id']],

    }

    

    /**
     * Gets query for [[FkAutor0]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\UserQuery
     */
    public function getFkAutor0()
    {
        return $this->hasOne(\webvimark\modules\UserManagement\models\User::className(), ['id' => 'fkAutor']);
    }

    /**
     * Gets query for [[FkTipo0]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\ManualtipoQuery
     */
    public function getFkTipo0()
    {
        return $this->hasOne(Manualtipo::className(), ['IDManualTipo' => 'fkTipo']);
    }

    /**
     * Gets query for [[FkSeccion0]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\ManualseccionQuery
     */
    public function getFkSeccion0()
    {
        return $this->hasOne(Manualseccion::className(), ['IDSeccion' => 'fkSeccion']);
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
     * Gets query for [[Manualarchivos]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\ManualarchivoQuery
     */
    public function getManualarchivos()
    {
        return $this->hasMany(Manualarchivo::className(), ['fkManual' => 'IDManual']);
    }

    /**
     * Gets query for [[FkArchivos]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\ArchivoQuery
     */
    public function getFkArchivos()
    {
        return $this->hasMany(Archivo::className(), ['IDArchivo' => 'fkArchivo'])->viaTable('{{%manualarchivo}}', ['fkManual' => 'IDManual']);
    }

    /**
     * Gets query for [[Manualdetalles]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\ManualdetalleQuery
     */
    public function getManualdetalles()
    {
        return $this->hasMany(Manualdetalle::className(), ['fkManual' => 'IDManual']);
    }

    /**
     * {@inheritdoc}
     * @return \app\models\query\ManualQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \app\models\query\ManualQuery(get_called_class());
    }
    /**
     * @return image
     */
    public function getImageUrl(){
        return Yii::getAlias('@web')."/uploads/manual/".$this->foto;
    }
}
