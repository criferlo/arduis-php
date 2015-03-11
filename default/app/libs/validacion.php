<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of validacion
 *
 * @author cristhianlombana
 */
class Validacion {
//put your code here



    /**
     * Validacion del lado del cliente
     *
     * Archivo que funciones que validan el formulario con JavaScript a partir de el archivo LiveValidation .js
     * */

    /**
     * cargar()
     *
     * @param mixed $name
     *  @param mixed $mensaje
     *
     * Funcion para comenzar la validacion
     */
    function cargar($name, $obligatorio) {
        echo "<script type='text/javascript'>";
        echo "var " . $name . " = new LiveValidation('" . $name . "');";
        if ($obligatorio):
            echo "$name.add( Validate.Presence);";
        endif;
    }

    /**
     * presencia()
     *
     * @param mixed $name
     *  @param mixed $mensaje
     *
     * Funcion para la presencia de valor obligatorio
     */
    function presencia($name, $mensaje) {
        echo "<script type='text/javascript'>";
        echo "var " . $name . " = new LiveValidation('" . $name . "');";
        if (empty($mensaje)):
            echo "$name.add( Validate.Presence);";
        else:
            echo "$name.add( Validate.Presence, {failureMessage: '$mensaje!'});";
        endif;
        echo "</script>";
    }

    /**
     * formPresencia()
     *
     * @param mixed $arreglo
     * @param mixed $mensaje
     *
     * Funcion para la presencia de valor de varios elementos a la vez este metodo lo dejo de ultimo
     */
    function formPresencia($arreglo, $mensaje) {
        echo "<script type='text/javascript'>";
        foreach ($arreglo as $name) {
            echo "var " . $name . " = new LiveValidation('" . $name . "');";
            if (empty($mensaje)):
                echo "$name.add( Validate.Presence);";
            else:
                echo "$name.add( Validate.Presence, {failureMessage: '$mensaje!'});";
            endif;
        }
        echo "</script>";
    }

    /**
     * letras()
     *
     * @param mixed $name
     * @param mixed $obligatorio
     * @param mixed $mensaje
     *
     * Funcion para la presencia de solo letras
     */
    function letras($name, $obligatorio, $mensaje) {
        echo "<script type='text/javascript'>";
        echo "var " . $name . " = new LiveValidation('" . $name . "');";
        if ($obligatorio):
            echo "$name.add( Validate.Presence);";
        endif;
        if (empty($mensaje)):
            echo "$name.add( Validate.Letras);";
        else:
            echo "$name.add( Validate.Letras, {failureMessage: '$mensaje!'});";
        endif;
        echo "</script>";
    }

    /**
     * coincidencia()
     *
     * @param mixed $name
     * @param mixed $frase
     * @param mixed $obligatorio
     * @param mixed $mensaje
     *
     * Funcion para la coincidencia con algo pasado
     */
    function coincidencia($name, $frase, $obligatorio, $mensaje) {
        echo "<script type='text/javascript'>";
        echo "var " . $name . " = new LiveValidation('" . $name . "');";
        if ($obligatorio):
            echo "$name.add( Validate.Presence);";
        endif;
        if (empty($mensaje)):
            echo "$name.add( Validate.Format, { pattern: /" . $frase . "/i } );";
        else:
            echo "$name.add( Validate.Format, { pattern: /" . $frase . "/i, failureMessage: '$mensaje!'} );";
        endif;
        echo "</script>";
    }

    /*     * ************************************************************************************
     * Funciones para numeros
     * ************************************************************************************* */

    /**
     * numero()
     *
     * @param mixed $name
     * @param mixed $obligatorio
     * @param mixed $mensaje
     *
     * Funcion para que solo entren numeros
     */
    function numero($name, $obligatorio, $mensaje) {
        echo "<script type='text/javascript'>";
        echo "var " . $name . " = new LiveValidation('" . $name . "');";
        if ($obligatorio):
            echo "$name.add( Validate.Presence);";
        endif;
        if (empty($mensaje)):
            echo "$name.add( Validate.Numericality );";
        else:
            echo "$name.add( Validate.Numericality, {notANumberMessage: '$mensaje!'});";
        endif;
        echo "</script>";
    }

    /**
     * numeroEntero()
     *
     * @param mixed $name
     * @param mixed $obligatorio
     * @param mixed $mensaje
     *
     * Funcion para que solo entren numeros enteros
     */
    function numeroEntero($name, $obligatorio, $mensaje) {
        echo "<script type='text/javascript'>";
        echo "var " . $name . " = new LiveValidation('" . $name . "');";
        if ($obligatorio):
            echo "$name.add( Validate.Presence);";
        endif;
        if (empty($mensaje)):
            echo "$name.add( Validate.Numericality, { onlyInteger: true } );";
        else:
            echo "$name.add( Validate.Numericality, { onlyInteger: true,  notAnIntegerMessage: '$mensaje!'} );";
        endif;
        echo "</script>";
    }

    /**
     * esteNumero()
     *
     * @param mixed $name
     * @param mixed $numero
     * @param mixed $obligatorio
     * @param mixed $mensaje
     *
     * Funcion para que el valor concida con el numero mandado
     */
    function esteNumero($name, $numero, $obligatorio, $mensaje) {
        echo "<script type='text/javascript'>";
        echo "var " . $name . " = new LiveValidation('" . $name . "');";
        if ($obligatorio):
            echo "$name.add( Validate.Presence);";
        endif;
        if (empty($mensaje)):
            echo "$name.add( Validate.Numericality, { is: " . $numero . " } );";
        else:
            echo "$name.add( Validate.Numericality, { is: " . $numero . ", wrongNumberMessage: '$mensaje!'} );";
        endif;


        echo "</script>";
    }

    /**
     * numeroMinimo()
     *
     * @param mixed $name
     * @param mixed $numero
     * @param mixed $obligatorio
     * @param mixed $mensaje
     *
     * Funcion para que el valor sea mayor que el numero mandado
     */
    function numeroMinimo($name, $numero, $obligatorio, $mensaje) {
        echo "<script type='text/javascript'>";
        echo "var " . $name . " = new LiveValidation('" . $name . "');";
        if ($obligatorio):
            echo "$name.add( Validate.Presence);";
        endif;
        if (empty($mensaje)):
            echo "$name.add( Validate.Numericality, { minimum: " . $numero . " } );";
        else:
            echo "$name.add( Validate.Numericality, { minimum: " . $numero . ",  tooLowMessage: '$mensaje!'} );";
        endif;
        echo "</script>";
    }

    /**
     * numeroMaximo()
     *
     * @param mixed $name
     * @param mixed $numero
     * @param mixed $obligatorio
     * @param mixed $mensaje
     *
     * Funcion para que el valor sea menor que el numero mandado
     */
    function numeroMaximo($name, $numero, $obligatorio, $mensaje) {
        echo "<script type='text/javascript'>";
        echo "var " . $name . " = new LiveValidation('" . $name . "');";
        if ($obligatorio):
            echo "$name.add( Validate.Presence);";
        endif;
        if (empty($mensaje)):
            echo "$name.add( Validate.Numericality, { maximum: " . $numero . " } );";
        else:
            echo "$name.add( Validate.Numericality, { maximum: " . $numero . ", tooHighMessage: '$mensaje!'} );";
        endif;
        echo "</script>";
    }

    /**
     * numeroRango()
     *
     * @param mixed $name
     * @param mixed $min
     * @param mixed $max
     * @param mixed $obligatorio
     * @param mixed $mensaje
     *
     * Funcion para que el valor este entre los rangos de los numeros mandados
     */
    function numeroRango($name, $min, $max, $obligatorio, $mensaje) {
        echo "<script type='text/javascript'>";
        echo "var " . $name . " = new LiveValidation('" . $name . "');";
        if ($obligatorio):
            echo "$name.add( Validate.Presence);";
        endif;
        if (empty($mensaje)):
            echo "$name.add( Validate.Numericality, { minimum: " . $min . ",  } );";
            echo "$name.add( Validate.Numericality, { maximum: " . $max . " } );";
        else:
            echo "$name.add( Validate.Numericality, { minimum: " . $min . ", tooLowMessage: '$mensaje!'} );";
            echo "$name.add( Validate.Numericality, { maximum: " . $max . ", tooHighMessage: '$mensaje!'} );";
        endif;
        echo "</script>";
    }

    /**
     * numeroRangoEntero()
     *
     * @param mixed $name
     * @param mixed $min
     * @param mixed $max
     * @param mixed $obligatorio
     * @param mixed $mensaje
     *
     * Funcion para que el valor este entre los rangos de los numeros mandados y sea entero
     */
    function numeroRangoEntero($name, $min, $max, $obligatorio, $mensaje) {
        echo "<script type='text/javascript'>";
        echo "var " . $name . " = new LiveValidation('" . $name . "');";
        if ($obligatorio):
            echo "$name.add( Validate.Presence);";
        endif;
        if (empty($mensaje)):
            echo "$name.add( Validate.Numericality, { minimum: " . $min . " } );";
            echo "$name.add( Validate.Numericality, { maximum: " . $max . " } );";
            echo "$name.add( Validate.Numericality, { onlyInteger: true } );";
        else:
            echo "$name.add( Validate.Numericality, { minimum: " . $min . ", tooLowMessage: '$mensaje!'} );";
            echo "$name.add( Validate.Numericality, { maximum: " . $max . ", tooHighMessage: '$mensaje!'} );";
            echo "$name.add( Validate.Numericality, { onlyInteger: true, notAnIntegerMessage: '$mensaje!'} );";
        endif;
        echo "</script>";
    }

    /*     * ************************************************************************************
     * Funciones para tamaÒo la longitud
     * ************************************************************************************* */

    /**
     * longitud()
     *
     * @param mixed $name
     * @param mixed $longitud
     * @param mixed $obligatorio
     * @param mixed $mensaje
     *
     * Funcion para la longitud del valor
     */
    function longitud($name, $longitud, $obligatorio, $mensaje) {
        echo "<script type='text/javascript'>";
        echo "var " . $name . " = new LiveValidation('" . $name . "');";
        if ($obligatorio):
            echo "$name.add( Validate.Presence);";
        endif;
        if (empty($mensaje)):
            echo "$name.add( Validate.Length, { is: " . $longitud . " } );";
        else:
            echo "$name.add( Validate.Length, { is: " . $longitud . ", wrongLengthMessage: '$mensaje!'} );";
        endif;
        echo "</script>";
    }

    /**
     * longitudMinima()
     *
     * @param mixed $name
     * @param mixed $longitud
     * @param mixed $obligatorio
     * @param mixed $mensaje
     *
     * Funcion para la longitud minima del valor
     */
    function longitudMinima($name, $longitud, $obligatorio, $mensaje) {
        echo "<script type='text/javascript'>";
        echo "var " . $name . " = new LiveValidation('" . $name . "');";
        if ($obligatorio):
            echo "$name.add( Validate.Presence);";
        endif;
        if (empty($mensaje)):
            echo "$name.add( Validate.Length, { minimum: " . $longitud . " } );";
        else:
            echo "$name.add( Validate.Length, { minimum: " . $longitud . ", tooShortMessage: '$mensaje!'} );";
        endif;
        echo "</script>";
    }

    /**
     * longitudMaxima()
     *
     * @param mixed $name
     * @param mixed $longitud
     * @param mixed $obligatorio
     * @param mixed $mensaje
     *
     * Funcion para la longitud maxima del valor
     */
    function longitudMaxima($name, $longitud, $obligatorio, $mensaje) {
        echo "<script type='text/javascript'>";
        echo "var " . $name . " = new LiveValidation('" . $name . "');";
        if ($obligatorio):
            echo "$name.add( Validate.Presence);";
        endif;
        if (empty($mensaje)):
            echo "$name.add( Validate.Length, { maximum: " . $longitud . " } );";
        else:
            echo "$name.add( Validate.Length, { maximum: " . $longitud . ", tooLongMessage: '$mensaje!'} );";
        endif;
        echo "</script>";
    }

    /**
     * longitudRango()
     *
     * @param mixed $name
     * @param mixed $min
     * @param mixed $max
     * @param mixed $obligatorio
     * @param mixed $mensaje
     *
     * Funcion para que la longitud este entre el rango mandado
     */
    function longitudRango($name, $min, $max, $obligatorio, $mensaje) {
        echo "<script type='text/javascript'>";
        echo "var " . $name . " = new LiveValidation('" . $name . "');";
        if ($obligatorio):
            echo "$name.add( Validate.Presence);";
        endif;
        if (empty($mensaje)):
            echo "$name.add( Validate.Length, { minimum: " . $min . ", maximum: " . $max . " } );";
        else:
            echo "$name.add( Validate.Length, { minimum: " . $min . ", tooShortMessage: '$mensaje!', maximum: " . $max . ", tooLongMessage: '$mensaje!'} );";
        endif;


        echo "</script>";
    }

    /*     * ************************************************************************************
     * Funciones para la inclusion
     * ************************************************************************************* */

    /**
     * incluir()
     *
     * @param mixed $name
     * @param mixed $lista
     * @param mixed $obligatorio
     * @param mixed $mensaje
     *
     * Funcion para la inclusion de valores de un select
     *
     */
    function incluir($name, $lista, $obligatorio, $mensaje) {
        $lista = json_encode(array_values($lista));

        echo "<script type='text/javascript'>";
        echo "var " . $name . " = new LiveValidation('" . $name . "');";
        if (empty($mensaje)):
            echo "$name.add( Validate.Inclusion, { within: " . $lista . " } );";
        else:
            echo "$name.add( Validate.Inclusion, { within: " . $lista . ", failureMessage: '$mensaje!'} );";
        endif;
        if ($obligatorio):
            echo "$name.add( Validate.Presence);";
        endif;
        echo "</script>";
    }

    /*     * ************************************************************************************
     * Funciones para aceptar
     * ************************************************************************************* */

    /**
     * chequear()
     *
     * @param mixed $name
     * @param mixed $mensaje
     *
     * Funcion para aceptar un checkbox
     * No sirve para los radios
     */
    function chequear($name, $mensaje) {
        echo "<script type='text/javascript'>";
        echo "var " . $name . " = new LiveValidation('" . $name . "');";
        if (empty($mensaje)):
            echo "$name.add( Validate.Acceptance );";
        else:
            echo "$name.add( Validate.Acceptance, {failureMessage: '$mensaje!'});";
        endif;
        echo "</script>";
    }

    /*     * ************************************************************************************
     * Funciones para confirmacion de igualdad de contraseÒas
     * ************************************************************************************* */

    /**
     * confirmar()
     *
     * @param mixed $original
     * @param mixed $copia
     * @param mixed $longitud
     * @param mixed $mensaje
     *
     * Funcion para la confirmacion de contraseÒas para que sean iguales
     */
    function confirmar($original, $copia, $longitud, $mensaje) {
        echo "<script type='text/javascript'>";
        echo "var " . $original . " = new LiveValidation('" . $original . "');";
        echo "var " . $copia . " = new LiveValidation('" . $copia . "');";
        echo "$copia.add( Validate.Presence);";
        echo "$original.add( Validate.Presence);";
        if (empty($mensaje)):
            echo "$copia.add( Validate.Confirmation, { match: '" . $original . "'} );";
            echo "$copia.add( Validate.Length, { minimum: " . $longitud . "} );";
            echo "$original.add( Validate.Length, { minimum: " . $longitud . "} );";
        else:
            echo "$copia.add( Validate.Confirmation, { match: '" . $original . "', failureMessage: '$mensaje!'} );";
            echo "$copia.add( Validate.Length, { minimum: " . $longitud . ", tooShortMessage: '$mensaje!'} );";
            echo "$original.add( Validate.Length, { minimum: " . $longitud . ", tooShortMessage: '$mensaje!'} );";
        endif;
        echo "</script>";
    }

    /*     * ************************************************************************************
     * Funciones para validar correo
     * ************************************************************************************* */

    /**
     * correo()
     *
     * @param mixed $name
     * @param mixed $obligatorio
     * @param mixed $mensaje
     *
     * Funcion para validar correo
     */
    function correo($name, $obligatorio, $mensaje) {
        echo "<script type='text/javascript'>";
        echo "var " . $name . " = new LiveValidation('" . $name . "');";
        if ($obligatorio):
            echo "$name.add( Validate.Presence);";
        endif;
        if (empty($mensaje)):
            echo "$name.add( Validate.Email );";
        else:
            echo "$name.add( Validate.Email, {failureMessage: '$mensaje!'});";
        endif;
        echo "</script>";
    }

    /*     * ************************************************************************************
     * Funciones para validar el tiempo
     * ************************************************************************************* */

    /**
     * hora()
     *
     * @param mixed $name
     * @param mixed $obligatorio
     * @param mixed $mensaje
     *
     * Funcion para validar el formato de la hora(00:00)
     */
    function hora($name, $obligatorio, $mensaje) {
        echo "<script type='text/javascript'>";
        echo "var " . $name . " = new LiveValidation('" . $name . "');";
        if ($obligatorio):
            echo "$name.add( Validate.Presence);";
        endif;
        if (empty($mensaje)):
            echo "$name.add( Validate.Hora );";
        else:
            echo "$name.add( Validate.Hora, {failureMessage: '$mensaje!'});";
        endif;
        echo "</script>";
    }

    /**
     * duracion()
     *
     * @param mixed $name
     * @param mixed $obligatorio
     * @param mixed $mensaje
     *
     * Funcion para validar el formato de duracion de algo(00:00:00)
     */
    function duracion($name, $obligatorio, $mensaje) {
        echo "<script type='text/javascript'>";
        echo "var " . $name . " = new LiveValidation('" . $name . "');";
        if ($obligatorio):
            echo "$name.add( Validate.Presence);";
        endif;
        if (empty($mensaje)):
            echo "$name.add( Validate.Duracion );";
        else:
            echo "$name.add( Validate.Duracion, {failureMessage: '$mensaje!'});";
        endif;


        echo "</script>";
    }

    /*     * ************************************************************************************
     * Funciones para validar letras y numeros
     * ************************************************************************************* */

    /**
     * numeroLetra()
     *
     * @param mixed $name
     * @param mixed $obligatorio
     * @param mixed $mensaje
     *
     * Funcion para validar que solo sean letras o numeros
     */
    function numeroLetra($name, $obligatorio, $mensaje) {
        echo "<script type='text/javascript'>";
        echo "var " . $name . " = new LiveValidation('" . $name . "');";
        if ($obligatorio):
            echo "$name.add( Validate.Presence);";
        endif;
        if (empty($mensaje)):
            echo "$name.add( Validate.SLyN );";
        else:
            echo "$name.add( Validate.SLyN, {failureMessage: '$mensaje!'});";
        endif;


        echo "</script>";
    }

    /*     * ************************************************************************************
     * Funciones para validar la fecha
     * ************************************************************************************* */

    /**
     * fecha()
     *
     * @param mixed $name
     * @param mixed $obligatorio
     * @param mixed $mensaje
     *
     * Funcion para validar que el formato de fecha este correcto(00/00/0000)
     */
    function fecha($name, $boton, $obligatorio, $mensaje) {
        echo "<script type='text/javascript'>";
        echo "
			Calendar.setup({
        inputField     :    '" . $name . "',     // id of the input field
        ifFormat       :    '%d-%m-%Y',      // format of the input field
        button         :    '" . $boton . "',  // trigger for the calendar (button ID)
        align          :    'B2',           // alignment (defaults to 'Bl')
        singleClick    :    true
    	});
		";
        echo "var " . $name . " = new LiveValidation('" . $name . "');";
        if ($obligatorio):
            echo "$name.add( Validate.Presence);";
        endif;
        if (empty($mensaje)):
            echo "$name.add( Validate.Fecha );";
        else:
            echo "$name.add( Validate.Fecha, {failureMessage: '$mensaje!'} );"; //asi es komo se ponen mensajes personalizados
        endif;
        echo "</script>";
    }

}
?>
