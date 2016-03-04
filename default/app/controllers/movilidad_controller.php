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

Load::models("Tiposemestre","Movilidad", "Persona", "Tipociudad", "Tipopais", "Tipomovilidad", "Archivo", "Tipoinstitucion","Usuario");
View::template("template_sistema");

class MovilidadController extends AppController {

    //put your code here

    function index($page = 1) {
        $per = new Movilidad();
        //$this->arrPersona = array();
        $consulta = null;
        $tiposemestre = Input::post("tiposemestre_id");

        if (!empty($tiposemestre)) {


            if (Input::post("comboBusqueda") == "0") {
                 $consulta = "tiposemestre_id=" . Input::post("tiposemestre_id");
            }
        }

        $this->arrMovilidad = $per->paginar($consulta, $page);
    }

    function nuevo() {
        if (Input::hasPost("tiposemestre_id")) {


            $per = new Movilidad();
            $per->tipomovilidad_id = Input::post("tipomovilidad_id");
            $per->tiposemestre_id = Input::post("tiposemestre_id");
            $per->fechamovilidad = Input::post("fechamovilidad");
            $per->persona_id = Input::post("persona_id");
            $per->areaconocimiento = Input::post("areaconocimiento");
            $per->nombreevento = Input::post("evento");
            $per->tipoinstitucion_id = Input::post("tipoinstitucion_id");
            $per->tipofinanciacion_id = Input::post("tipofinanciacion_id");
            $per->descripcionexperiencia = Input::post("descripcionexperiencia");
            $per->descripcionexperiencia = Input::post("descripcionexperiencia");
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
                Flash::valid("Se grabó la movilidad correctamente");
                Router::redirect("movilidad/index");
            }
        }
    }

    function editar($id) {
        $this->per = new Movilidad();
        $this->per->find_first($id);
        $this->id = $id;

        if (Input::hasPost("tiposemestre_id")) {


            $per = new Movilidad();
            $per->find_first($id);
            $per->tipomovilidad_id = Input::post("tipomovilidad_id");
            $per->tiposemestre_id = Input::post("tiposemestre_id");
            $per->fechamovilidad = Input::post("fechamovilidad");
            $per->persona_id = Input::post("persona_id");
            $per->areaconocimiento = Input::post("areaconocimiento");
            $per->nombreevento = Input::post("evento");
            $per->tipoinstitucion_id = Input::post("tipoinstitucion_id");
            $per->tipofinanciacion_id = Input::post("tipofinanciacion_id");
            $per->descripcionexperiencia = Input::post("descripcionexperiencia");
            $per->descripcionexperiencia = Input::post("descripcionexperiencia");

            $archivo = Upload::factory("archivo");
            if ($archivo->isUploaded()) {

                $arc = new Archivo();
                $arc->nombre = $archivo->saveRandom();
                $arc->save();
                $per->archivo_id = $arc->id;
            }



            if ($per->update()) {
                Flash::valid("Se actualizó la movilidad correctamente");
                Router::redirect("movilidad/index");
            }
        }
    }
    
     function eliminar($id){
        $per = new Movilidad();
        
        if($per->delete($id)){
            Flash::valid("Se eliminó correctamente");
            Router::redirect("movilidad/index");
        }
    } 

}
