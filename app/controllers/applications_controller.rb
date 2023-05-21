class ApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:id])
<<<<<<< HEAD
    @pets = PetApplication.where(application: @application.id)
    @submitted = false
=======
    @pet_applications = PetApplication.where(application: @application.id)
>>>>>>> 620378a02e1f3f8b413013b15fc5d33ade7b1b8b
  end

  def new
  end
  
  def create
      # if !application_params.each do |param|
      #     param.blank?
      # end
      @application = Application.new(application_params)
      # require 'pry'; binding.pry
      if @application.save
        redirect_to "/applications/#{@application.id}"
      else
      redirect_to "/applications/new"
      end
  end

  def search
    show
    @query = Pet.where(name: params[:search])
  end

  def update
    show
    @application.update(application_status: "Pending")
    # @query.first might be problematic.
    redirect_to "/applications/#{@application.id}"
    @submitted = true
  end

  private
  def application_params

    params.permit(:name, :street_address, :city, :state, :zip_code, :description)
  end


end