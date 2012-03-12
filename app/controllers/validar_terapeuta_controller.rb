require 'date'
class ValidarTerapeutaController < ApplicationController
  http_basic_authenticate_with :name => "btp", :password => "btp.123!"
  
  def index
    @terapeutas = Terapeuta.where(:estado => "pendiente de validar")
  end
  
  def todos
    search_params = params[:search]
    if search_params
      @terapeutas = Terapeuta.where("nombre like ?", '%'+params[:search]+'%')
    else
      @terapeutas = Terapeuta.all
    end
  end
  
  def edit
    @terapeuta = Terapeuta.find(params[:id])
    @tipo_terapias = RefDatum.where(:nombre => "Tipo Terapeuta")
    @especialidades = RefDatum.where(:nombre => "Especialidad")
    @forma_pagos = RefDatum.where(:nombre => "Formas de Pago") 
    @plan_trimestral = RefDatum.find_by_nombre("Plan Trimestral").valor
    @plan_semestral = RefDatum.find_by_nombre("Plan Semestral").valor
    @plan_anual = RefDatum.find_by_nombre("Plan Anual").valor
  end

  def show
    @terapeuta = Terapeuta.find(params[:id])
  end

  def validar
    terapeuta = Terapeuta.find(params[:id])
    terapeuta.estado = "validado"
    if terapeuta.plan_ciclo == "Anual"
      terapeuta.plan_expira = 1.year.from_now
    elsif terapeuta.plan_ciclo == "Semestral"
      terapeuta.plan_expira = 6.month.from_now
    else
      terapeuta.plan_expira = 3.month.from_now
    end
    terapeuta.save 
    redirect_to validar_terapeuta_path
  end
end
