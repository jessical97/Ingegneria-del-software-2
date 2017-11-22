# Controller for the bill list
class BillsController < ApplicationController
  before_action :set_bill, only: %I[show edit update destroy]

  # GET /bills
  # GET /bills.json
  def index
    @bills = Bill.all
  end

  # GET /bills/1
  # GET /bills/1.json
  def show; end

  # GET /bills/new
  def new
    @bill = Bill.new
  end

  # GET /bills/1/edit
  def edit; end

  def correct_execution(format, message, status)
    format.html do
      redirect_to @bill,
                  notice: message
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

    respond_to do |format|
      if @bill.save
        correct_execution format, 'Bill was successfully created.', :created
      else
        error_execution format, :new
      end
    end
  end

  # PATCH/PUT /bills/1
  # PATCH/PUT /bills/1.json
  def update
    respond_to do |format|
      if @bill.update(bill_params)
        correct_execution format, 'Bill was successfully updated.', :ok
      else
        error_execution format, :edit
      end
    end
  end

  # DELETE /bills/1
  # DELETE /bills/1.json
  def destroy
    @bill.destroy
    respond_to do |format|
      format.html do
        redirect_to bills_url,
                    notice: 'Bill was successfully destroyed.'
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
    params.require(:bill).permit(:import, :client_id)
  end
end