require "#{Rails.root}/lib/controller_formatter/client_formatter"

# All the function neccesary to answer to rest request about clients
class ClientsController < ApplicationController
  include ClientFormatter
  before_action :set_client, only: %I[show edit update destroy]

  # GET /clients
  # GET /clients.json
  def index
    @not_destroyable_client = {}
    @clients = Client.all.map do |t|
      t = ClientFormatter.client_showing(t)
      if (Bill.where(client_id: t.id).count(:all) +
         Activity.where(client_id: t.id).count(:all)).zero?
        @not_destroyable_client[t.id] = true
      end
      t
    end
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    element = @client.becomes(Client)
    element[:type] = (element[:type] == 'BusinessClient' ? 1 : 0)
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
    element = @client.becomes(Client)
    element[:type] = (element[:type] == 'BusinessClient')
    @client = element
  end

  def correct_execution(format, status)
    format.html do
      redirect_to @client.becomes(Client)
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
    @client = ClientFormatter.client_conversion client_params
    respond_to do |format|
      if @client.save
        flash[:success] = 'Client was successfully created.'
        correct_execution format, :created
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
      if update_client(client_params)
        flash[:success] = 'Client was successfully updated.'
        correct_execution format, :ok
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
        flash[:success] = 'Client was successfully destroyed.'
        redirect_to clients_url
      end
      format.json { head :no_content }
    end
  end

  private

  def update_client(client_params)
    update_params = ClientFormatter.client_params_conversion(client_params)
    update_successful = @client.update(update_params.except(:type))
    @client = @client.becomes(Client)
    update_successful
  end

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
