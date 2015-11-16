class StaticPagesController < ApplicationController
  def home
  	@images = BackgroundImage.all;
  end

  def nav
  end
end
