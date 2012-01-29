class PortfolioController < ApplicationController
  # sessions :off

  def section
    @section = if params[:section]
      Section.find(params[:section])
    else
      Section.first
    end
  end
end
