# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
property1= Property.create({nombre: 'Cabaña de la motaña', descripcion: 'Cabaña de madera, bien ambientada', lugar:'Cordoba', descripcionLug: 'Lugar montañoso y tranquilo', monto: '4500000', disponible: 'true'})
property2= Property.create({nombre: 'Castillo del conde', descripcion: 'Castillo medieval antiguo', lugar:'Ucrania', descripcionLug: 'Ambiente motañoso aun no en guerra', monto: '8500000',disponible: 'true'})
property3= Property.create({nombre: 'Cabaña del rio', descripcion: 'Cabaña de madera, no esta adentro del rio', lugar:'Italia', descripcionLug: 'Zona rodeada de canales y muy tranquila', monto: '7500000',disponible: 'true'})
property4= Property.create({nombre: 'Waikiki', descripcion: 'Cabaña caribeña', lugar:'Caribe', descripcionLug: 'Playa paradisica de aguas cristalinas', monto: '2500000'})
property5= Property.create({nombre: 'Le togre france', descripcion: 'Casa grande lujosa al estilo paris', lugar:'Francia', descripcionLug: 'Cerca de la torre Eiffel', monto: '5000000',disponible: 'true'})
property6= Property.create({nombre: 'La choza', descripcion: 'No esperes mucho', lugar:'mejor no te decimos', descripcionLug: 'Sorpresa', monto: '800000',disponible: 'true'})

auction11= Auction1.create({property_id: '1', puja:'0', fechanew: '5-07-2019'})
auction12= Auction1.create({property_id: '2', puja:'0', fechanew: '17-06-2019'})
auction13= Auction1.create({property_id: '3', puja:'0', fechanew: '4-07-2019'})
auction14= Auction1.create({property_id: '4', puja:'0', fechanew: '6-06-2019'})
auction15= Auction1.create({property_id: '5', puja:'0', fechanew: '7-07-2019'})
auction16= Auction1.create({property_id: '6', puja:'0', fechanew: '11-07-2019'})