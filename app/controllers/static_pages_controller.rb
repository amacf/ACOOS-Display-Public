class StaticPagesController < ApplicationController
  def home
  	@images = BackgroundImage.all;
  end

  def nav
  	system("killall matchbox-keyboard");
  end

  def artifacts

  end

  def churchHistory

  end

  def genocideHistory

  end

  def genocideMap

  end

  def saroyanQuote

  end

  def aroianHistory

  end

  def kazarianHistory

  end
end
