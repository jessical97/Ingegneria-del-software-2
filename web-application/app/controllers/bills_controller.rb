# Controller for the bill list
class BillsController < ApplicationController
  before_action :set_bill, only: %I[show edit destroy]

  # GET /bills
  # GET /bills.json
  def index
    @bills = Bill.all
  end

  # GET /bills/1
  # GET /bills/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "jessica", template: 'bills/show.html.erb'
      end
    end
  end


  # GET /bills/new
  def new
    @bill = Bill.new
  end

  # GET /bills/1/edit
  def edit; end

  def correct_execution(format, status)
    format.html do
      redirect_to @bill
    end
    format.json { render :show, status: status, location: @bill }
  end

  def error_execution(format, status)
    format.html { render status }
    format.json do
      render json: @activity.errors,
             status: :unprocessable_entity
    end
  end

  # POST /bills
  # POST /bills.json
  def create
    @bill = Bill.new(bill_params)

    # insert here
    respond_to do |format|
      if @bill.save
        flash[:success] = 'Bill was successfully created.'
        correct_execution format, :created
      else
        error_execution format, :new
      end
    end
  end

  # DELETE /bills/1
  # DELETE /bills/1.json
  def destroy
    @bill.destroy
    respond_to do |format|
      format.html do
        flash[:success] = 'Bill was successfully destroyed.'
        redirect_to bills_url
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bill
    @bill = Bill.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def bill_params
    client_id = params[:bill].delete :client
    params[:bill][:client_id] = client_id
    params.require(:bill).permit(:import, :client_id)
  end
end
