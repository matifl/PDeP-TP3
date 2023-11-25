/** First Wollok example */
object pou
{
	var edad = 3
	var salud
 	var property energia = self.energiaInicial() 
	const property comidas =[]
	const  property juegos=["pelota"]

 	method edad(){
 		return edad
	@@ -25,6 +71,7 @@ object pou
	}

	method reir(){
		return "jijijiji"
	}

	@@ -38,22 +85,28 @@ object pou
	 			} else {   energia -= 0.2}
	 	self.agregarComidas([alimento])		
	 //Falta agregar que se ria había hecho un if que se fija en tieneHambre pero algo funca mal

	}

	method jugar(juego){
		if (self.juegos().contains(juego)){
			self.reir()
		}
	}

	method baniarse(){
		energia-=2 // no entiendo bien lo de si comio y jugo
		        // entiendo que para comio sería si el size de comidas es mayor a 0 pero no con juegos
	}

	method energizarse(){ // esto dice algo que debe estar alegre pero nunca dice cuando esta alegre
		if (energia <= self.energiaInicial()){ energia= self.energiaInicial()}
	}

	method salud(){
	@@ -74,28 +127,28 @@ object pou

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
