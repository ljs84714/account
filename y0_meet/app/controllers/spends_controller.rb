class SpendsController < ApplicationController
before_action :find_account
  before_action :set_spend, only: [:show, :edit, :update, :destroy]

  # GET /spends
  # GET /spends.json
  def index
    @spends = Spend.all
  end

  # GET /spends/1
  # GET /spends/1.json
  def show
  end

  # GET /spends/new
  def new
    @spend = Spend.new
  end

  # GET /spends/1/edit
  def edit
  end

  # POST /spends
  # POST /spends.json
  def create
    @spend = @account.spends.new(spend_params)

    respond_to do |format|
      if @spend.save
        format.html { redirect_to[@account, @spend], notice: 'Spend was successfully created.' }
        format.json { render :show, status: :created, location: @spend }
      else
        format.html { render :new }
        format.json { render json: @spend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spends/1
  # PATCH/PUT /spends/1.json
  def update
    respond_to do |format|
      if @spend.update(spend_params)
        format.html { redirect_to @spend, notice: 'Spend was successfully updated.' }
        format.json { render :show, status: :ok, location: @spend }
      else
        format.html { render :edit }
        format.json { render json: @spend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spends/1
  # DELETE /spends/1.json
  def destroy
    @spend.destroy
    respond_to do |format|
      format.html { redirect_to spends_url, notice: 'Spend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def  find_account
     @account=Account.find(params[:account_id])
    
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_spend
      @spend = Spend.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spend_params
      params.require(:spend).permit(:name, :info)
    end
end
