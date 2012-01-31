# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

Region.delete_all
Region.create(nombre: 'REGION METROPOLITANA')
Region.create(nombre: 'I Region')
Region.create(nombre: 'II Region')
Region.create(nombre: 'III Region')
Region.create(nombre: 'IV Region')
Region.create(nombre: 'V Region')
Region.create(nombre: 'VI Region')
Region.create(nombre: 'VII Region')
Region.create(nombre: 'VIII Region')
Region.create(nombre: 'IX Region')
Region.create(nombre: 'X Region')
Region.create(nombre: 'XI Region')
Region.create(nombre: 'XII Region')
Region.create(nombre: 'XIV Region')
Region.create(nombre: 'XV Region')

Comuna.delete_all
Comuna.create(region_id: Region.find_by_nombre('XI Region').id, nombre: 'Aisén')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'Algarrobo')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Alhué')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Alto Bío Bío')
Comuna.create(region_id: Region.find_by_nombre('III Region').id, nombre: 'Alto del Carmen')
Comuna.create(region_id: Region.find_by_nombre('I Region').id, nombre: 'Alto Hospicio')
Comuna.create(region_id: Region.find_by_nombre('X Region').id, nombre: 'Ancud')
Comuna.create(region_id: Region.find_by_nombre('IV Region').id, nombre: 'Andacollo')
Comuna.create(region_id: Region.find_by_nombre('IX Region').id, nombre: 'Angol')
Comuna.create(region_id: Region.find_by_nombre('XII Region').id, nombre: 'Antártica')
Comuna.create(region_id: Region.find_by_nombre('II Region').id, nombre: 'Antofagasta')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Antuco')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Arauco')
Comuna.create(region_id: Region.find_by_nombre('XV Region').id, nombre: 'Arica')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Buin')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Bulnes')
Comuna.create(region_id: Region.find_by_nombre('XII Region').id, nombre: 'Cabo de Hornos')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Cabrero')
Comuna.create(region_id: Region.find_by_nombre('II Region').id, nombre: 'Calama')
Comuna.create(region_id: Region.find_by_nombre('X Region').id, nombre: 'Calbuco')
Comuna.create(region_id: Region.find_by_nombre('III Region').id, nombre: 'Caldera')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Calera de Tango')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'Calera')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'Calle Larga')
Comuna.create(region_id: Region.find_by_nombre('XV Region').id, nombre: 'Camarones')
Comuna.create(region_id: Region.find_by_nombre('I Region').id, nombre: 'Camiña')
Comuna.create(region_id: Region.find_by_nombre('IV Region').id, nombre: 'Canela')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Cañete')
Comuna.create(region_id: Region.find_by_nombre('IX Region').id, nombre: 'Carahue')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'Cartagena')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'Casablanca')
Comuna.create(region_id: Region.find_by_nombre('X Region').id, nombre: 'Castro')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'Catemu')
Comuna.create(region_id: Region.find_by_nombre('VII Region').id, nombre: 'Cauquenes')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Cerrillos')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Cerro Navia')
Comuna.create(region_id: Region.find_by_nombre('X Region').id, nombre: 'Chaitén')
Comuna.create(region_id: Region.find_by_nombre('III Region').id, nombre: 'Chañaral')
Comuna.create(region_id: Region.find_by_nombre('VII Region').id, nombre: 'Chanco')
Comuna.create(region_id: Region.find_by_nombre('VI Region').id, nombre: 'Chépica')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Chiguayante')
Comuna.create(region_id: Region.find_by_nombre('XI Region').id, nombre: 'Chile Chico')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Chillán Viejo')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Chillán')
Comuna.create(region_id: Region.find_by_nombre('VI Region').id, nombre: 'Chimbarongo')
Comuna.create(region_id: Region.find_by_nombre('IX Region').id, nombre: 'Cholchol')
Comuna.create(region_id: Region.find_by_nombre('X Region').id, nombre: 'Chonchi')
Comuna.create(region_id: Region.find_by_nombre('XI Region').id, nombre: 'Cisnes')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Cobquecura')
Comuna.create(region_id: Region.find_by_nombre('X Region').id, nombre: 'Cochamó')
Comuna.create(region_id: Region.find_by_nombre('XI Region').id, nombre: 'Cochrane')
Comuna.create(region_id: Region.find_by_nombre('VI Region').id, nombre: 'Codegua')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Coelemu')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Coihueco')
Comuna.create(region_id: Region.find_by_nombre('VI Region').id, nombre: 'Coínco')
Comuna.create(region_id: Region.find_by_nombre('VII Region').id, nombre: 'Colbún')
Comuna.create(region_id: Region.find_by_nombre('I Region').id, nombre: 'Colchane')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Colina')
Comuna.create(region_id: Region.find_by_nombre('IX Region').id, nombre: 'Collipulli')
Comuna.create(region_id: Region.find_by_nombre('VI Region').id, nombre: 'Coltauco')
Comuna.create(region_id: Region.find_by_nombre('IV Region').id, nombre: 'Combarbalá')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'Comuna de Cabildo')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Concepción')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Conchalí')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'Concón')
Comuna.create(region_id: Region.find_by_nombre('VII Region').id, nombre: 'Constitución')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Contulmo')
Comuna.create(region_id: Region.find_by_nombre('III Region').id, nombre: 'Copiapó')
Comuna.create(region_id: Region.find_by_nombre('IV Region').id, nombre: 'Coquimbo')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Coronel')
Comuna.create(region_id: Region.find_by_nombre('XIV Region').id, nombre: 'Corral')
Comuna.create(region_id: Region.find_by_nombre('XI Region').id, nombre: 'Coyhaique')
Comuna.create(region_id: Region.find_by_nombre('IX Region').id, nombre: 'Cunco')
Comuna.create(region_id: Region.find_by_nombre('IX Region').id, nombre: 'Curacautín')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Curacaví')
Comuna.create(region_id: Region.find_by_nombre('X Region').id, nombre: 'Curaco de Vélez')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Curanilahue')
Comuna.create(region_id: Region.find_by_nombre('IX Region').id, nombre: 'Curarrehue')
Comuna.create(region_id: Region.find_by_nombre('VII Region').id, nombre: 'Curepto')
Comuna.create(region_id: Region.find_by_nombre('VII Region').id, nombre: 'Curicó')
Comuna.create(region_id: Region.find_by_nombre('X Region').id, nombre: 'Dalcahue')
Comuna.create(region_id: Region.find_by_nombre('III Region').id, nombre: 'Diego de Almagro')
Comuna.create(region_id: Region.find_by_nombre('VI Region').id, nombre: 'Doñihue')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'El Bosque')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'El Carmen')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'El Monte')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'El Quisco')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'El Tabo')
Comuna.create(region_id: Region.find_by_nombre('VII Region').id, nombre: 'Empedrado')
Comuna.create(region_id: Region.find_by_nombre('IX Region').id, nombre: 'Ercilla')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Estación Central')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Florida')
Comuna.create(region_id: Region.find_by_nombre('IX Region').id, nombre: 'Freire')
Comuna.create(region_id: Region.find_by_nombre('III Region').id, nombre: 'Freirina')
Comuna.create(region_id: Region.find_by_nombre('X Region').id, nombre: 'Fresia')
Comuna.create(region_id: Region.find_by_nombre('X Region').id, nombre: 'Frutillar')
Comuna.create(region_id: Region.find_by_nombre('X Region').id, nombre: 'Futaleufú')
Comuna.create(region_id: Region.find_by_nombre('XIV Region').id, nombre: 'Futrono')
Comuna.create(region_id: Region.find_by_nombre('IX Region').id, nombre: 'Galvarino')
Comuna.create(region_id: Region.find_by_nombre('XV Region').id, nombre: 'General Lagos')
Comuna.create(region_id: Region.find_by_nombre('IX Region').id, nombre: 'Gorbea')
Comuna.create(region_id: Region.find_by_nombre('VI Region').id, nombre: 'Graneros')
Comuna.create(region_id: Region.find_by_nombre('XI Region').id, nombre: 'Guaitecas')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'Hijuelas')
Comuna.create(region_id: Region.find_by_nombre('X Region').id, nombre: 'Hualaihué')
Comuna.create(region_id: Region.find_by_nombre('VII Region').id, nombre: 'Hualañé')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Hualpén')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Hualqui')
Comuna.create(region_id: Region.find_by_nombre('I Region').id, nombre: 'Huara')
Comuna.create(region_id: Region.find_by_nombre('III Region').id, nombre: 'Huasco')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Huechuraba')
Comuna.create(region_id: Region.find_by_nombre('IV Region').id, nombre: 'Illapel')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Independencia')
Comuna.create(region_id: Region.find_by_nombre('I Region').id, nombre: 'Iquique')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Isla de Maipo')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'Isla de Pascua')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'Juan Fernández')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'La Cisterna')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'La Cruz')
Comuna.create(region_id: Region.find_by_nombre('VI Region').id, nombre: 'La Estrella')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'La Florida')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'La Granja')
Comuna.create(region_id: Region.find_by_nombre('IV Region').id, nombre: 'La Higuera')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'La Ligua')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'La Pintana')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'La Reina')
Comuna.create(region_id: Region.find_by_nombre('IV Region').id, nombre: 'La Serena')
Comuna.create(region_id: Region.find_by_nombre('XIV Region').id, nombre: 'La Unión')
Comuna.create(region_id: Region.find_by_nombre('XIV Region').id, nombre: 'Lago Ranco')
Comuna.create(region_id: Region.find_by_nombre('XI Region').id, nombre: 'Lago Verde')
Comuna.create(region_id: Region.find_by_nombre('XII Region').id, nombre: 'Laguna Blanca')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Laja')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Lampa')
Comuna.create(region_id: Region.find_by_nombre('XIV Region').id, nombre: 'Lanco')
Comuna.create(region_id: Region.find_by_nombre('VI Region').id, nombre: 'Las Cabras')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Las Condes')
Comuna.create(region_id: Region.find_by_nombre('IX Region').id, nombre: 'Lautaro')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Lebu')
Comuna.create(region_id: Region.find_by_nombre('VII Region').id, nombre: 'Licantén')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'Limache')
Comuna.create(region_id: Region.find_by_nombre('VII Region').id, nombre: 'Linares')
Comuna.create(region_id: Region.find_by_nombre('VI Region').id, nombre: 'Litueche')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'Llaillay')
Comuna.create(region_id: Region.find_by_nombre('X Region').id, nombre: 'Llanquihue')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Lo Barnechea')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Lo Espejo')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Lo Prado')
Comuna.create(region_id: Region.find_by_nombre('VI Region').id, nombre: 'Lolol')
Comuna.create(region_id: Region.find_by_nombre('IX Region').id, nombre: 'Loncoche')
Comuna.create(region_id: Region.find_by_nombre('VII Region').id, nombre: 'Longaví')
Comuna.create(region_id: Region.find_by_nombre('IX Region').id, nombre: 'Lonquimay')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Los Álamos')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'Los Andes')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Los Ángeles')
Comuna.create(region_id: Region.find_by_nombre('XIV Region').id, nombre: 'Los Lagos')
Comuna.create(region_id: Region.find_by_nombre('X Region').id, nombre: 'Los Muermos')
Comuna.create(region_id: Region.find_by_nombre('IX Region').id, nombre: 'Los Sauces')
Comuna.create(region_id: Region.find_by_nombre('IV Region').id, nombre: 'Los Vilos')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Lota')
Comuna.create(region_id: Region.find_by_nombre('IX Region').id, nombre: 'Lumaco')
Comuna.create(region_id: Region.find_by_nombre('VI Region').id, nombre: 'Machalí')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Macul')
Comuna.create(region_id: Region.find_by_nombre('XIV Region').id, nombre: 'Máfil')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Maipú')
Comuna.create(region_id: Region.find_by_nombre('VI Region').id, nombre: 'Malloa')
Comuna.create(region_id: Region.find_by_nombre('VI Region').id, nombre: 'Marchigüe')
Comuna.create(region_id: Region.find_by_nombre('II Region').id, nombre: 'María Elena')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'María Pinto')
Comuna.create(region_id: Region.find_by_nombre('XIV Region').id, nombre: 'Mariquina')
Comuna.create(region_id: Region.find_by_nombre('VII Region').id, nombre: 'Maule')
Comuna.create(region_id: Region.find_by_nombre('X Region').id, nombre: 'Maullín')
Comuna.create(region_id: Region.find_by_nombre('II Region').id, nombre: 'Mejillones')
Comuna.create(region_id: Region.find_by_nombre('IX Region').id, nombre: 'Melipeuco')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Melipilla')
Comuna.create(region_id: Region.find_by_nombre('VII Region').id, nombre: 'Molina')
Comuna.create(region_id: Region.find_by_nombre('IV Region').id, nombre: 'Monte Patria')
Comuna.create(region_id: Region.find_by_nombre('VI Region').id, nombre: 'Mostazal')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Mulchén')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Nacimiento')
Comuna.create(region_id: Region.find_by_nombre('VI Region').id, nombre: 'Nancagua')
Comuna.create(region_id: Region.find_by_nombre('XII Region').id, nombre: 'Natales')
Comuna.create(region_id: Region.find_by_nombre('VI Region').id, nombre: 'Navidad')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Negrete')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Ninhue')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Ñiquén')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'Nogales')
Comuna.create(region_id: Region.find_by_nombre('IX Region').id, nombre: 'Nueva Imperial')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Ñuñoa')
Comuna.create(region_id: Region.find_by_nombre('XI Region').id, nombre: 'O\'Higgins')
Comuna.create(region_id: Region.find_by_nombre('VI Region').id, nombre: 'Olivar')
Comuna.create(region_id: Region.find_by_nombre('II Region').id, nombre: 'Ollagüe')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'Olmué')
Comuna.create(region_id: Region.find_by_nombre('X Region').id, nombre: 'Osorno')
Comuna.create(region_id: Region.find_by_nombre('IV Region').id, nombre: 'Ovalle')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Padre Hurtado')
Comuna.create(region_id: Region.find_by_nombre('IX Region').id, nombre: 'Padre Las Casas')
Comuna.create(region_id: Region.find_by_nombre('IV Region').id, nombre: 'Paihuano')
Comuna.create(region_id: Region.find_by_nombre('XIV Region').id, nombre: 'Paillaco')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Paine')
Comuna.create(region_id: Region.find_by_nombre('X Region').id, nombre: 'Palena')
Comuna.create(region_id: Region.find_by_nombre('VI Region').id, nombre: 'Palmilla')
Comuna.create(region_id: Region.find_by_nombre('XIV Region').id, nombre: 'Panguipulli')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'Panquehue')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'Papudo')
Comuna.create(region_id: Region.find_by_nombre('VI Region').id, nombre: 'Paredones')
Comuna.create(region_id: Region.find_by_nombre('VII Region').id, nombre: 'Parral')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Pedro Aguirre Cerda')
Comuna.create(region_id: Region.find_by_nombre('VII Region').id, nombre: 'Pelarco')
Comuna.create(region_id: Region.find_by_nombre('VII Region').id, nombre: 'Pelluhue')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Pemuco')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Peñaflor')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Peñalolén')
Comuna.create(region_id: Region.find_by_nombre('VII Region').id, nombre: 'Pencahue')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Penco')
Comuna.create(region_id: Region.find_by_nombre('VI Region').id, nombre: 'Peralillo')
Comuna.create(region_id: Region.find_by_nombre('IX Region').id, nombre: 'Perquenco')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'Petorca')
Comuna.create(region_id: Region.find_by_nombre('VI Region').id, nombre: 'Peumo')
Comuna.create(region_id: Region.find_by_nombre('I Region').id, nombre: 'Pica')
Comuna.create(region_id: Region.find_by_nombre('VI Region').id, nombre: 'Pichidegua')
Comuna.create(region_id: Region.find_by_nombre('VI Region').id, nombre: 'Pichilemu')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Pinto')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Pirque')
Comuna.create(region_id: Region.find_by_nombre('IX Region').id, nombre: 'Pitrufquén')
Comuna.create(region_id: Region.find_by_nombre('VI Region').id, nombre: 'Placilla')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Portezuelo')
Comuna.create(region_id: Region.find_by_nombre('XII Region').id, nombre: 'Porvenir')
Comuna.create(region_id: Region.find_by_nombre('I Region').id, nombre: 'Pozo Almonte')
Comuna.create(region_id: Region.find_by_nombre('XII Region').id, nombre: 'Primavera')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Providencia')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'Puchuncaví')
Comuna.create(region_id: Region.find_by_nombre('IX Region').id, nombre: 'Pucón')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Pudahuel')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Puente Alto')
Comuna.create(region_id: Region.find_by_nombre('X Region').id, nombre: 'Puerto Montt')
Comuna.create(region_id: Region.find_by_nombre('X Region').id, nombre: 'Puerto Octay')
Comuna.create(region_id: Region.find_by_nombre('X Region').id, nombre: 'Puerto Varas')
Comuna.create(region_id: Region.find_by_nombre('VI Region').id, nombre: 'Pumanque')
Comuna.create(region_id: Region.find_by_nombre('IV Region').id, nombre: 'Punitaqui')
Comuna.create(region_id: Region.find_by_nombre('XII Region').id, nombre: 'Punta Arenas')
Comuna.create(region_id: Region.find_by_nombre('X Region').id, nombre: 'Puqueldón')
Comuna.create(region_id: Region.find_by_nombre('IX Region').id, nombre: 'Purén')
Comuna.create(region_id: Region.find_by_nombre('X Region').id, nombre: 'Purranque')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'Putaendo')
Comuna.create(region_id: Region.find_by_nombre('XV Region').id, nombre: 'Putre')
Comuna.create(region_id: Region.find_by_nombre('X Region').id, nombre: 'Puyehue')
Comuna.create(region_id: Region.find_by_nombre('X Region').id, nombre: 'Queilén')
Comuna.create(region_id: Region.find_by_nombre('X Region').id, nombre: 'Quellón')
Comuna.create(region_id: Region.find_by_nombre('X Region').id, nombre: 'Quemchi')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Quilaco')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Quilicura')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Quilleco')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Quillón')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'Quillota')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'Quilpué')
Comuna.create(region_id: Region.find_by_nombre('X Region').id, nombre: 'Quinchao')
Comuna.create(region_id: Region.find_by_nombre('VI Region').id, nombre: 'Quinta de Tilcoco')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Quinta Normal')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'Quintero')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Quirihue')
Comuna.create(region_id: Region.find_by_nombre('VI Region').id, nombre: 'Rancagua')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Ránquil')
Comuna.create(region_id: Region.find_by_nombre('VII Region').id, nombre: 'Rauco')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Recoleta')
Comuna.create(region_id: Region.find_by_nombre('IX Region').id, nombre: 'Renaico')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Renca')
Comuna.create(region_id: Region.find_by_nombre('VI Region').id, nombre: 'Rengo')
Comuna.create(region_id: Region.find_by_nombre('VI Region').id, nombre: 'Requínoa')
Comuna.create(region_id: Region.find_by_nombre('VII Region').id, nombre: 'Retiro')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'Rinconada')
Comuna.create(region_id: Region.find_by_nombre('XIV Region').id, nombre: 'Río Bueno')
Comuna.create(region_id: Region.find_by_nombre('VII Region').id, nombre: 'Río Claro')
Comuna.create(region_id: Region.find_by_nombre('IV Region').id, nombre: 'Río Hurtado')
Comuna.create(region_id: Region.find_by_nombre('XI Region').id, nombre: 'Río Ibáñez')
Comuna.create(region_id: Region.find_by_nombre('X Region').id, nombre: 'Río Negro')
Comuna.create(region_id: Region.find_by_nombre('XII Region').id, nombre: 'Río Verde')
Comuna.create(region_id: Region.find_by_nombre('VII Region').id, nombre: 'Romeral')
Comuna.create(region_id: Region.find_by_nombre('IX Region').id, nombre: 'Saavedra')
Comuna.create(region_id: Region.find_by_nombre('VII Region').id, nombre: 'Sagrada Familia')
Comuna.create(region_id: Region.find_by_nombre('IV Region').id, nombre: 'Salamanca')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'San Antonio')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'San Bernardo')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'San Carlos')
Comuna.create(region_id: Region.find_by_nombre('VII Region').id, nombre: 'San Clemente')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'San Esteban')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'San Fabián')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'San Felipe')
Comuna.create(region_id: Region.find_by_nombre('VI Region').id, nombre: 'San Fernando')
Comuna.create(region_id: Region.find_by_nombre('XII Region').id, nombre: 'San Gregorio')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'San Ignacio')
Comuna.create(region_id: Region.find_by_nombre('VII Region').id, nombre: 'San Javier de Loncomilla')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'San Joaquín')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'San José de Maipo')
Comuna.create(region_id: Region.find_by_nombre('X Region').id, nombre: 'San Juan de la Costa')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'San Miguel')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'San Nicolás')
Comuna.create(region_id: Region.find_by_nombre('X Region').id, nombre: 'San Pablo')
Comuna.create(region_id: Region.find_by_nombre('II Region').id, nombre: 'San Pedro de Atacama')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'San Pedro de la Paz')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'San Pedro')
Comuna.create(region_id: Region.find_by_nombre('VII Region').id, nombre: 'San Rafael')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'San Ramón')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'San Rosendo')
Comuna.create(region_id: Region.find_by_nombre('VI Region').id, nombre: 'San Vicente de Tagua Tagua')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Santa Bárbara')
Comuna.create(region_id: Region.find_by_nombre('VI Region').id, nombre: 'Santa Cruz')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Santa Juana')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'Santa María')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Santiago')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'Santo Domingo')
Comuna.create(region_id: Region.find_by_nombre('II Region').id, nombre: 'Sierra Gorda')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Talagante')
Comuna.create(region_id: Region.find_by_nombre('VII Region').id, nombre: 'Talca')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Talcahuano')
Comuna.create(region_id: Region.find_by_nombre('II Region').id, nombre: 'Taltal')
Comuna.create(region_id: Region.find_by_nombre('IX Region').id, nombre: 'Temuco')
Comuna.create(region_id: Region.find_by_nombre('VII Region').id, nombre: 'Teno')
Comuna.create(region_id: Region.find_by_nombre('IX Region').id, nombre: 'Teodoro Schmidt')
Comuna.create(region_id: Region.find_by_nombre('III Region').id, nombre: 'Tierra Amarilla')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Tiltil')
Comuna.create(region_id: Region.find_by_nombre('XII Region').id, nombre: 'Timaukel')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Tirúa')
Comuna.create(region_id: Region.find_by_nombre('II Region').id, nombre: 'Tocopilla')
Comuna.create(region_id: Region.find_by_nombre('IX Region').id, nombre: 'Toltén')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Tomé')
Comuna.create(region_id: Region.find_by_nombre('XII Region').id, nombre: 'Torres del Paine')
Comuna.create(region_id: Region.find_by_nombre('XI Region').id, nombre: 'Tortel')
Comuna.create(region_id: Region.find_by_nombre('IX Region').id, nombre: 'Traiguén')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Trehuaco')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Tucapel')
Comuna.create(region_id: Region.find_by_nombre('XIV Region').id, nombre: 'Valdivia')
Comuna.create(region_id: Region.find_by_nombre('III Region').id, nombre: 'Vallenar')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'Valparaíso')
Comuna.create(region_id: Region.find_by_nombre('VII Region').id, nombre: 'Vichuquén')
Comuna.create(region_id: Region.find_by_nombre('IX Region').id, nombre: 'Victoria')
Comuna.create(region_id: Region.find_by_nombre('IV Region').id, nombre: 'Vicuña')
Comuna.create(region_id: Region.find_by_nombre('IX Region').id, nombre: 'Vilcún')
Comuna.create(region_id: Region.find_by_nombre('VII Region').id, nombre: 'Villa Alegre')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'Villa Alemana')
Comuna.create(region_id: Region.find_by_nombre('IX Region').id, nombre: 'Villarrica')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'Viña del Mar')
Comuna.create(region_id: Region.find_by_nombre('REGION METROPOLITANA').id, nombre: 'Vitacura')
Comuna.create(region_id: Region.find_by_nombre('VII Region').id, nombre: 'Yerbas Buenas')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Yumbel')
Comuna.create(region_id: Region.find_by_nombre('VIII Region').id, nombre: 'Yungay')
Comuna.create(region_id: Region.find_by_nombre('V Region').id, nombre: 'Zapallar')


RefDatum.delete_all
puts "Importing refdata..."
CSV.foreach(Rails.root.join("refdata.csv"), headers: true) do |row|
  Refdatum.create! do |refdata|
    refdata.id = row[0]
    refdata.nombre = row[1]
    refdata.valor = row[2]
  end
end
