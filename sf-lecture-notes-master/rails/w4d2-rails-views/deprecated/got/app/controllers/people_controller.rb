class PeopleController < ApplicationController
  def index
    @people = Person.all
    render :index
  end

  def new
    render :new
  end

  def create
    person = Person.new(person_params)
    if person.save
      redirect_to people_url
    else
      fail "WHat"
    end
  end

  def show
    # @person = Person.find(params[:id])
    @person = Person.find_by(id: params[:id])
    if @person
      render :show
    else
      fail "What"
    end
  end

  def destroy
    @person = Person.find_by(id: params[:id])
    @person.destroy
    redirect_to people_url
  end

  private

  def person_params
    params.require(:person).permit(:name, :picture_url)
  end
end
