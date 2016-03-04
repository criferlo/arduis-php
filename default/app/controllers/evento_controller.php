<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of evento_controller
 *
 * @author cristhian
 */
View::template("template_sistema");
Load::models("Eventointernacional","Archivo","Tipoevento","Tiposemestre","Usuario");
class EventoController extends AppController {
    //put your code here
    function index($page=1){
        
        $per = new Eventointernacional();
        //$this->arrPersona = array();
        $consulta=null;
        $busqueda = Input::post("busqueda");
        if(!empty($busqueda)){
          
                if(Input::post("comboBusqueda")=="0"){
                    $consulta="nombreevento like '%".Input::post("busqueda")."%'";
                }
        }
                
        $this->arrEventos =  $per->paginar($consulta,$page);
        
    }
    
    function nuevo(){
        if(Input::hasPost("tiposemestre_id")){
            
            
            $per = new Eventointernacional();
            $per->tipoinstitucion_id=Input::post("tipoinstitucion_id");
            $per->tiposemestre_id=Input::post("tiposemestre_id");
            $per->fecha=Input::post("fecha");
            $per->nombreevento=Input::post("nombreevento");
            $per->tipoevento_id=Input::post("tipoevento_id");
            $per->descripcion=Input::post("descripcion");
            
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
                 Flash::valid("Se grabó el evento correctamente");
                 Router::redirect("evento/index");
            }
           
        }
    }
    
    function editar($id){
        
        $this->per = new Eventointernacional();
        $this->per->find_first($id);
        $this->id=$id;
        
        if(Input::hasPost("tiposemestre_id")){
            
            
            $per = new Eventointernacional();
            $per->find_first($id);
            $per->tipoinstitucion_id=Input::post("tipoinstitucion_id");
            $per->tiposemestre_id=Input::post("tiposemestre_id");
            $per->fecha=Input::post("fecha");
            $per->nombreevento=Input::post("nombreevento");
            $per->tipoevento_id=Input::post("tipoevento_id");
            $per->descripcion=Input::post("descripcion");
            
            $archivo =  Upload::factory("archivo");
            if($archivo->isUploaded()){
                
                $arc = new Archivo();              
                $arc->nombre = $archivo->saveRandom();
                $arc->save();
                $per->archivo_id = $arc->id;
            }
            
            if($per->update()){
                 Flash::valid("Se actualizó el evento correctamente");
                 Router::redirect("evento/index");
            }
           
        }
    }
    
    function eliminar($id){
        $per = new Eventointernacional();
        
        if($per->delete($id)){
            Flash::valid("Se eliminó correctamente");
            Router::redirect("evento/index");
        }
    }
}
