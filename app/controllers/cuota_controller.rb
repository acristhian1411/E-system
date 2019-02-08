class CuotaController < ApplicationController

  def new
    @cuota = CuotaCliente.new
  end

  def create
    @cuota = CuotaCliente.new(cuota_params)
     respond_to do |format|
       if @cuota.save
         format.html { redirect_to admin_ventum_path, notice: 'Marca fue creado con éxito.' }
         format.json { render :show, status: :created, location: @credito }
       else
         format.html { render :new }
         format.json { render json: @cuota.errors, status: :unprocessable_entity }
       end
 end
  end

  def edit

  end

  def update

        respond_to do |format|
          if @cuota.update(cuota_params)
            format.html { redirect_to admin_ventum_path, notice: 'Marca fue actualizado con éxito.' }
            format.json { render :show, status: :ok, location: @credito }
          else
            format.html { render :edit }
            format.json { render json: @cuota.errors, status: :unprocessable_entity }
          end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credito
      @cuota = CuotaCliente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cuota_params
      params.require(:cuota_clientes).permit(:cantidad_cuota, :estado, :intereses, :monto_cuota, :monto_pagado, :vencimiento, :credito_cliente_id )

end

end
