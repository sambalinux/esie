<?php

namespace app\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Manualdetalle;

/**
 * ManualdetalleSearch represents the model behind the search form of `app\models\Manualdetalle`.
 */
class ManualdetalleSearch extends Manualdetalle
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['IDManualDetalle', 'fkManual', 'numeroPaso', 'fkStatus', 'fkUser', 'visitas', 'vistoCompletamente', 'created_at', 'update_at'], 'integer'],
            [['codigo', 'resumen', 'contenido', 'documento', 'nombre'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Manualdetalle::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'IDManualDetalle' => $this->IDManualDetalle,
            'fkManual' => $this->fkManual,
            'numeroPaso' => $this->numeroPaso,
            'fkStatus' => $this->fkStatus,
            'fkUser' => $this->fkUser,
            'visitas' => $this->visitas,
            'vistoCompletamente' => $this->vistoCompletamente,
            'created_at' => $this->created_at,
            'update_at' => $this->update_at,
        ]);

        $query->andFilterWhere(['like', 'codigo', $this->codigo])
            ->andFilterWhere(['like', 'resumen', $this->resumen])
            ->andFilterWhere(['like', 'contenido', $this->contenido])
            ->andFilterWhere(['like', 'documento', $this->documento])
            ->andFilterWhere(['like', 'nombre', $this->nombre]);

        return $dataProvider;
    }
}
