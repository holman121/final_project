class AboutsController < ApplicationController
  def index
    @about_all = About.all

  end
end
