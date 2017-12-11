require(Rails.root.join('lib', 'bill_generation', 'bill_parameter'))
require(Rails.root.join('lib', 'bill_generation', 'bill_creation'))

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
        send_file(
          @bill.invoice.path,
          type: 'application/pdf',
          disposition: 'inline'
        )
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
    format.html do
      render status
    end
    format.json do
      render json: @bill.errors,
             status: :unprocessable_entity
    end
  end

  def invoice_and_bill_inizializer(client)
    number_of_hour = BillParameter.recovery_number_of_hour(client)
    @bill = BillParameter.bill_fullfilement(
      @bill, number_of_hour, BillParameter.recovery_price
    )
    BillParameter.invoice_parameter_init(
      client, @bill, number_of_hour
    )
  end

  def bill_correct_generation(format)
    flash[:success] = 'Bill was successfully created.'
    correct_execution format, :created
  end

  def error_message_and_redirect(format, msg_to_print)
    flash[:error] = msg_to_print unless msg_to_print.nil?
    error_execution format, :new
  end

  def bill_insert(format, bill_params)
    @bill = BillParameter.bill_initialization bill_params
    client = Client.find @bill.client_id
    invoice_parameter = invoice_and_bill_inizializer(client)
    @bill.transaction do
      BillCreation.bill_generation(@bill, invoice_parameter, client)
    end
    bill_correct_generation(format)
  end

  # POST /bills
  # POST /bills.json
  def create
    respond_to do |format|
      begin
        bill_insert(format, bill_params)
      rescue ActiveRecord::RecordInvalid
        error_message_and_redirect(format, bill_error.msg_to_print)
      rescue BillGenerationException => bill_error
        @bill = bill_error.bill unless bill_error.bill.nil?
        error_message_and_redirect(format, bill_error.msg_to_print)
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
    params.require(:bill).permit(:client_id)
  end
end
