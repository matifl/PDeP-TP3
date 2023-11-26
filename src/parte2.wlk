object funcionesAuxiliares{
	
	method postEjecucion(unPou){
		if(unPou.cantidadDeAcciones() >= 5){
			unPou.setearCantidadDeAcciones(0)
			unPou.envejecer()
		}
		unPou.aumentarAccionesRealizadas()
	}
	
	 method escribirError(msg){
		return "Error: "+msg
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
	var property aniosQueEnvejece = 0
	var property accionesRealizadas = 0
	
	method aumentarAccionesRealizadas(){
		accionesRealizadas++
	}
	
	method setearEnergiaActual(num){
		if(num<self.energiaInicial()){
			self.energizarse()
			funcionesAuxiliares.escribirError( "Pou se quedo sin energia!")
		}else{
			energia=num
		}
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
		return self.edad() * 10
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
		energia-=2 
		funcionesAuxiliares.postEjecucion(self)
		
	}
		
	method energizarse(){ 
		if (energia <= self.energiaInicial()){ energia= self.energiaInicial()}
		funcionesAuxiliares.postEjecucion(self)
	}

	method salud(){
	 const saludables =self.comidas().count { comida=>comida.tipo()=="fruta" ||comida.tipo()=="bebida" ||
	 	comida.tipo()=="verdura"||comida.tipo()=="carne"
	 }
	 const porcentajeSaludable=  saludables / self.comidas().size()
	 const insalubres = self.comidas().count{comida=>comida.tipo()=="fritura"}
	 const porcentajesInsalubres= insalubres / self.comidas().size()
	 
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
			funcionesAuxiliares.escribirError("Un pou malvado")
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

class Alimento{
	var property tipoDeCoccion=new Coccion()
	
	method energia(){
		return tipoDeCoccion.aportado()
	}
}

class Fruta inherits Alimento{
	override method energia(){
		return 1
	}
	
}

class Verdura inherits Alimento{
	override method energia(){
		return 1
	}
}

class Bebida inherits Alimento{
	override method energia(){
		return 0.5
	}
}


// Todos los alimentos que no sean fruta,verdura o bebida solo aportan 0.2 exceptuando a las frituras
class Coccion {
	const property aporteProteico=0.2
	
	method aportado(){
		return aporteProteico
	}
}

// Dejo ya creados algunos objetos para pruebas
const freidora = new Coccion(aporteProteico=-0.2)
const sarten = new Coccion()
const plancha = new Coccion()
const olla = new Coccion()
const agua = new Bebida()
const banana = new Fruta()
const brocoli = new Verdura()
const pouAdulto = new Pou(aniosQueEnvejece=1,edad=20,animo="Aburrido")
const pouComun = new Pou(edad=5,animo="Aburrido")
