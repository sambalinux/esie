<?php

namespace app\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Manualdetalleusuario;

/**
 * ManualdetalleusuarioSearch represents the model behind the search form of `app\models\Manualdetalleusuario`.
 */
class ManualdetalleusuarioSearch extends Manualdetalleusuario
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['fkManuelDetalleUsuario', 'fkUser', 'contador'], 'integer'],
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
        $query = Manualdetalleusuario::find();

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
            'fkManuelDetalleUsuario' => $this->fkManuelDetalleUsuario,
            'fkUser' => $this->fkUser,
            'contador' => $this->contador,
        ]);

        return $dataProvider;
    }
}
