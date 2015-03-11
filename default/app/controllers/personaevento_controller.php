<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of personaevento_controller
 *
 * @author cristhian
 */
View::template("template_sistema");
Load::models("Eventointernacional","Archivo","Tipoevento","Tiposemestre","Personaevento","Tipoprograma");
class PersonaeventoController extends AppController {
    //put your code here
    function index($idevento){
        
        $this->idevento=$idevento;
        
        $per = new Personaevento();
        $this->arrPersonas = $per->find("eventointernacional_id=$idevento");
        
        if(Input::hasPost("persona_id")){
            $pes = new Personaevento();
            $pes->eventointernacional_id=$idevento;
            $pes->persona_id=Input::post("persona_id");
            $pes->save();
            Flash::valid("Agregado correctamente");
            Router::redirect("personaevento/index/$idevento");
        }
    } 
    
    function eliminar($idevento,$id){
        $per = new Personaevento();
        
        if($per->delete($id)){
            Flash::valid("Se eliminó correctamente");
            Router::redirect("personaevento/index/$idevento");
        }
    } 
    
}
