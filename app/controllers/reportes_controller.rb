class ReportesController < ApplicationController

    def new
        @reporte = Reporte.new
        @swiper_reportado_id = params[:id_a]
    end

    def create
        reporte_params = params.require(:reporte).permit(:contenido, :swiper_reporta_id,
                                                               :swiper_reportado_id)                               
        
        @reporte = Reporte.create reporte_params

        @swiper_reporta_id = reporte_params[:swiper_reporta_id]
        @swiper_reportado_id = reporte_params[:swiper_reportado_id]

        if @reporte.save
            Swiper.find(@swiper_reporta_id).matchs.delete(@swiper_reportado_id)
            redirect_to lista_matchs_path(@swiper_reporta_id), notice: 'reporte enviado'
        else
            redirect_to reportar_swiper_path(@swiper_reportado_id), notice: @reporte.errors
        end
    end

    def index
        @reportes = Reporte.all
    end
end
