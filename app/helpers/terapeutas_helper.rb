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
  
  def contains_forma_pago(terapeuta_id, refdata_forma_pago)
    forma_pago = FormaPago.where("terapeuta_id = ? and valor = ?", terapeuta_id, refdata_forma_pago.valor)
    if forma_pago.size > 0
      return true
    else
      return false
    end
  end
  
  def visitas_chart_series(start_time, terapeuta_id)
    visitas_by_day = Visitas.where(:created_at => start_time.beginning_of_day..Time.zone.now.end_of_day,
                                   :terapeuta_id => terapeuta_id).
                    group("date(created_at)").
                    select("created_at, sum(cantidad) as cantidad")
    (start_time.to_date..Date.today).map do |date|
      visita = visitas_by_day.detect { |visita| visita.created_at.to_date == date }
      visita && visita.cantidad.to_i || 0
    end.inspect
  end
  
  def is_plan_expira(plan_expira)
    if plan_expira == nil
      return true
    elsif plan_expira < Time.now
      return true
    else
      return false
    end
  end
end
