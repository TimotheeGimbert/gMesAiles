class EmailsController < ApplicationController

  def index
    @emails = Email.all
  end

  def create
    @email = Email.new(object: Faker::Ancient.god, body: Faker::Lorem.sentence(word_count: 11))
    puts @email
    if @email.save 
      puts @email
      redirect_to emails_path
    else
      flash.now[:danger] = 'Invalid email parameters !'
      render 'new'
    end

    respond_to do |format|
      format.html { redirect_to emails_path }
      format.js { }
    end

  end

end
