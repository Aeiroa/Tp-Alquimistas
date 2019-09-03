object alquimista {
  var itemsDeCombate = []
  
  method tieneCriterio() {
    return self.cantidadDeItemsDeCombateEfectivos() >= self.cantidadDeItemsDeCombate() / 2
  }
  
  method cantidadDeItemsDeCombate() {
    return itemsDeCombate.size()
  }
  
  method cantidadDeItemsDeCombateEfectivos() {
    return itemsDeCombate.count({ itemDeCombate =>
      itemDeCombate.esEfectivo()
    })
  }
  
  method agregarItemDeCombate(itemDeCombate){
  	itemsDeCombate.add(itemDeCombate)
  }
  
}

object bomba {
  var danio = 150
  
  method esEfectivo() {
    return danio > 100
  }
  
  method dejarEnCero() {
  	danio = 0
  }
}

object pocion {
  var materiales = []
  var poderCurativo = 60
  
  method esEfectivo() {
    return poderCurativo > 50 and self.fueCreadaConAlgunMaterialMistico()
  }
  
  method fueCreadaConAlgunMaterialMistico() {
    return materiales.any({ material =>
      material.esMistico()
    })
  }
  
  method dejarEnCero() {
  	poderCurativo = 0
  }
}

object debilitador {
  var materiales = []
  var potencia = 0
  
  method esEfectivo() {
    return potencia > 0 and self.fueCreadoPorAlgunMaterialMistico().negate()
  }
  
  method fueCreadoPorAlgunMaterialMistico() {
    return materiales.any({ material =>
      material.esMistico()
    })
  }

}
