/** First Wollok example */
object pou
{
	var edad = 3
	var salud
 	var property energia = self.energiaInicial() 
	const property comidas =[]
	const property juegos=["pelota"]
	
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

	 
	}
	
	method jugar(juego){
		if (self.juegos().contains(juego)){
			self.reir()
		}
		return null
		
	}

	method baniarse(){
		energia-=2 

	}
		
	method energizarse(){ 
		if (energia <= self.energiaInicial()){ energia= self.energiaInicial()}
	}

	method salud(){
	 const saludables =self.comidas().count { comida=>comida.tipo()=="fruta" ||comida.tipo()=="bebida" ||
	 	comida.tipo()=="verdura"||comida.tipo()=="carne"
	 }
	 const porcentajeSaludable =  saludables / self.comidas().size()
	 const insalubres = self.comidas().count{comida=>comida.tipo()=="fritura"}
	 const porcentajesInsalubres = insalubres / self.comidas().size()
	 
	 if (porcentajesInsalubres > porcentajeSaludable){
	  	salud= "Deplorable"
	 } else if(porcentajesInsalubres == porcentajeSaludable){
	  	salud= "Alarmante"
	 } else if (porcentajesInsalubres < porcentajeSaludable){
	  	salud="Normal"
	 }
	 
	 return salud
	}
}




object fruta{
	method tipo() {
	return  "fruta"}
}
object verdura{
	method tipo() {
	return  "verdura"}
}
object bebida{
		method tipo() {
	return  "bebida"}
}
object carne{
	method tipo() {
	return  "carne"}
}
object fritura{
	method tipo() {
	return  "fritura"}
}
