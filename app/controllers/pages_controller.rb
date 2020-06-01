class PagesController < ApplicationController
    def home
    end

    def swiper_acepta
        @swiper = Swiper.find params[:id]
        @swipers_all = Swiper.all
        @swipers_recomendados = Array.new
        @swipers_all.each do |swiper_all|
            added = false
            swiper_all.gustos do |gusto|
                if @swiper.gustos.include?(gusto)
                    @swipers_recomendados << swiper_all
                    added = true
                end
            end
            if (swiper_all.comuna.nombre == @swiper.comuna.nombre) && (not added) && 
                (@swiper.id != swiper_all.id)
                @swipers_recomendados << swiper_all
            end
        end

    end
end
