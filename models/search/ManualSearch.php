<?php

namespace app\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Manual;

/**
 * ManualSearch represents the model behind the search form of `app\models\Manual`.
 */
class ManualSearch extends Manual
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['IDManual', 'fkCategoria', 'fkSubcategoria', 'fkTipo', 'fkAutor', 'visitas', 'votos', 'fkStatus', 'created_at', 'updated_at', 'fkUser', 'like', 'fkSeccion'], 'integer'],
            [['codigo', 'nombre', 'identificador', 'descripcion', 'foto', 'temario'], 'safe'],
            [['costo'], 'number'],
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
        $query = Manual::find();

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
            'IDManual' => $this->IDManual,
            'costo' => $this->costo,
            'fkCategoria' => $this->fkCategoria,
            'fkSubcategoria' => $this->fkSubcategoria,
            'fkTipo' => $this->fkTipo,
            'fkAutor' => $this->fkAutor,
            'visitas' => $this->visitas,
            'votos' => $this->votos,
            'fkStatus' => $this->fkStatus,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'fkUser' => $this->fkUser,
            'like' => $this->like,
            'fkSeccion' => $this->fkSeccion,
        ]);

        $query->andFilterWhere(['like', 'codigo', $this->codigo])
            ->andFilterWhere(['like', 'nombre', $this->nombre])
            ->andFilterWhere(['like', 'identificador', $this->identificador])
            ->andFilterWhere(['like', 'descripcion', $this->descripcion])
            ->andFilterWhere(['like', 'foto', $this->foto])
            ->andFilterWhere(['like', 'temario', $this->temario]);

        return $dataProvider;
    }
}
