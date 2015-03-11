 var LiveValidation = function(element, optionsObj){
  	this.initialize(element, optionsObj);
}
LiveValidation.TEXTAREA 		= 1;
LiveValidation.TEXT 			    = 2;
LiveValidation.PASSWORD 		= 3;
LiveValidation.CHECKBOX 		= 4;
LiveValidation.SELECT = 5;
LiveValidation.massValidate = function(validations){
  var returnValue = true;
	for(var i = 0, len = validations.length; i < len; ++i ){
		var valid = validations[i].validate();
		if(returnValue) returnValue = valid;
	}
	return returnValue;
}
LiveValidation.prototype = {

    validClass: 'LV_valid',
    invalidClass: 'LV_invalid',
    messageClass: 'LV_validation_message',
    validFieldClass: 'LV_valid_field',
    invalidFieldClass: 'LV_invalid_field',
    initialize: function(element, optionsObj){
      var self = this;
      if(!element) throw new Error("LiveValidation::initialize - No element reference or element id has been provided!");
    	this.element = element.nodeName ? element : document.getElementById(element);
    	if(!this.element) throw new Error("LiveValidation::initialize - No element with reference or id of '" + element + "' exists!");      
    	this.validations = [];
      this.elementType = this.getElementType();
      this.form = this.element.form;      
    	var options = optionsObj || {};
    	this.validMessage = options.validMessage || 'Ok!';
    	this.insertAfterWhatNode = options.insertAfterWhatNode || this.element;
      this.onValid = options.onValid || function(){ this.insertMessage(this.createMessageSpan()); this.addFieldClass(); };
      this.onInvalid = options.onInvalid || function(){ this.insertMessage(this.createMessageSpan()); this.addFieldClass(); };	
    	this.onlyOnBlur =  options.onlyOnBlur || false;
    	this.wait = options.wait || 0;
      this.onlyOnSubmit = options.onlyOnSubmit || false;      
      if(this.form){
        this.formObj = LiveValidationForm.getInstance(this.form);
        this.formObj.addField(this);
      }      
    	this.element.onfocus = function(e){ self.doOnFocus(); }
      if(!this.onlyOnSubmit){
        switch(this.elementType){
          case LiveValidation.CHECKBOX:
            this.element.onclick = function(e){ self.validate(); }         
          case LiveValidation.SELECT:
            this.element.onchange = function(e){ self.validate(); }
            break;
          default:
            if(!this.onlyOnBlur) this.element.onkeyup = function(e){ self.deferValidation(); }
      	    this.element.onblur = function(e){ self.doOnBlur(); }
        }
      }
    },
    add: function(validationFunction, validationParamsObj){
      this.validations.push( {type: validationFunction, params: validationParamsObj || {} } );
      return this;
    },
    deferValidation: function(e){
      if(this.wait >= 300) this.removeMessageAndFieldClass();
    	var self = this;
      if(this.timeout) clearTimeout(self.timeout);
      this.timeout = setTimeout( function(){ self.validate() }, self.wait); 
    },
    doOnBlur: function(e){
      this.focused = false;
      this.validate(e);
    },
    doOnFocus: function(e){
      this.focused = true;
      this.removeMessageAndFieldClass()
    },
    getElementType: function(){
      switch(true){
        case (this.element.nodeName == 'TEXTAREA'):
          return LiveValidation.TEXTAREA;
        case (this.element.nodeName == 'INPUT' && this.element.type == 'text'):
        	return LiveValidation.TEXT;
        case (this.element.nodeName == 'INPUT' && this.element.type == 'password'):
        	return LiveValidation.PASSWORD;
        case (this.element.nodeName == 'INPUT' && this.element.type == 'checkbox'):
        	return LiveValidation.CHECKBOX;
        case (this.element.nodeName == 'SELECT'):
          return LiveValidation.SELECT;
        case (this.element.nodeName == 'INPUT'):
        	throw new Error('LiveValidation::getElementType - Cannot use LiveValidation on an ' + this.element.type + ' input!');
        default:
        	throw new Error('LiveValidation::getElementType - El elemento debe de ser un input, select, o textarea!');
      }
    },
    doValidations: function(){
      	this.validationFailed = false;
      	for(var i = 0, len = this.validations.length; i < len; ++i){
    	 	var validation = this.validations[i];
    		switch(validation.type){
    		   	case Validate.Presence:
                case Validate.Confirmation:
                case Validate.Acceptance:
    		   		this.displayMessageWhenEmpty = true;
    		   		this.validationFailed = !this.validateElement(validation.type, validation.params); 
    				break;
    		   	default:
    		   		this.validationFailed = !this.validateElement(validation.type, validation.params);
    		   		break;
    		}
    		if(this.validationFailed) return false;	
    	}
    	this.message = this.validMessage;
    	return true;
    },
    validateElement: function(validationFunction, validationParamsObj){
      	var value = (this.elementType == LiveValidation.SELECT) ? this.element.options[this.element.selectedIndex].value : this.element.value;     
        if(validationFunction == Validate.Acceptance){
    	    if(this.elementType != LiveValidation.CHECKBOX) throw new Error('LiveValidation::validateElement - Para aceptar el elemento a validar debe de ser un checkbox!');
    		value = this.element.checked;
    	}
        var isValid = true;
      	try{    
    		validationFunction(value, validationParamsObj);
    	} catch(error) {
    	  	if(error instanceof Validate.Error){
    			if( value !== '' || (value === '' && this.displayMessageWhenEmpty) ){
    				this.validationFailed = true;
    				this.message = error.message;
    				isValid = false;
    			}
    		}else{
    		  	throw error;
    		}
    	}finally{
    	    return isValid;
        }
    },
    validate: function(){
      var isValid = this.doValidations();
    	if(isValid){
    		this.onValid();
    		return true;
    	}else{
    	  	this.onInvalid();
    	  	return false;
    	}
    },
    createMessageSpan: function(){
        var span = document.createElement('span');        
        var textNode = document.createTextNode(this.message);
      	span.appendChild(textNode);      	
        return span;
    },
    insertMessage: function(elementToInsert){
      	this.removeMessage();
      	if( (this.displayMessageWhenEmpty && (this.elementType == LiveValidation.CHECKBOX || this.element.value == ''))
    	  || this.element.value != '' ){
            var className = this.validationFailed ? this.invalidClass : this.validClass;
    	  	elementToInsert.className += ' ' + this.messageClass + ' ' + className;
            if(this.insertAfterWhatNode.nextSibling){
    		  		this.insertAfterWhatNode.parentNode.insertBefore(elementToInsert, this.insertAfterWhatNode.nextSibling);
    		}else{
    			    this.insertAfterWhatNode.parentNode.appendChild(elementToInsert);
    	    }
    	}
    },
    addFieldClass: function(){
        this.removeFieldClass();
        if(!this.validationFailed){
            if(this.displayMessageWhenEmpty || this.element.value != ''){
                if(this.element.className.indexOf(this.validFieldClass) == -1) this.element.className += ' ' + this.validFieldClass;
            }
        }else{
            if(this.element.className.indexOf(this.invalidFieldClass) == -1) this.element.className += ' ' + this.invalidFieldClass;
        }
    },
    removeMessage: function(){
    	var nextEl;
    	var el = this.insertAfterWhatNode;
    	while(el.nextSibling){
    	    if(el.nextSibling.nodeType === 1){
    		  	nextEl = el.nextSibling;
    		  	break;
    		}
    		el = el.nextSibling;
    	}
      	if(nextEl && nextEl.className.indexOf(this.messageClass) != -1) this.insertAfterWhatNode.parentNode.removeChild(nextEl);
    },
    removeFieldClass: function(){
      if(this.element.className.indexOf(this.invalidFieldClass) != -1) this.element.className = this.element.className.split(this.invalidFieldClass).join('');
      if(this.element.className.indexOf(this.validFieldClass) != -1) this.element.className = this.element.className.split(this.validFieldClass).join(' ');
    },
    removeMessageAndFieldClass: function(){
      this.removeMessage();
      this.removeFieldClass();
    }
} 
var LiveValidationForm = function(element){
  this.initialize(element);
}
LiveValidationForm.getInstance = function(element){
  if(!element.id) element.id = 'formId_' + new Date().valueOf();
  if(!window['LiveValidationForm_' + element.id]) window['LiveValidationForm_' + element.id] = new LiveValidationForm(element);
  return window['LiveValidationForm_' + element.id];
}
LiveValidationForm.prototype = {
  initialize: function(element){
    this.element = element;
    this.fields = [];
    var self = this;
    this.element.onsubmit = function(){
      return LiveValidation.massValidate(self.fields);
    }
  },
  addField: function(newField){
    this.fields.push(newField);
  }   
}
var Validate = {
    Presence: function(value, paramsObj){
      	var paramsObj = paramsObj || {};
    	var message = paramsObj.failureMessage || "No puede estar vacio!";
    	if(value === '' || value === null || value === undefined){     	  	
			  Validate.fail(message);			 
    	}
    	return true;
    },
    Numericality: function(value, paramsObj){
        var suppliedValue = value;
        var value = Number(value);
    	var paramsObj = paramsObj || {};    	
        var minimum = ((paramsObj.minimum) || (paramsObj.minimum == 0)) ? paramsObj.minimum : null;;
        var maximum = ((paramsObj.maximum) || (paramsObj.maximum == 0)) ? paramsObj.maximum : null;
    	var is = ((paramsObj.is) || (paramsObj.is == 0)) ? paramsObj.is : null;
        var notANumberMessage = paramsObj.notANumberMessage || "Debe de ser un numero!";
        var notAnIntegerMessage = paramsObj.notAnIntegerMessage || "Debe de ser un numero de tipo entero!";
    	var wrongNumberMessage = paramsObj.wrongNumberMessage || "Debe ser el numero " + is + "!";
    	var tooLowMessage = paramsObj.tooLowMessage || "El numero no debe de ser menor que " + minimum + "!";
    	var tooHighMessage = paramsObj.tooHighMessage || "El numero no debe de ser mayor que " + maximum + "!";
        if(suppliedValue.charAt(0) == ' '){
			  Validate.fail(notANumberMessage);
			  }		  
		if (!isFinite(value)) Validate.fail(notANumberMessage);
        if (paramsObj.onlyInteger && (/\.0+$|\.$/.test(String(suppliedValue))  || value != parseInt(value)) ) Validate.fail(notAnIntegerMessage);
    	switch(true){
    	  	case (is !== null):
    	  		if( value != Number(is) ) Validate.fail(wrongNumberMessage);
    			break;
    	  	case (minimum !== null && maximum !== null):
    	  		Validate.Numericality(value, {tooLowMessage: tooLowMessage, minimum: minimum});
    	  		Validate.Numericality(value, {tooHighMessage: tooHighMessage, maximum: maximum});
    	  		break;
    	  	case (minimum !== null):
    	  		if( value < Number(minimum) ) Validate.fail(tooLowMessage);
    			break;
    	  	case (maximum !== null):
    	  		if( value > Number(maximum) ) Validate.fail(tooHighMessage);
    			break;
    	}    	
    	return true;
    },
    Format: function(value, paramsObj){
      	var value = String(value);
    	var paramsObj = paramsObj || {};
    	var message = paramsObj.failureMessage || "No es valido!";
      	if(value.charAt(0) == ' '){
			  Validate.fail(message);
			  }
		var pattern = paramsObj.pattern || /./;
    	if(!pattern.test(value) /* && value != ''*/ ){ 
    	  	Validate.fail(message);
    	}
    	return true;
    },
	SLyN: function(value, paramsObj){
    	var paramsObj = paramsObj || {};
    	var message = paramsObj.failureMessage || "Debe de contener solo numeros o letras!";
    	if(value.charAt(0) == ' '){
			  Validate.fail(message);
			  }
		Validate.Format(value, { failureMessage: message, pattern: /^([a-zA-Z0-9 ]{1,})$/i } );
    	return true;
    },
	Letras: function(value, paramsObj){
    	var paramsObj = paramsObj || {};
    	var message = paramsObj.failureMessage || "Debe de contener solo letras!";
    	if(value.charAt(0) == ' '){
			  Validate.fail(message);
			  }
		Validate.Format(value, { failureMessage: message, pattern: /^([a-zA-Z ]{1,})$/i } );
    	return true;
    },
    Email: function(value, paramsObj){
    	var paramsObj = paramsObj || {};
    	var message = paramsObj.failureMessage || "Debe de ser un correo valido!";
    	if(value.charAt(0) == ' '){
			  Validate.fail(message);
			  }
		Validate.Format(value, { failureMessage: message, pattern: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i } );
    	return true;
    },
    Hora: function(value, paramsObj){
    	var paramsObj = paramsObj || {};    	
		var hora = value.substring(0,2);
    	var minuto = value.substring(3);
    	var simbolo = value.substring(2,3);    	
		var message = paramsObj.failureMessage || "Debe de ser una hora valida (formato militar)!";
		if(value.charAt(0) == ' '){ Validate.fail(message); }
		if(hora > 23){ Validate.fail("La hora no debe ser mayor de 23");}
    	if(simbolo != ":"){Validate.fail("Separador (:)");}
    	if(minuto > 59){ Validate.fail("Los minutos no deben ser mayor de 59");	}    	
    	Validate.Format(value, { failureMessage: message, pattern: /^([0-9]+):((?:[0-9]){2,})$/i } );    	
    	return true;
    },
    Fecha: function(value, paramsObj){
    	var paramsObj = paramsObj || {};    	
		var dia = value.substring(0,2);
    	var mes = value.substring(3,5);
    	var anno = value.substring(6);
    	var simbolo1 = value.substring(2,3);
    	var simbolo2 = value.substring(5,6);    	
		var message = paramsObj.failureMessage || "Debe de ser una fecha valida (00/00/0000)!";
		var message2 = paramsObj.failureMessage || "La fecha debe ser dada en  numeros";
		if(value.charAt(0) == ' '){ Validate.fail(message); }		
		Validate.Format(dia, { failureMessage: message2, pattern: /^([0-9])*$/} );
		Validate.Format(mes, { failureMessage: message2, pattern: /^([0-9])*$/} );
		Validate.Format(anno, { failureMessage: message2, pattern: /^([0-9])*$/} );		
		if(dia > 31 || dia < 1){Validate.fail(message);}
    	if (mes > 12 || mes < 1) {Validate.fail(message);}
    	if (anno < 1492) {Validate.fail(message);}
    	if(simbolo1 != "/"){Validate.fail("Separador (/)");}
    	if (simbolo2 != "/") {Validate.fail("Separador (/)");}    	    		
    	return true;
    },
    Duracion: function(value, paramsObj){
    	var paramsObj = paramsObj || {};    	
		var hora = value.substring(0,2);
    	var simbolo1 = value.substring(2,3);
		var minuto = value.substring(3,5);
    	var simbolo2 = value.substring(5,6);
    	var segundo = value.substring(6);    	
		var message = paramsObj.failureMessage || "Debe de ser un tiempo de duracion valido (00:00:00)!";
		if(value.charAt(0) == ' '){ Validate.fail(message); }
		if(hora > 99){ Validate.fail(message);}
    	if(simbolo1 != ":"){Validate.fail("Separador (:)");}
    	if(minuto > 99){	Validate.fail(message);}
		if(simbolo2 != ":"){	Validate.fail("Separador (:)");}
		if(segundo > 99){Validate.fail(message);}    	
    	Validate.Format(value, { failureMessage: message, pattern: /^([0-9]+):((?:[0-9]+):(?:[0-9]+){2,})$/i } );    	
    	return true;
    },
    Length: function(value, paramsObj){
    	var value = String(value);
    	var paramsObj = paramsObj || {};
        var minimum = ((paramsObj.minimum) || (paramsObj.minimum == 0)) ? paramsObj.minimum : null;
    	var maximum = ((paramsObj.maximum) || (paramsObj.maximum == 0)) ? paramsObj.maximum : null;
    	var is = ((paramsObj.is) || (paramsObj.is == 0)) ? paramsObj.is : null;
        var wrongLengthMessage = paramsObj.wrongLengthMessage || "Deben ser solo " + is + " caracteres!";
    	var tooShortMessage = paramsObj.tooShortMessage || "No debe de ser menor que " + minimum + " caracteres!";
    	var tooLongMessage = paramsObj.tooLongMessage || "No debe ser mayor que " + maximum + " caracteres!";
    	switch(true){
    	  	case (is !== null):
    	  		if( value.length != Number(is) ) Validate.fail(wrongLengthMessage);
    			break;
    	  	case (minimum !== null && maximum !== null):
    	  		Validate.Length(value, {tooShortMessage: tooShortMessage, minimum: minimum});
    	  		Validate.Length(value, {tooLongMessage: tooLongMessage, maximum: maximum});
    	  		break;
    	  	case (minimum !== null):
    	  		if( value.length < Number(minimum) ) Validate.fail(tooShortMessage);
    			break;
    	  	case (maximum !== null):
    	  		if( value.length > Number(maximum) ) Validate.fail(tooLongMessage);
    			break;
    		default:
    			throw new Error("Validate::Length - Length(s) to validate against must be provided!");
    	}
    	return true;
    },
    Inclusion: function(value, paramsObj){
    	var paramsObj = paramsObj || {};
    	var message = paramsObj.failureMessage || "Debe de estar incluido en la lista!";
    	
		if(paramsObj.allowNull && value == null) return true;
        if(!paramsObj.allowNull && value == null) Validate.fail(message)
		
		var list = paramsObj.within || [];
    	var found = false;
    	for(var i = 0, length = list.length; i < length; ++i){
    	  	if(list[i] == value) found = true;
			if(paramsObj.partialMatch){ 
                if(value.indexOf(list[i]) != -1) found = true;				
            }
    	}
    	if( (!paramsObj.exclusion && !found) || (paramsObj.exclusion && found) ) Validate.fail(message);
    	return true;
    },
    Exclusion: function(value, paramsObj){
        var paramsObj = paramsObj || {};
    	paramsObj.failureMessage = paramsObj.failureMessage || "No debe de estar incluido en la lista!";
    	paramsObj.exclusion = true;
    	Validate.Inclusion(value, paramsObj);
        return true;
    },
    Confirmation: function(value, paramsObj){
      	if(!paramsObj.match) throw new Error("Validate::Confirmation - Error validating confirmation: Id of element to match must be provided!");
    	var paramsObj = paramsObj || {};
    	var message = paramsObj.failureMessage || "No coinciden los passwords!";
    	if(value.charAt(0) == ' '){
			  Validate.fail(message);
			  }
		var match = paramsObj.match.nodeName ? paramsObj.match : document.getElementById(paramsObj.match);
    	if(!match) throw new Error("Validate::Confirmation - There is no reference with name of, or element with id of '" + paramsObj.match + "'!");
    	if(value != match.value){ 
    	  	Validate.fail(message);
    	}
    	return true;
    },
    Acceptance: function(value, paramsObj){
      	var paramsObj = paramsObj || {};
    	var message = paramsObj.failureMessage || "Debe de marcarce!";
    	if(!value){ 
    	  	Validate.fail(message);
    	}
    	return true;
    },
    now: function(validationFunction, value, validationParamsObj){
      	if(!validationFunction) throw new Error("Validate::now - La funcion de validar debe ser provista!");
    	var isValid = true;
        try{    
    		validationFunction(value, validationParamsObj || {});
    	} catch(error) {
    		if(error instanceof Validate.Error){
    			isValid =  false;
    		}else{
    		 	throw error;
    		}
    	}finally{ 
            return isValid 
        }
    },
    fail: function(errorMessage){
            throw new Validate.Error(errorMessage);
    },    
    Error: function(errorMessage){
    	this.message = errorMessage;
    	this.name = 'ValidationError';
    }
}
