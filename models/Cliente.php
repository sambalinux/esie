<?php

namespace app\models;

use Yii;
use yii\behaviors\BlameableBehavior;
use yii\db\ActiveRecord;
//use yii\behaviors\TimestampBehavior;

/**
 * This is the model class for table "{{%clientes}}".
 *
 * @property int $IDCliente
 * @property string|null $CveCentroTra
 * @property int|null $FKTipoTec
 * @property string|null $nombre
 * @property string|null $ncorto
 * @property string|null $activo
 * @property string|null $create_at
 * @property string|null $update_at
 * @property int|null $fkUser
 * @property string|null $update_by
 * @property string|null $img
 * @property string|null $url
 *
 * @property User $fkUser0
 * @property Tipotec $fKTipoTec
 */
class Cliente extends \yii\db\ActiveRecord
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
        return '{{%clientes}}';
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
                ActiveRecord::EVENT_BEFORE_INSERT => ['create_at', 'update_at'],
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
            [['FKTipoTec', 'fkUser', 'create_at', 'update_at','update_by'], 'integer'],
            //[['CveCentroTra','nombre','ncorto','activo','FKTipoTec', 'fkUser','update_by'], 'required'],
            [['CveCentroTra','nombre','ncorto','activo','FKTipoTec'], 'required'],
            [['CveCentroTra'], 'string', 'max' => 30],
            [['nombre'], 'string', 'max' => 255],
            [['ncorto'], 'string', 'max' => 50],
            [['activo'], 'string', 'max' => 1],
            [['img'], 'string', 'max' => 2000],
            //[['imageFile'], 'image', 'extensions'=>'jpg, gif, png','maxSize'=> 10*1024*1024],
            [['imageFile'], 'safe'],
            [['imageFile'], 'file', 'extensions'=>'jpg, gif, png'],
            [['imageFile'], 'file', 'maxSize'=>'1000000'],
            //[['fkUser'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['fkUser' => 'id']],
            [['fkUser'], 'exist', 'skipOnError' => true, 'targetClass' =>  \webvimark\modules\UserManagement\models\User::className(), 'targetAttribute' => ['fkUser' => 'id']],
            [['FKTipoTec'], 'exist', 'skipOnError' => true, 'targetClass' => Tipotec::className(), 'targetAttribute' => ['FKTipoTec' => 'IDTipoTec']],
            [['update_by'], 'exist', 'skipOnError' => true, 'targetClass' => \webvimark\modules\UserManagement\models\User::className(), 'targetAttribute' => ['fkUser' => 'id']],
            [['img'], 'string', 'max' => 255],
            [['url'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'IDCliente' => 'Id Cliente',
            'CveCentroTra' => 'Cve Centro Trabajo',
            'FKTipoTec' => 'Tipo de Instituto',
            'nombre' => 'Nombre',
            'ncorto' => 'Nombre corto',
            'activo' => 'Estatus',
            'create_at' => 'Fecha Creacion',
            'update_at' => 'Fecha Actualizacion',
            'fkUser' => 'User',
            'update_by' => 'Actualizado por',
            'img' => 'Img',
            'imageFile' => 'Image File',
            'url' => 'url',
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
     * Gets query for [[Update_by0]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\UserQuery
     */
    public function getUpdate_by0()
    {
        return $this->hasOne(User::className(), ['id' => 'fkUser']);
    }

    /**
     * Gets query for [[FKTipoTec]].
     *
     * @return \yii\db\ActiveQuery|\app\models\query\TipotecQuery
     */
    public function getFKTipoTec()
    {
        return $this->hasOne(Tipotec::className(), ['IDTipoTec' => 'FKTipoTec']);
    }

    /**
     * {@inheritdoc}
     * @return \app\models\query\ClienteQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \app\models\query\ClienteQuery(get_called_class());
    }

    public function getImageUrl(){
        return Yii::getAlias('@web')."/uploads/institutos/".$this->img;
    }
}
   

