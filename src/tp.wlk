//TODO agregar la excepcion en la energia menor que 0
object funcionesAuxiliares{
	method postEjecucion(unPou){
		if(unPou.cantidadDeAcciones() >= 5){
			unPou.setearCantidadDeAcciones(0)
			unPou.envejecer()
		}
		unPou.aumentarAccionesRealizadas()
	}
}



// Me traigo el Pou de la parte 1
class Pou{
	// Seteo las properties iniciales para que todos los pous cumplan con un estandar
	// Solo se van a sobreescribir las properties que le pasemos en el constructor
	var property edad = 3
	var property animo = "Feliz"
	var property salud = "Normal"
 	var property energia = self.energiaInicial() 
	const property comidas =[]
	const  property juegos=["pelota"]
	const property aniosQueEnvejece = 0
	var property accionesRealizadas = 0
	
	method aumentarAccionesRealizadas(){
		accionesRealizadas+=1
	}
	
	method energiaActual(){
		return energia
	}
	
	method alegrarse(){
		animo = "Feliz"
	}
	
	method estadoDeAnimo(){
		return animo
	}
	
	method cantidadDeAcciones(){
		return accionesRealizadas
	}
	
	method setearCantidadDeAcciones(numero){
		accionesRealizadas = numero
	}
	
	// Se va a llamar cada vez que se haga una accion
	method envejecer(){
		edad+= aniosQueEnvejece
	}
	
 	method edad(){
 		return edad
 	}

	method agregarComidas(comida){
		 self.comidas().addAll(comida)
	}
	
	method energiaInicial(){
		energia= self.edad() * 10
	 	return energia
	}
	 
	method tieneHambre(){
		return  energia < self.energiaInicial() 
	}
	
	method reir(){
		funcionesAuxiliares.postEjecucion(self)
		return "jijijiji"
	}
	
	method comer(alimento){
	 
	 	if(alimento.tipo()=="fruta" ||alimento.tipo()=="verdura" ){
	 		 energia -=  1 
	 	} else if(alimento.tipo()=="bebida")
	 			{
	 		 	energia -= 0.5
	 			} else {   energia -= 0.2}
	 	self.agregarComidas([alimento])		
	 //Falta agregar que se ria había hecho un if que se fija en tieneHambre pero algo funca mal
	 funcionesAuxiliares.postEjecucion(self)
	 
	}
	
	method jugar(juego){
		if (self.juegos().contains(juego)){
			self.reir()
		}
		funcionesAuxiliares.postEjecucion(self)
		
	}

	method baniarse(){
		energia-=2 // no entiendo bien lo de si comio y jugo
		        // entiendo que para comio sería si el size de comidas es mayor a 0 pero no con juegos
		funcionesAuxiliares.postEjecucion(self)
		
	}
		
	method energizarse(){ // esto dice algo que debe estar alegre pero nunca dice cuando esta alegre
		if (energia <= self.energiaInicial()){ energia= self.energiaInicial()}
		funcionesAuxiliares.postEjecucion(self)
	}

	method salud(){
	 var saludables =self.comidas().count { comida=>comida.tipo()=="fruta" ||comida.tipo()=="bebida" ||
	 	comida.tipo()=="verdura"||comida.tipo()=="carne"
	 }
	 var porcentajeSaludable=  saludables / self.comidas().size()
	 var insalubres = self.comidas().count{comida=>comida.tipo()=="fritura"}
	 var porcentajesInsalubres= insalubres / self.comidas().size()
	 
	 if (porcentajesInsalubres > porcentajeSaludable){
	  	salud= "Deplorable"
	 } else if(porcentajesInsalubres == porcentajeSaludable){
	  	salud= "Alarmante"
	 } else if (porcentajesInsalubres < porcentajeSaludable){
	  	salud="Normal"
	 }
	 
	 return salud
	}
	
	
	method jugarConOtro(otroPou){
		
		if(animo == "Aburrido" && otroPou.estadoDeAnimo() == "Feliz" && energia > otroPou.energiaActual()){
			throw "Un pou malvado"
		}
		
		if(animo == "Aburrido" && otroPou.estadoDeAnimo() == animo){
			self.alegrarse()
			otroPou.alegrarse()
			
			// Ambos jugaron, ambos pagan las consecuencias (?
			funcionesAuxiliares.postEjecucion(self)
			funcionesAuxiliares.postEjecucion(otroPou)
		}
	}
}

// TODO Agregar comidas
class Alimento{
	var property energia
	var property tipoDeCoccion
	
}
