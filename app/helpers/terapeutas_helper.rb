module TerapeutasHelper
  def contains_tipo_terapia(terapeuta_id, refdata_tipo_terapeuta)
    tipo_terapia = TipoTerapia.where("terapeuta_id = ? and nombre = ?", terapeuta_id, refdata_tipo_terapeuta.valor)
    if tipo_terapia.size > 0
      return true
    else
      return false
    end
  end
  
  def contains_especialidad(terapeuta_id, refdata_especialidad)
    especialidad = Especialidad.where("terapeuta_id = ? and valor = ?", terapeuta_id, refdata_especialidad.valor)
    if especialidad.size > 0
      return true
    else
      return false
    end
  end
end
