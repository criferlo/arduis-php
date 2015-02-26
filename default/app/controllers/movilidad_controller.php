<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of docenteshacia_controller
 *
 * @author cristhian
 */
//formularios para docentes de la universidad movilizados hacia 

Load::models("Movilidad","Persona","Tipociudad","Tipopais","Tipomovilidad");
View::template("template_sistema");
class MovilidadController extends AppController {
    //put your code here
    
    function index($page=1){
         $per = new Movilidad();
        //$this->arrPersona = array();
        $consulta=null;
        
        if(!empty(Input::post("busqueda"))){
          
                
                if(Input::post("comboBusqueda")=="1"){
                    $consulta="tiposemestre_id=".Input::post("busqueda");
                }
            
        }
                
        $this->arrMovilidad =  $per->paginar($consulta,$page);
    }
}
