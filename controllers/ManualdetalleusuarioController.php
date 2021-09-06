<?php

namespace app\controllers;

use Yii;
use app\models\Manualdetalleusuario;
use app\models\search\ManualdetalleusuarioSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * ManualdetalleusuarioController implements the CRUD actions for Manualdetalleusuario model.
 */
class ManualdetalleusuarioController extends Controller
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
     * Lists all Manualdetalleusuario models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new ManualdetalleusuarioSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Manualdetalleusuario model.
     * @param integer $fkManuelDetalleUsuario
     * @param integer $fkUser
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($fkManuelDetalleUsuario, $fkUser)
    {
        return $this->render('view', [
            'model' => $this->findModel($fkManuelDetalleUsuario, $fkUser),
        ]);
    }

    /**
     * Creates a new Manualdetalleusuario model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Manualdetalleusuario();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'fkManuelDetalleUsuario' => $model->fkManuelDetalleUsuario, 'fkUser' => $model->fkUser]);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Manualdetalleusuario model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $fkManuelDetalleUsuario
     * @param integer $fkUser
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($fkManuelDetalleUsuario, $fkUser)
    {
        $model = $this->findModel($fkManuelDetalleUsuario, $fkUser);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'fkManuelDetalleUsuario' => $model->fkManuelDetalleUsuario, 'fkUser' => $model->fkUser]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Manualdetalleusuario model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $fkManuelDetalleUsuario
     * @param integer $fkUser
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($fkManuelDetalleUsuario, $fkUser)
    {
        $this->findModel($fkManuelDetalleUsuario, $fkUser)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Manualdetalleusuario model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $fkManuelDetalleUsuario
     * @param integer $fkUser
     * @return Manualdetalleusuario the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($fkManuelDetalleUsuario, $fkUser)
    {
        if (($model = Manualdetalleusuario::findOne(['fkManuelDetalleUsuario' => $fkManuelDetalleUsuario, 'fkUser' => $fkUser])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
