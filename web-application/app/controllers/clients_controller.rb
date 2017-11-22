require "#{Rails.root}/lib/controller_formatter/client_formatter"

# All the function neccesary to answer to rest request about clients
class ClientsController < ApplicationController
  include ClientFormatter
  before_action :set_client, only: %I[show edit update destroy]

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all.map do |t|
      ClientFormatter.client_showing(t)
    end
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    element = @client.becomes(Client)
    element[:type] = (element[:type] == :BusinessClient ? 1 : 0)
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
    element = @client.becomes(Client)
    element[:type] = (element[:type] == :BusinessClient ? 1 : 0)
    @client = element
  end

  def correct_execution(format, message, status)
    format.html do
      redirect_to @client.becomes(Client),
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

  def client_conversion(parameter)
    type = parameter[:type]
    new_params = parameter.except(:type)
    @client = if type == '0'
                PrivateClient.new(new_params)
              else
                BusinessClient.new(new_params)
              end
  end

  def client_params_conversion(parameter)
    type = parameter[:type]
    new_params = parameter.except(:type)
    new_params[:type] = type == '0' ? :PrivateClient : :BusinessClient
    new_params
  end

  # POST /clients
  # POST /clients.json
  def create
    client_conversion client_params
    respond_to do |format|
      if @client.save
        correct_execution format, 'Client was successfully created.', :created
      else
        @client = @client.becomes(Client)
        error_execution format, :new
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      update_params = client_params_conversion(client_params)
      if @client.update(update_params.except(:type))
        correct_execution format, 'Client was successfully updated.', :ok
      else
        error_execution format, :edit
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    client = @client.becomes(Client)
    client.destroy
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
