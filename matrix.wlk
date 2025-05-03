object neo {
  var energia = 100
  
  method esElElegido() = true
  
  method saltar() {energia /= 2}
  
  method vitalidad() = energia * 0.1
}

object morfeo {
  var vitalidad = 8
  var estaCansado = false

  method esElElegido() = false

  method vitalidad() = vitalidad

  method saltar(){
    estaCansado = !estaCansado
    vitalidad = (vitalidad - 1).max(0)
    }
}

object trinity {
  method esElElegido() = false

  method vitalidad() = 0

  method saltar(){}
}

object nave {
  const pasajeros = #{neo, morfeo, trinity}

  method cantidadPasajeros() = pasajeros.size()

  method pasajeroDeMayorVitalidad() = pasajeros.max({p => p.vitalidad()})
  
  method pasajeroDeMenorVitalidad() = pasajeros.min({p => p.vitalidad()})
  
  method estaEquilibrada()= self.pasajeroDeMayorVitalidad().vitalidad() < 2 * self.pasajeroDeMenorVitalidad().vitalidad()
  
  method estaElElegido() = pasajeros.any({p => p.esElElegido()})
  
  method chocar(){
    pasajeros.forEach({p => p.saltar()})
    pasajeros.clear()
    }
  
  method acelerar(){
    pasajeros.filter({p => !p.esElElegido()}).forEach({p => p.saltar()})
    //trinity.saltar()
    //morfeo.saltar()
  }
}