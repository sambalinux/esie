<?php

namespace app\models\query;

/**
 * This is the ActiveQuery class for [[\app\models\Manualtipo]].
 *
 * @see \app\models\Manualtipo
 */
class ManualtipoQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * {@inheritdoc}
     * @return \app\models\Manualtipo[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * {@inheritdoc}
     * @return \app\models\Manualtipo|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
