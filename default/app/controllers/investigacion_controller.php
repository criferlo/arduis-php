<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of investigacion_controller
 *
 * @author cristhian
 */
View::template("template_sistema");
Load::models("Investigacion","Tipoestadoinvestigacion","Archivo","Tiposemestre","Usuario");
class InvestigacionController extends AppController {
    
    function index($page = 1) {
        $per = new Investigacion();
        //$this->arrPersona = array();
        $consulta = null;

        if (!empty(Input::post("busqueda"))) {


            if (Input::post("comboBusqueda") == "0") {
                 $consulta = "titulo like '%" . Input::post("busqueda")."%'";
            }
        }

        $this->arrInvestigacion = $per->paginar($consulta, $page);
    }
    
    function nuevo() {
        if (Input::hasPost("tipoestadoinvestigacion_id")) {


            $per = new Investigacion();
            $per->fechafin = Input::post("fechafin");
            $per->fechafinesperada = Input::post("fechafinesperada");
            $per->fechainicio = Input::post("fechainicio");
            $per->tipoestadoinvestigacion_id = Input::post("tipoestadoinvestigacion_id");
            $per->tiposemestre_id = Input::post("tiposemestre_id");
            $per->titulo= Input::post("titulo");
            $per->registradopor = Auth::get("nombre");
            
            $usu = new Usuario();
            $usu->find_first(Auth::get("id"));
            $per->programaqueregistra_id = $usu->tipoprograma_id;

            $archivo = Upload::factory("archivo");
            if ($archivo->isUploaded()) {

                $arc = new Archivo();
                $arc->nombre = $archivo->saveRandom();
                $arc->save();
                $per->archivo_id = $arc->id;
            }



            if ($per->save()) {
                Flash::valid("Se grabó la investigación correctamente");
                Router::redirect("investigacion/index");
            }
        }
    }
    
    function editar($id) {
        $this->per = new Investigacion();
        $this->per->find_first($id);
        $this->id = $id;

        if (Input::hasPost("tiposemestre_id")) {


            $per = new Investigacion();
            $per->find_first($id);
            $per->fechafin = Input::post("fechafin");
            $per->fechafinesperada = Input::post("fechafinesperada");
            $per->fechainicio = Input::post("fechainicio");
            $per->tipoestadoinvestigacion_id = Input::post("tipoestadoinvestigacion_id");
            $per->tiposemestre_id = Input::post("tiposemestre_id");
            $per->titulo= Input::post("titulo");

            $archivo = Upload::factory("archivo");
            if ($archivo->isUploaded()) {

                $arc = new Archivo();
                $arc->nombre = $archivo->saveRandom();
                $arc->save();
                $per->archivo_id = $arc->id;
            }



            if ($per->update()) {
                Flash::valid("Se actualizó la investigación correctamente");
                Router::redirect("investigacion/index");
            }
        }
    }
    
     function eliminar($id){
        $per = new Investigacion();
        
        if($per->delete($id)){
            Flash::valid("Se eliminó correctamente");
            Router::redirect("investigacion/index");
        }
    } 
    
}
