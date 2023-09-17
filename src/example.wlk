/** First Wollok example */ object pou {

	var property edad = 3
	var property salud
	var property energia = self.energiaInicial()
	const property comidas = []
	const property juegos = [ "pelota" ]

	method edad() {
		return edad
	}

	method agregarComidas(comida) {
		self.comidas().addAll(comida)
	}

	method energiaInicial() {
		energia = self.edad() * 10
		return energia
	}

	method tieneHambre() {
		return energia < self.energiaInicial()
	}

	method reir() {
		return "jijijiji"
	}

	method comer(alimento) {
		if (alimento.tipo() == "fruta" || alimento.tipo() == "verdura") {
			energia -= 1
		} else if (alimento.tipo() == "bebida") {
			energia -= 0.5
		} else {
			energia -= 0.2
		}
		self.agregarComidas([ alimento ])
	// Falta agregar que se ria había hecho un if que se fija en tieneHambre pero algo funca mal
	}

	method jugar(juego) {
		if (self.juegos().contains(juego)) {
			self.reir()
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

