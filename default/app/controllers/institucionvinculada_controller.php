<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of institucionvinculada_controller
 *
 * @author cristhian
 */
Load::models("Institucionvinculada","Tipoinstitucion");
View::template("template_sistema");
class InstitucionvinculadaController extends AppController{
    
    function index($idinvestigacion){
        
        $this->idinvestigacion=$idinvestigacion;
        
        $per = new Institucionvinculada();
        $this->arrInstituciones = $per->find("investigacion_id=$idinvestigacion");
        
        if(Input::hasPost("tipoinstitucion_id")){
            $pes = new Institucionvinculada();
            $pes->investigacion_id=$idinvestigacion;
            $pes->tipoinstitucion_id=Input::post("tipoinstitucion_id");
            $pes->save();
            Flash::valid("Agregado correctamente");
            Router::redirect("institucionvinculada/index/$idinvestigacion");
        }
    }
    
    function eliminar($idinvestigacion,$id){
        $per = new Institucionvinculada();
        
        if($per->delete($id)){
            Flash::valid("Se eliminó correctamente");
            Router::redirect("institucionvinculada/index/$idinvestigacion");
        }
    } 
}
