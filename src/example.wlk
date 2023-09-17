/** First Wollok example */ object pou {

	var property edad = 3
	var property salud
	var property energia = 30
	var property comidas = []
	var property juegos = [ "pelota" ]
	var property vecesJugadas = 0

	method edad() {
		return edad
	}

	method agregarComidas(comida) {
		self.comidas().addAll(comida)
	}

	
	method energiaInicial() {
		const energiaInicial = self.edad() * 10
		return energiaInicial
	}
	
	method dormir(){
		// El enunciado no especifica practicamente que hace la funciond de dormir
		// Asi que le invento que recupere hasta energia inicial o no duerma
		if(self.tieneHambre()){
			energia = self.energiaInicial()
		}
	}

	method tieneHambre() {
		return energia < self.energiaInicial()
	}

	method reir() {
		return "jijijiji"
	}

	method comer(alimento) {
		if (alimento.tipo() == "fruta" || alimento.tipo() == "verdura") {
			energia+=1
		} else if (alimento.tipo() == "bebida") {
			energia += 0.5
		} else {
			energia -= 0.2
		}
		self.agregarComidas([ alimento ])
		
		if(vecesJugadas > 1){
			self.baniarse() // Se tiene que bañar por que comio y jugo
		}
		
		if(self.tieneHambre()){
			return ""
		}
		return self.reir()
	}

	method jugar(juego) {
		vecesJugadas += 1
		if (self.juegos().contains(juego)) {
			self.reir()
		}
		if(self.comidas().size() > 1){
			self.baniarse() // Se tiene que bañar por que comio y jugo
		}
		return self.reir()
	}

	method baniarse() {
		energia -= 2 // no entiendo bien lo de si comio y jugo
		// entiendo que para comio sería si el size de comidas es mayor a 0 pero no con juegos
	}

	method energizarse() { // esto dice algo que debe estar alegre pero nunca dice cuando esta alegre
		if (energia <= self.energiaInicial()) {
			energia = self.energiaInicial()
		}
	}

	method salud() {
		var saludables = self.comidas().count{ comida => comida.tipo() == "fruta" || comida.tipo() == "bebida" || comida.tipo() == "verdura" || comida.tipo() == "carne" }
		var porcentajeSaludable = saludables / self.comidas().size()
		var insalubres = self.comidas().count{ comida => comida.tipo() == "fritura" }
		var porcentajesInsalubres = insalubres / self.comidas().size()
		if (porcentajesInsalubres > porcentajeSaludable) {
			salud = "Deplorable"
		} else if (porcentajesInsalubres == porcentajeSaludable) {
			salud = "Alarmante"
		} else if (porcentajesInsalubres < porcentajeSaludable) {
			salud = "Normal"
		}
		return salud
	}

}

object fruta {

	method tipo() {
		return "fruta"
	}

}

object verdura {

	method tipo() {
		return "verdura"
	}

}

object bebida {

	method tipo() {
		return "bebida"
	}

}

object carne {

	method tipo() {
		return "carne"
	}

}

object fritura {

	method tipo() {
		return "fritura"
	}

}

