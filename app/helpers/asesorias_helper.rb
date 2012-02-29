module AsesoriasHelper
  def contains_dia_atencion(asesoria_id, refdata_dia_atencion)
    dia_atencion = DiasAtencion.where("asesoria_id = ? and dia = ?", asesoria_id, refdata_dia_atencion.valor)
    if dia_atencion.size > 0
      return true
    else
      return false
    end
  end
end
