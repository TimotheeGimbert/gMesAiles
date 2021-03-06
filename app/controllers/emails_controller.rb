class EmailsController < ApplicationController

  def index
    @emails = Email.all
  end

  def create
    @email = Email.new(object: Faker::Ancient.god, body: Faker::Lorem.sentence(word_count: 11))
    if @email.save 
      puts @email
    else
      flash.now[:danger] = 'Invalid email parameters !'
      render 'new'
    end

    respond_to do |format|
      format.html { redirect_to emails_path }
      format.js { }
    end
  end

  def show 
    @email = Email.find(params[:id])

    respond_to do |format|
      format.html { redirect_to email_path(params[:id]) }
      format.js { }
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy

    respond_to do |format|
      format.html { redirect_to emails_path(params[:id]) }
      format.js { }
    end
  end

end
