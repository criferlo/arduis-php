<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of personasvinculadas_controller
 *
 * @author cristhian
 */
//persoans vinculadas a una investigación
Load::models("Personavinculada","Tipoprograma");
View::template("template_sistema");
class PersonavinculadaController extends AppController {
    //put your code here
    function index($idinvestigacion){
        
        $this->idinvestigacion=$idinvestigacion;
        
        $per = new Personavinculada();
        $this->arrPersonas = $per->find("investigacion_id=$idinvestigacion");
        
        if(Input::hasPost("persona_id")){
            $pes = new Personavinculada();
            $pes->investigacion_id=$idinvestigacion;
            $pes->persona_id=Input::post("persona_id");
            $pes->save();
            Flash::valid("Agregado correctamente");
            Router::redirect("personavinculada/index/$idinvestigacion");
        }
    }
    
    function eliminar($idinvestigacion,$id){
        $per = new Personavinculada();
        
        if($per->delete($id)){
            Flash::valid("Se eliminó correctamente");
            Router::redirect("personavinculada/index/$idinvestigacion");
        }
    } 
}
?>