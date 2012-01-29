class PortfolioController < ApplicationController
  def section
    @section = if params[:section]
      Section.find(params[:section])
    else
      Section.first
    end
    @image = @section.images.first || Image.new
  end
end
