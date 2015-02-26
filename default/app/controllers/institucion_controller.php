<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of institucion_controller
 *
 * @author cristhian
 */
View::template("template_sistema");
Load::models("tipoinstitucion","tipociudad");
class InstitucionController extends AppController {
   
     function index($page=1){
        
        $per = new Tipoinstitucion();
        //$this->arrPersona = array();
        $consulta=null;
        
        if(!empty(Input::post("busqueda"))){
          
                if(Input::post("comboBusqueda")=="0"){
                    $consulta="nombre like '%".Input::post("busqueda")."%'";
                }
                
            
        }
                
        $this->arrInstitucion =  $per->paginar($consulta,$page);
        
    }
    
    function nuevo(){
        if(Input::hasPost("nombre")){
            
            
            $per = new Tipoinstitucion();
            $per->nombre=Input::post("nombre");
            $per->tipociudad_id=Input::post("tipociudad_id");
            
            
            if($per->save()){
                 Flash::valid("Se grabó la institución correctamente");
                 Router::redirect("institucion/index");
            }
           
        }
    }
    
     function editar($id){
        
        $this->per = new Tipoinstitucion();
        $this->per->find_first($id);
        $this->id=$id;
        
        if(Input::hasPost("nombre")){
            
            
            $per = new Tipoinstitucion();
            $per->find_first($id);
            $per->nombre=Input::post("nombre");
            $per->tipociudad_id=Input::post("tipociudad_id");
            
            
            if($per->update()){
                 Flash::valid("Se actualizó la institución correctamente");
                 Router::redirect("institucion/index");
            }
           
        }
    }
    
    function eliminar($id){
        $per = new Tipoinstitucion();
        
        if($per->delete($id)){
            Flash::valid("Se eliminó correctamente");
            Router::redirect("institucion/index");
        }
    }
    
}
