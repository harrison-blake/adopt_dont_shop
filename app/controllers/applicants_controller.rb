class ApplicantsController < ApplicationController

  def index
    @applicants = Applicant.all
  end

  def show
    # @user_pet = Pet.find(id: pet_id)
    @applicant = Applicant.find(params[:id])
    if params[:name]
      @pets = Pet.where(name: params[:name])
    end
  end

  def new
  end

  def create
    @app = Applicant.create(name: params[:name],
                            street: params[:street],
                            city: params[:city],
                            state: params[:state],
                            zip: params[:zip],
                            description: params[:description],
                            status: "In Progress"
                            )
    if @app.save
      redirect_to "/applicants/#{@app.id}"
      return
    else
      flash[:notice] = "Application not created: Required information missing."
      render 'new'
    end
  end

  def create_rel
    binding.pry
  end

  def show_applicant_pets
    @applicant = Applicant.find(params[:id])
    # binding.pry
  end

  # private
  # def applicant_params()
  #   params.permit(:name, :street, :city, :state, :zip, :description, :status)
  # end
end
