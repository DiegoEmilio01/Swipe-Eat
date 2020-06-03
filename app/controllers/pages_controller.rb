class PagesController < ApplicationController
    def home
    end

    def swiper_acepta
        @swiper = Swiper.find params[:id]
        @swipers_all = Swiper.all
        @swipers_recomendados = Array.new
        @swipers_all.each do |swiper_all|
            added = false
            swiper_all.gustos.each do |gusto|
                if (@swiper.gustos.include?(gusto)) && (not added)
                    @swipers_recomendados << swiper_all
                    added = true
                end
            end
        end

    end

end