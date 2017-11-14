# All the function neccesary to answer to rest request about clients
class ClientsController < ApplicationController
  before_action :set_client, only: %I[show edit update destroy]

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all
  end

  # GET /clients/1
  # GET /clients/1.json
  def show; end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit; end

  def correct_execution(format, message, status)
    format.html do
      redirect_to @client,
                  notice: message
    end
    format.json { render :show, status: status, location: @client }
  end

  def error_execution(format, status)
    format.html { render status }
    format.json do
      render json: @client.errors,
             status: :unprocessable_entity
    end
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        correct_execution format, 'Client was successfully created.', :created
      else
        error_execution format, :new
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        correct_execution format, 'Client was successfully updated.', :ok
      else
        error_execution format, :edit
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html do
        redirect_to clients_url,
                    notice: 'Client was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_client
    @client = Client.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def client_params
    params.require(:client).permit(:type,
                                   :name,
                                   :surname,
                                   :address,
                                   :cap,
                                   :city,
                                   :country,
                                   :ssn)
  end
end
