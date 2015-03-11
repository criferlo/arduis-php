<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ingles_controller
 *
 * @author cristhian
 */
View::template("template_sistema");
Load::models("Idioma","Archivo","Persona","Tiponivelingles","Tipoinstitucion","Usuario");
class IdiomaController extends AppController {
    //put your code here
    
    function index($page=1){
        $per = new Idioma();
        //$this->arrPersona = array();
        $consulta=null;
        
        if(!empty(Input::post("tiponivelingles_id"))){
          
                if(Input::post("comboBusqueda")=="0"){
                    $consulta="tiponivelingles_id=".Input::post("tiponivelingles_id");
                }
                
            
        }
                
        $this->arrIdioma =  $per->paginar($consulta,$page);
    }
    
    function nuevo(){
        if(Input::hasPost("persona_id")){
            
            
            $per = new Idioma();
            $per->persona_id=Input::post("persona_id");
            $per->profesor=Input::post("profesor");
            $per->tipoinstitucion_id=Input::post("tipoinstitucion_id");
            $per->tiponivelingles_id=Input::post("tiponivelingles_id");
            $per->fechainicio=Input::post("fechainicio");
            $per->fechafin=Input::post("fechafin");
            $per->registradopor = Auth::get("nombre");
            
            $usu = new Usuario();
            $usu->find_first(Auth::get("id"));
            $per->programaqueregistra_id = $usu->tipoprograma_id;
                        
            $archivo =  Upload::factory("archivo");
            if($archivo->isUploaded()){
                
                $arc = new Archivo();              
                $arc->nombre = $archivo->saveRandom();
                $arc->save();
                $per->archivo_id = $arc->id;
            }
            
            
            
            if($per->save()){
                 Flash::valid("Se grabó el registro de idioma correctamente");
                 Router::redirect("idioma/index");
            }
           
        }
    }
    
    function editar($id){
        $this->per = new Idioma();
        $this->per->find_first($id);
        $this->id=$id;
        
        if(Input::hasPost("persona_id")){
            
            
            $per = new Idioma();
            $per->find_first($id);
            $per->persona_id=Input::post("persona_id");
            $per->profesor=Input::post("profesor");
            $per->tipoinstitucion_id=Input::post("tipoinstitucion_id");
            $per->tiponivelingles_id=Input::post("tiponivelingles_id");
            $per->fechainicio=Input::post("fechainicio");
            $per->fechafin=Input::post("fechafin");
            
            $archivo =  Upload::factory("archivo");
            if($archivo->isUploaded()){
                
                $arc = new Archivo();              
                $arc->nombre = $archivo->saveRandom();
                $arc->save();
                $per->archivo_id = $arc->id;
            }
            
            
            
            if($per->update()){
                 Flash::valid("Se actualizó el registro idioma correctamente");
                 Router::redirect("idioma/index");
            }
           
        }
    }
    
    function eliminar($id){
        $per = new Idioma();
        
        if($per->delete($id)){
            Flash::valid("Se eliminó correctamente");
            Router::redirect("idioma/index");
        }
    }
}
