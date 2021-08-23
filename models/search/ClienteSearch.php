<?php

namespace app\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Cliente;

/**
 * ClienteSearch represents the model behind the search form of `app\models\Cliente`.
 */
class ClienteSearch extends Cliente
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['IDCliente', 'FKTipoTec', 'fkUser'], 'integer'],
            [['CveCentroTra', 'nombre', 'ncorto', 'activo', 'create_at', 'update_at'], 'safe'],
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
        $query = Cliente::find();

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
            'IDCliente' => $this->IDCliente,
            'FKTipoTec' => $this->FKTipoTec,
            'create_at' => $this->create_at,
            'update_at' => $this->update_at,
            'fkUser' => $this->fkUser,
            'update_by' => $this->update_by,
        ]);

        $query->andFilterWhere(['like', 'CveCentroTra', $this->CveCentroTra])
            ->andFilterWhere(['like', 'nombre', $this->nombre])
            ->andFilterWhere(['like', 'ncorto', $this->ncorto])
            ->andFilterWhere(['like', 'activo', $this->activo]);

        return $dataProvider;
    }
}
