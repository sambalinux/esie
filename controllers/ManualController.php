<?php

namespace app\controllers;

use Yii;
use app\models\Manual;
use app\models\search\ManualSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\UploadedFile;
use yii\helpers\Url;

/**
 * ManualController implements the CRUD actions for Manual model.
 */
class ManualController extends Controller
{
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
        ];
    }

    /**
     * Lists all Manual models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new ManualSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Manual model.
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
     * Lists all Manual models.
     * @return mixed
     */
    public function actionListado()
    {
        $searchModel = new ManualSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('listado', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Creates a new Manual model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Manual();

        if ($model->load(Yii::$app->request->post())){
            $imageFile = UploadedFile::getInstance($model, 'imageFile');

            if (!is_null($imageFile)) {
              //$model->img = $imageFile->name;
              $tmp = (explode(".", $imageFile->name));
              $ext = end($tmp);
             // generate a unique file name to prevent duplicate filenames
              $model->foto = Yii::$app->security->generateRandomString().".{$ext}";
               // the path to save file, you can set an uploadPath
               // in Yii::$app->params (as used in example below)                       
               Yii::$app->params['uploadPath'] = Yii::$app->basePath . '/web/uploads/manual/';
               $path = Yii::$app->params['uploadPath'] . $model->foto;
               $imageFile->saveAs($path);
             }

             if ($model->save()) {
                return $this->redirect(['view', 'id' => $model->IDManual]);
            }else {
                var_dump ($model->getErrors()); die();
             }
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Manual model.
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
              $model->foto = Yii::$app->security->generateRandomString().".{$ext}";
               // the path to save file, you can set an uploadPath
               // in Yii::$app->params (as used in example below)                       
               Yii::$app->params['uploadPath'] = Yii::$app->basePath . '/web/uploads/manual/';
               $path = Yii::$app->params['uploadPath'] . $model->foto;
               $imageFile->saveAs($path);
             }
    
            if ($model->save()) {
                //borrar imagen anterior
                if(!empty($nameFileDelete)){
                    Util::borrarArchivo($nameFileDelete);
                }
                return $this->redirect(['view', 'id' => $model->IDManual]);
            }else {
                var_dump ($model->getErrors()); die();
             }
            }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Manual model.
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
     * Finds the Manual model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Manual the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Manual::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
