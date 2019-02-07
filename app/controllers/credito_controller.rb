class CreditoController < ApplicationController

  def new
    @credito = CreditoCliente.new
  end

  def create
    @credito = CreditoCliente.new(credito_params)
     respond_to do |format|
       if @credito.save
         format.html { redirect_to admin_ventum_path, notice: 'Marca fue creado con éxito.' }
         format.json { render :show, status: :created, location: @credito }
       else
         format.html { render :new }
         format.json { render json: @credito.errors, status: :unprocessable_entity }
       end
 end
  end

  def edit

  end

  def update

        respond_to do |format|
          if @credito.update(credito_params)
            format.html { redirect_to admin_ventum_path, notice: 'Marca fue actualizado con éxito.' }
            format.json { render :show, status: :ok, location: @credito }
          else
            format.html { render :edit }
            format.json { render json: @credito.errors, status: :unprocessable_entity }
          end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credito
      @credito = CreditoCliente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credito_params
      params.require(:credito_clientes).permit(:venta_id, :cliente_id, cuota_clientes_attributes:[:id, :cantidad_cuota, :estado, :intereses, :monto_cuota, :monto_pagado, :vencimiento] )

end

end
