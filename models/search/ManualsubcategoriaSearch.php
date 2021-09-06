<?php

namespace app\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Manualsubcategoria;

/**
 * ManualsubcategoriaSearch represents the model behind the search form of `app\models\Manualsubcategoria`.
 */
class ManualsubcategoriaSearch extends Manualsubcategoria
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['IDSubCat', 'fkcategoria', 'fktiposmodulos'], 'integer'],
            [['nombre'], 'safe'],
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
        $query = Manualsubcategoria::find();

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
            'IDSubCat' => $this->IDSubCat,
            'fkcategoria' => $this->fkcategoria,
            'fktiposmodulos' => $this->fktiposmodulos,
        ]);

        $query->andFilterWhere(['like', 'nombre', $this->nombre]);

        return $dataProvider;
    }
}
