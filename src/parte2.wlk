class MaquinaPou{
	var edad = 3
	var salud
 	var property energia = self.energiaInicial() 
	const property comidas =[]
	const  property juegos=["pelota"]
	var property animo= "aburrido"
 	method edad(){
 		return edad
 	}
   method aburrido(){
   	return self.animo()=="aburrido")
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
		return "jijijiji"
	}
	
	method comer(alimento){
	 if (self.tieneHambre()){ self.reir()}
	 	if(alimento.tipo()=="fruta" ||alimento.tipo()=="verdura" ){
	 		 energia -=  1 
	 	} else if(alimento.tipo()=="bebida")
	 			{
	 		 	energia -= 0.5
	 			} else {   energia -= 0.2}
	 	self.agregarComidas([alimento])		
	 
	 return self.energia()
	}
	
	method jugar(juego){
		if (self.juegos().contains(juego)){
		return	self.reir()
		}
		else {return null}
	}

	method baniarse(){
		energia-=2 
	}
		
	method energizarse(){ // esto dice algo que debe estar alegre pero nunca dice cuando esta alegre
		if (energia <= self.energiaInicial()){ energia= self.energiaInicial()}
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
	method animarse(pouAmigo){
		if (self.aburrido() && pouAmigo.aburrido()){
			animo="feliz"
			return self.reir()
		} else if (!pouAmigo.aburrido() && pouAmigo.energia()<self.energia()  ){
				throw new PouException(message = "Pou amigo feliz y con menos energia")
		}
		return self.animo()
	}
}

class PouException inherits Exception {

}

class Alimento{
	const energizador
	
	method esFritura(){
		return 
	}
}
