# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
property1= Property.create({nombre: 'Cabaña de la motaña', descripcion: 'Cabaña de madera, bien ambientada', lugar:'Cordoba', descripcionLug: 'Lugar montañoso y tranquilo'})
property2= Property.create({nombre: 'Castillo del conde', descripcion: 'Castillo medieval antiguo', lugar:'Ucrania', descripcionLug: 'Ambiente motañoso aun no en guerra'})
property3= Property.create({nombre: 'Cabaña del rio', descripcion: 'Cabaña de madera, no esta adentro del rio', lugar:'Italia', descripcionLug: 'Zona rodeada de canales y muy tranquila'})
property4= Property.create({nombre: 'Waikiki', descripcion: 'Cabaña caribeña', lugar:'Caribe', descripcionLug: 'Playa paradisica de aguas cristalinas'})
property5= Property.create({nombre: 'Le togre france', descripcion: 'Casa grande lujosa al estilo paris', lugar:'Francia', descripcionLug: 'Cerca de la torre Eiffel'})
property6= Property.create({nombre: 'La choza', descripcion: 'No esperes mucho', lugar:'mejor no te decimos', descripcionLug: 'Sorpresa'})

auction11= Auction1.create({nombre: 'Cabaña de la motaña', precio: '5000', puja:'0', fecha: '01/07/2019'})
auction12= Auction1.create({nombre: 'Castillo del conde', precio: '7000', puja:'0', fecha: '01/06/2019'})
auction13= Auction1.create({nombre: 'Cabaña del rio', precio: '8000', puja:'0', fecha: '15/07/2019'})
auction14= Auction1.create({nombre: 'Waikiki', precio: '5000', puja:'0', fecha: '25/6/2019'})
auction15= Auction1.create({nombre: 'Le togre france', precio: '10000', puja:'0', fecha: '07/07/2019'})
auction16= Auction1.create({nombre: 'La choza', precio: '2500', puja:'0', fecha: '01/08/2019'})