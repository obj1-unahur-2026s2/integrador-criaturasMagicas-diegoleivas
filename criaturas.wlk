


class Criatura {
    var poderMagico
    const astucia
    var rol

    method poderMagico() = poderMagico
    method astucia() = astucia
    method rol() = rol

    method poderOfensivo() = poderMagico * 10 + rol.poderExtra()
    method esExtraordinario() = rol.esExtraordinario(self)
    method esAstuta()

    method cambiarRol() {
        if (rol == guardian) {
            rol = new Domador()
            rol.agregarMascota(new Mascota(edad = 1, tieneCuernos = false))
        }
        else if(rol==hechicero){
           rol=guardian
        }
        else {
             if(rol.tieneAlMenosUnaMascotaMagicaConCuernos()){
                rol= hechicero
             }
             else   self.error("cancelado") 

        }
    }
    method sufrirConsecuencia() {
        poderMagico= poderMagico * 0.85
      
    }
    method esFormidable() = self.esAstuta() or self.esExtraordinario()
}


 class Hada inherits Criatura {
    var puedeVolarKm =2
  
    override method esAstuta() = astucia>50 
    override method esExtraordinario() =  super() and puedeVolarKm>10
    method aumentarKm(km) {
      puedeVolarKm= (puedeVolarKm + km).min(25)
      
    }
   
 }

class Duende inherits Criatura {
    override method poderOfensivo() =super() * 1.10
    override method esAstuta() = false 

   
  
}
 

 // roles

 object guardian {
    method poderExtra() = 100 
    method esExtraordinario(unaCriatura) = unaCriatura.poderMagico()>50
   
 }

 
class Domador {
    const mascotasMitologicas=[]
    method sacarMascota(unaMascota) {
        mascotasMitologicas.remove(unaMascota)
      
    }
    method agregarMascota(unaMascota) {
        mascotasMitologicas.add(unaMascota)
      
    }

    method cantidadDeMascotasConCuernos() = mascotasMitologicas.filter({m=>m.tieneCuernos()}).size()
    method poderExtra() = self.cantidadDeMascotasConCuernos()*150 
    method todasLasMascotasSonVeteranas()= mascotasMitologicas.all({m=>m.edad()>=10})
    method esExtraordinario(unaCriatura)=unaCriatura.poderMagico()>=15 and self.todasLasMascotasSonVeteranas()
    method tieneAlMenosUnaMascotaMagicaConCuernos() = mascotasMitologicas.any({m=>m.tieneCuernos()})
   
 }


 
 object hechicero {
     method poderExtra() = 0
     method esExtraordinario(unaCriatura) = true

   
 }

class Mascota {
  const edad
  const tieneCuernos
  method edad() = edad
  method tieneCuernos() = tieneCuernos 
}

