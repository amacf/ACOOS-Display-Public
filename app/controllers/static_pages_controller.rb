class StaticPagesController < ApplicationController
  def home
  	@images = BackgroundImage.all;
  end

  def nav
  	system("killall matchbox-keyboard");
  end
end
