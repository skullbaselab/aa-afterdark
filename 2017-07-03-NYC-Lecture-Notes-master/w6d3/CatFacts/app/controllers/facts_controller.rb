class FactsController < ApplicationController
  def index
    @facts = Fact.all

    # this says "when I get a request that wants html back render index.html.erb"
    # "and when I get a request that wants json render index.json.jbuilder"
    respond_to do |format|
      format.html { render :index }
      format.json { render :index }
    end
  end

  def show
    @fact = Fact.find(params[:id])
  end

  def create
    @fact = Fact.new(fact_params)

    if @fact.save
      respond_to do |format|
        # just like in the old days, rails knew to look for "app/views/facts/show.html.erb"
          format.html { render :show }
          # so rails knows to look for "app/views/facts/show.json.jbuilder"
          format.json { render :show }
      end
    else
      # must put a status to tell javascript we failed
      render json: ['Could not create fact'], status: 422
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
