class PagesController < ApplicationController
  def home
  end

  def about
  end

  def bryan
  end

  def dad
  end

  def david
  	@data = params[:David_answer]  	
  end

  def answer
  end
end
