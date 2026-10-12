class LosClaros {
     var coloniaHabitante
    method poderDefensivo() = 100  + coloniaHabitante.poderOfensivo()
    method colonizadaPor(unaColonia) {
        coloniaHabitante = unaColonia
      
    }
  
}

class LosCastillos {
    var coloniaHabitante
    method poderDefensivo() = 200 * coloniaHabitante.CantidadDecriaturasFormidables()
    method colonizadaPor(unaColonia) {
        coloniaHabitante = unaColonia
      
    }
}

class Colonia {
    const criaturas= []
    method poderOfensivo() = criaturas.sum({c=>c.poderOfensivo()})
    method cantidadDeCriaturas() = criaturas.size()
    method intentarConquistar(unArea) {
        if(self.poderOfensivo()>unArea.poderDefensivo())
        {
         unArea.colonizadaPor(self)
        }
         else{

           criaturas.forEach({c=>c.sufrirConsecuencia()})
         }
      
    }
    method CantidadDecriaturasFormidables() = criaturas.filter({c=>c.esFormidable()}).size()
   method agregarCriatura(unaCriatura ) {

criaturas.add(unaCriatura)     
   }
  
}