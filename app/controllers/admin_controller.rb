class AdminController < ApplicationController
  http_basic_authenticate_with :name => "btp", :password => "btp.123!"
  
  def index
  end
  
  def asesorias_index
    if params[:filtro]
      @asesorias = Asesoria.where("status = ?", params[:filtro]).order("id desc")
    else
      @asesorias = Asesoria.where("status <> 'cerrado'").order("id desc")
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @asesorias }
    end
  end
  
  def ver_asesoria
    @asesoria = Asesoria.find(params[:id])
    if @asesoria.status == "nuevo"
      @asesoria.status = "pendiente"
      @asesoria.save
    end
  end
  
  def cambiar_asesoria_status
    @asesoria = Asesoria.find(params[:asesoria_id])
    @asesoria.status = params[:asesoria][:status]
    if @asesoria.status == "agendado"
      @asesoria.terapeuta_id = params[:asesoria][:terapeuta_id]
    else
      @asesoria.terapeuta_id = nil
    end
    @asesoria.comentarios = params[:asesoria][:comentarios]
    if @asesoria.changed?
      @asesoria_h = AsesoriaH.new
      @asesoria_h.asesoria_id = @asesoria.id
      @asesoria_h.status = @asesoria.status
      if @asesoria.status == "agendado"
        @asesoria_h.comentarios = "Agendado a: " + @asesoria.terapeuta.nombre + "\n" + @asesoria.comentarios
      else
        @asesoria_h.comentarios = @asesoria.comentarios
      end
      @asesoria_h.save
      @asesoria.save
    end
    redirect_to ver_asesoria_path(@asesoria)
  end
  
  def crear_boton_pago
      if params[:monto]
        file = '
          <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
          <html><head><meta HTTP-EQUIV="Content-Type" content="text/html; charset=iso-8859-1"><meta HTTP-EQUIV="Expires" content="-1"><meta HTTP-EQUIV="Pragma" content="no-cache">
          <title>Paga y Recibe pagos online - DineroMail</title>
          <style type="text/css"><!--#divPayButtonPreloaderContainer{ left: 0px; top: 0px; width: 100%; height: 100%; border: 1px solid; position: absolute; z-index: 9999; background-color: #EFEFEF; }#divPayButtonPreloaderContainer div{ position: absolute; }.preloader-message{ color: black; font-weight: normal; float: left; font-family:Arial, Helvetica, sans-serif; font-size:14px; padding:10px 20px;}.PayPreloaderOpaqueDiv{background-color: white;height: 150px;width: 28%;border: 1px solid;}.PayPreloaderOpaqueDiv img{ float: left; padding:10px 20px; margin-left:38%;}--></style>
          </head><body>
          <form id="f" name="f" method="POST" action="https://checkout.dineromail.com/CheckOut">
          <input type="hidden" name="country_id" value="3"><br>
          <input type="hidden" name="encrypted" value="0"><br>
          <input type="hidden" name="merchant" value="514219"><br>
          <input type="hidden" name="display_shipping" value="0"><br>
          <input type="hidden" name="shipping_type_1" value="0"><br>
          <input type="hidden" name="currency" value="clp"><br>
          <input type="hidden" name="payment_method_available" value="cl_amex,3,6;cl_diners,3,6;cl_dm;cl_magna,3,6;cl_master,3,6;cl_presto;cl_ripley;cl_servipag;cl_transbank;cl_visa,3,6;"><br>
          <input type="hidden" name="notify_url" value=""><br>
          <input type="hidden" name="buyer_message" value="0"><br>
          <input type="hidden" name="buyer_name" value=""><br>
          <input type="hidden" name="buyer_lastname" value=""><br>
          <input type="hidden" name="buyer_document_number" value=""><br>
          <input type="hidden" name="buyer_email" value=""><br>
          <input type="hidden" name="buyer_phone" value=""><br>
          <input type="hidden" name="buyer_phone_extension" value=""><br>
          <input type="hidden" name="buyer_zip_code" value=""><br>
          <input type="hidden" name="buyer_sex" value=""><br>
          <input type="hidden" name="buyer_document_type" value=""><br>
          <input type="hidden" name="change_quantity" value="0"><br>
          <input type="hidden" name="tool" value="button"><br>
          <input type="hidden" name="ok_url" value=""><br>
          <input type="hidden" name="pending_url" value="http://"><br>
          <input type="hidden" name="error_url" value="http://"><br>
          <input type="hidden" name="header_image" value=""><br>
          <input type="hidden" name="item_currency_1" value="clp"><br>
          <input type="hidden" name="item_name_1" value="'+params[:descripcion]+'"><br>
          <input type="hidden" name="item_code_1" value="-"><br>
          <input type="hidden" name="item_quantity_1" value="1"><br>
          <input type="hidden" name="item_ammount_1" value="'+params[:monto]+'00"><br>
          </form><div style="width: 100%; height: 100%;" id="divPayButtonPreloaderContainer"> 
          <div class="PayPreloaderOpaqueDiv" id="divPreloaderPay" style="left: 38%; top: 30%;">   
          <span class="preloader-message" id="ctl00_lblPleaseWait">Estimado usuario:<br />
          Usted esta siendo redireccionado a <strong>DineroMail.com</strong> nuestro procesador de pago</span>    
          <img src="/shop/imagenes/preloader-big.gif">  </div></div>
          <script type="text/javascript">setTimeout("document.f.submit();", 500);</script></body></html>
        '
        #  file << contact.firstname + ',' + contact.lastname + '\n'
        send_data file, :filename => 'buscoterapia_pago_'+params[:monto]+'.html', :type => 'text/html'
      end
  end
end
