class FactsController < ApplicationController
  def index
    @facts = Fact.all

    # debugger

    respond_to do |format|
      format.html { render :index }
      format.json { render :index }
    end

    # respond_to :html, :json
  end

  def show
    @fact = Fact.find(params[:id])
  end

  def create
    @fact = Fact.new(fact_params)

    respond_to do |format|
      if @fact.save
        format.html { render :show }
        format.json { render :show }
      else
        render json: ['Could not create tweet']
      end
    end
  end

  def destroy
    @fact = Fact.find(params[:id])

    @fact.destroy
    respond_to do |format|
      format.html { render :show }
      format.json { render :show }
    end
  end

  private
  def fact_params
    params.require(:fact).permit(:body)
  end
end
