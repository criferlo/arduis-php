<?

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of persona_controller
 *
 * @author cristhian
 */


View::template("template_sistema");
Load::models("Persona","Archivo","Tipoidentificacion");
class PersonaController extends AppController {
    //put your code here
    function index($page=1){
        
        $per = new Persona();
        //$this->arrPersona = array();
        $consulta=null;
        
        if(!empty(Input::post("busqueda"))){
          
                if(Input::post("comboBusqueda")=="0"){
                    $consulta="nombrecompleto like '%".Input::post("busqueda")."%'";
                }
                else if(Input::post("comboBusqueda")=="1"){
                    $consulta="identificacion=".Input::post("busqueda");
                }
            
        }
                
        $this->arrPersona =  $per->paginar($consulta,$page);
        
    }
    
    function nuevo(){
        if(Input::hasPost("identificacion")){
            
            
            $per = new Persona();
            $per->identificacion=Input::post("identificacion");
            $per->tipoidentificacion_id=Input::post("tipoidentificacion_id");
            $per->tipopersona_id=Input::post("tipopersona_id");
            $per->nombrecompleto=Input::post("nombrecompleto");
            $per->tipoprograma_id=Input::post("tipoprograma_id");
            
            $archivo =  Upload::factory("archivo");
            if($archivo->isUploaded()){
                
                $arc = new Archivo();              
                $arc->nombre = $archivo->saveRandom();
                $arc->save();
                $per->archivo_id = $arc->id;
            }
            
            
            
            if($per->save()){
                 Flash::valid("Se grabó la persona correctamente");
                 Router::redirect("persona/index");
            }
           
        }
    }
    
    function editar($id){
        
        $this->per = new Persona();
        $this->per->find_first($id);
        $this->id=$id;
        
        if(Input::hasPost("identificacion")){
            
            
            $per = new Persona();
            $per->find_first($id);
            $per->identificacion=Input::post("identificacion");
            $per->tipoidentificacion_id=Input::post("tipoidentificacion_id");
            $per->tipopersona_id=Input::post("tipopersona_id");
            $per->nombrecompleto=Input::post("nombrecompleto");
            $per->tipoprograma_id=Input::post("tipoprograma_id");
            
            $archivo =  Upload::factory("archivo");
            if($archivo->isUploaded()){
                
                $arc = new Archivo();              
                $arc->nombre = $archivo->saveRandom();
                $arc->save();
                $per->archivo_id = $arc->id;
            }
            
            
            
            if($per->update()){
                 Flash::valid("Se actualizó la persona correctamente");
                 Router::redirect("persona/index");
            }
           
        }
    }
    
    function eliminar($id){
        $per = new Persona();
        
        if($per->delete($id)){
            Flash::valid("Se eliminó correctamente");
            Router::redirect("persona/index");
        }
    }
}
