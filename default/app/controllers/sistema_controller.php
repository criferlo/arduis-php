<?
View::template("template_sistema");

//controlador de inicio de sistema
class SistemaController extends AppController{


	//pantalla de bienvenida al sistema arduis
	function index(){
                if(!Auth::is_valid()){
                    Router::redirect("sesion/index");
                }
                               
		Flash::info("ARDUIS-PHP Internacionalizacion");
	}

}

?>