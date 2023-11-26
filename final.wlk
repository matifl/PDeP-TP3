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
class EstadoPouBase {
	var property animo = "Feliz"
	var property salud = "Normal"
	var property seBanio = false
	var property durmio = false
	var property seRio= false
		method aburrido(){
		return self.animo()=="Aburrido"
	}
		method feliz(){
		return self.animo()=="Feliz"
	}
		method estaAlegre(){
		return self.animo()=="Alegre"
	}
	
}


class Pou{
	// Seteo las properties iniciales para que todos los pous cumplan con un estandar
	// Solo se van a sobreescribir las properties que le pasemos en el constructor
	var property edad = 3
   const property estadoPou 
   // se debe inicializar un pou con un objeto del tipo estadoPou para que funcione
	
 	var property energia = self.energiaInicial() 
	const property comidas =[]
	const  property juegos=["pelota"]
	const property aniosQueEnvejece = 0
	var property accionesRealizadas = 0
	
	method aumentarAccionesRealizadas(){
		accionesRealizadas+=1
	}
	
	method alegrarse(){
	 estadoPou.animo("Feliz") 
	}
	
	method energiaBaja(){ //Cada vez que otro metodo edita la energia llama a esta funcion
		if(energia< (self.edad() * 10)){ 
			self.energizarse()
			throw new EnergiaBaja(message="La energia es critica")
		}
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
		estadoPou.seRio(true)
		self.aumentarAccionesRealizadas()
		return "jijijiji"	
	}
	
	method comer(alimento){
	 	if (self.tieneHambre()){
	 		self.reir()
	 	}
	 	energia += alimento.efectoEnergizante()
	 	self.energiaBaja() //reviso que la energia no sea baja
	 	self.agregarComidas([alimento])		
	 	self.aumentarAccionesRealizadas() 
	}
	
	method jugar(juego){
		if (self.juegos().contains(juego)){
			self.reir()
			self.baniarse() //La consigna dice que si jugo y comio se tiene que bañar, entonces cada vez que juega llama a baniarse
		}
		self.aumentarAccionesRealizadas()
	}
	method comio()= comidas.size()>0
	

	method baniarse(){
		if (self.comio()){		energia-=2 
			self.energiaBaja() // chequea energia bajha
		} //aca revisa haber comido 
	self.aumentarAccionesRealizadas()
		
	}
		
	method energizarse(){ 
		if (estadoPou.estaAlegre() && (energia <= self.energiaInicial())){ energia= self.energiaInicial()}
		self.aumentarAccionesRealizadas()
	}

	method salud(){
	 var saludables =self.comidas().count { comida=>comida.esSaludable() }
	 var porcentajeSaludable=  saludables / self.comidas().size()
	 var insalubres = self.comidas().count{comida=>comida.esSaludable()}
	 var porcentajesInsalubres= insalubres / self.comidas().size()
	 
	 if (porcentajesInsalubres > porcentajeSaludable){
	  	estadoPou.salud("Deplorable") 
	 } else if(porcentajesInsalubres == porcentajeSaludable && !(estadoPou.seRio())){
	  	estadoPou.salud("Alarmante") 
	 } else if (porcentajesInsalubres < porcentajeSaludable && !(estadoPou.seRio())){
	  	estadoPou.salud("Normal") 
	 }
	 self.aumentarAccionesRealizadas()
	 return estadoPou.salud()
	}
	
	
	method jugarConOtro(otroPou){
	if((otroPou.estadoPou().feliz()) && (self.mayorEnergiaPrimerPou(self,otroPou))){
		 	throw new NoEstanAburridos(message="No están aptos para jugar")
		 	} else(estadoPou.feliz() && (self.mayorEnergiaPrimerPou(otroPou,self)))
			throw new NoEstanAburridos(message="No están aptos para jugar")
	}
				
	method mayorEnergiaPrimerPou(pou1,pou2){
		return pou1.energia()>pou2.energia()
	}

		

	

}
class PouViejo inherits Pou{
	override method aumentarAccionesRealizadas(){
	accionesRealizadas+=1
		if(accionesRealizadas==5){
			accionesRealizadas=0
			edad+=1
		}
	}
}
// clase estados Pou, en la clase pou no esta inicializada para que se envie un objeto base del estado al crear un pou

const estadoPouInicial = new EstadoPouBase()//ej estado para un pout
const estadoPoucito= new EstadoPouBase(animo="triste",durmio=true)

// TODO Agregar comidas
class Alimento{
	const property efectoEnergizante
	const property esSaludable=true
	method efectoEnergizante()
}
class FrutasVerduras inherits Alimento{
	override method efectoEnergizante()=1
}
class Bebidas inherits Alimento{
	override method efectoEnergizante()=0.5
}
class OtrosAlimentos inherits Alimento{
	const tipoDeCoccion // aqui se debe establecer por ejemplo un objeto como freidora
	override method efectoEnergizante(){
		if (tipoDeCoccion.usadoParaFritar()){
			return -0.2
		} else {return 0.2}
	}
	override method esSaludable(){
		return !tipoDeCoccion.usadoParaFritar()
	}
}

object freidora{ //EJEMPLO ELEMENTO COCCION
	const property usadoParaFritar=true
}


const poucito=new Pou(estadoPou= estadoPouInicial)
const pou2= new Pou(estadoPou= estadoPoucito)

//ERROR
class NoEstanAburridos inherits Exception{}
class EnergiaBaja inherits Exception{}

