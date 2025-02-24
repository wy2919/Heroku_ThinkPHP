<?php

namespace app\admin\controller;

class Apply extends Base
{

    protected $name = '报名人数';         // log
    protected $field = 'id';       // logName


    public function List()
    {
        if (input('page')) {
            return $this->service->getrData();
        }

        return $this->fetch();
    }



    public function Edit()
    {
        $this->ParamVerify->gocheck('id');

        if (IS_POST) {
            return $this->service->Edit();
        }

        $info = $this->service->getById();
        $info['imgs'] = explode(',', $info['imgs']);


        $this->assign([
            'info' => $info,
            'type'=>model_s('Type')

        ]);


        return $this->fetch();
    }


    public function Add()
    {

        if (IS_POST) {
            return $this->service->Add();
        }


//        $this->assign([
//            'data' => model('Letter')->select(),
//            'zz' =>$this->getModel_s('Article',[['type1','=',1]])
//        ]);
        return $this->fetch();
    }


    public function Del()
    {
        $this->ParamVerify->gocheck('id');
        $id = input('id');


        return $this->service->delDataByIds(CONTROLLER_NAME);
    }


}