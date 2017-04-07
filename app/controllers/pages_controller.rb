class PagesController < ApplicationController
  def show
    render layout: false, template: "pages/#{params[:page]}"
  end
end
