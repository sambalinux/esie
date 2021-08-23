<?php

namespace app\controllers;

use Yii;
use app\models\Cliente;
use app\models\search\ClienteSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\UploadedFile;
use app\components\Util;

/**
 * ClienteController implements the CRUD actions for Cliente model.
 */
class ClienteController extends Controller
{
    public $freeAccessActions = ['list','listarClientes']; //Acciones Permitidas
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
             //agregada por webvimark zea
             'ghost-access'=> [
                'class' => 'webvimark\modules\UserManagement\components\GhostAccessControl',
            ],
        ];
    }

    /**
     * Lists all Cliente models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new ClienteSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Cliente model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Cliente model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Cliente();
      

        if ($model->load(Yii::$app->request->post())){
            $imageFile = UploadedFile::getInstance($model, 'imageFile');

            if (!is_null($imageFile)) {
              //$model->img = $imageFile->name;
              $tmp = (explode(".", $imageFile->name));
              $ext = end($tmp);
             // generate a unique file name to prevent duplicate filenames
              $model->img = Yii::$app->security->generateRandomString().".{$ext}";
               // the path to save file, you can set an uploadPath
               // in Yii::$app->params (as used in example below)                       
               Yii::$app->params['uploadPath'] = Yii::$app->basePath . '/web/uploads/institutos/';
               $path = Yii::$app->params['uploadPath'] . $model->img;
               $imageFile->saveAs($path);
             }

            if ($model->save()) {
                return $this->redirect(['view', 'id' => $model->IDCliente]);
            }else {
                var_dump ($model->getErrors()); die();
             }
        }
    
        

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Cliente model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post())){ 
        $imageFile = UploadedFile::getInstance($model, 'imageFile');

        if (!is_null($imageFile)) {
          $nameFileDelete= $model->img;
          $tmp = (explode(".", $imageFile->name));
          $ext = end($tmp);
         // generate a unique file name to prevent duplicate filenames
          $model->img = Yii::$app->security->generateRandomString().".{$ext}";
           // the path to save file, you can set an uploadPath
           // in Yii::$app->params (as used in example below)                       
           Yii::$app->params['uploadPath'] = Yii::$app->basePath . '/web/uploads/institutos/';
           $path = Yii::$app->params['uploadPath'] . $model->img;
           $imageFile->saveAs($path);
         }

        if ($model->save()) {
            //borrar imagen anterior
            if(!empty($nameFileDelete)){
                Util::borrarArchivo($nameFileDelete);
            }
            return $this->redirect(['view', 'id' => $model->IDCliente]);
        }else {
            var_dump ($model->getErrors()); die();
         }
        }
        return $this->render('update', [
            'model' => $model,
        ]);
    
}

    /**
     * Deletes an existing Cliente model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Cliente model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Cliente the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Cliente::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    /**
     * Displays a single Cliente model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionList()
    {
        $searchModel = new ClienteSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('list',[
            'models'=> $dataProvider,
        ]);
    }
    
    public function actionListarClientes(){
        return $this->render('listarClientes');
    }

    

}
