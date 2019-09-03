object alquimista {
  var itemsDeCombate = []
  var itemsDeRecoleccion = []
  
  method tieneCriterio() {
    return self.cantidadDeItemsDeCombateEfectivos() >= self.cantidadDeItemsDeCombate() / 2
  }
  
  method cantidadDeItemsDeCombate() {
    return itemsDeCombate.size()
  }
  
  method cantidadDeItemsDeRecoleccion() {
    return itemsDeRecoleccion.size()
  }
  
  method cantidadDeItemsDeCombateEfectivos() {
    return itemsDeCombate.count({ itemDeCombate =>
      itemDeCombate.esEfectivo()
    })
  }
  
  method agregarItemDeCombate(itemDeCombate){
  	itemsDeCombate.add(itemDeCombate)
  }
  
  method agregarItemDeRecoleccion(itemDeRecoleccion){
  	itemsDeRecoleccion.add(itemDeRecoleccion)
  }
 
 method esBuenExplorador(){
 	return self.cantidadDeItemsDeRecoleccion() >= 3
 	}
 	
 method capacidadOfensiva(){
 	return itemsDeCombate.sum({itemDeCombate => itemDeCombate.capacidadOfensiva()})
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
  
  method capacidadOfensiva(){
  	return danio / 2
  }
}

object pocion {
  var materiales = []
  var poderCurativo = 60
  
  method esEfectivo() {
    return poderCurativo > 50 and self.fueCreadaConAlgunMaterialMistico()
  }
  
  method cantidadDeMaterialesMisticos() {
  	return materiales.count({materialMistico => materialMistico.esMistico()})
  }
  
  method agregarMaterial(material){
  	materiales.add(material)
  }
  
  method fueCreadaConAlgunMaterialMistico() {
    return materiales.any({ material =>
      material.esMistico()
    })
  }
  
  method dejarEnCero() {
  	poderCurativo = 0
  }
  
  method capacidadOfensiva (){
  	return poderCurativo + self.puntosExtra()
  }
  
  method puntosExtra(){
  	return self.cantidadDeMaterialesMisticos() * 10
  }
 }

object materialMistico {
	
	method esMistico(){
		return true
	}

}

object material {
	
	method esMistico(){
		return false
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
  
  method contieneMaterialMistico(){
  	 return materiales.any({ material =>
      material.esMistico()
    })
  }
  
  method cantidadDeMaterialesMisticos(){
  	return materiales.count({materialMistico => materialMistico.esMistico()})
  }
  
  method agregarMaterial(material){
  	materiales.add(material)
  }
  
  method capacidadOfensiva(){
  	if(self.contieneMaterialMistico()){
  		return 12 * self.cantidadDeMaterialesMisticos()
  	}
  	return 5
  }

}