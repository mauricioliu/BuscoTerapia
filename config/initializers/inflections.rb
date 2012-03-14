# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
inflect.irregular "region" , "regiones"
inflect.irregular "terapia" , "terapias"
inflect.irregular "tipo_terapia" , "tipo_terapias"
inflect.irregular "terapeuta" , "terapeutas"
inflect.irregular "especialidad" , "especialidades"
inflect.irregular "estudio" , "estudios"
inflect.irregular "error" , "errores"
inflect.irregular "forma_pago", "forma_pagos"
inflect.irregular "pago", "pagos"
inflect.irregular "articulo", "articulos"
inflect.irregular "dia_atencion", "dias_atencion"
inflect.irregular "asesoria", "asesorias"
inflect.irregular "convenio", "convenios"
inflect.irregular "terapia_terapeuta", "terapia_terapeutas"
end
