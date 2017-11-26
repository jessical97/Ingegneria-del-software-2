# All the function neccesary to answer to rest request about activity
class ActivitiesController < ApplicationController
  before_action :set_activity, only: %I[show edit update destroy]

  # GET /activities
  # GET /activities.json
  def index
    @activities = Activity.all
    @clients_names = {}
    @activities.each do |value|
      @clients_names[value.client_id] = Client.find(value.client_id)
                                              .complete_name
    end
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
    @client_name = Client.find(@activity.client_id).complete_name
  end

  # GET /activities/new
  def new
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit; end

  def correct_execution(format, message, status)
    format.html do
      redirect_to @activity,
                  notice: message
    end
    format.json { render :show, status: status, location: @activity }
  end

  def error_execution(format, status)
    format.html { render status }
    format.json do
      render json: @activity.errors,
             status: :unprocessable_entity
    end
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = Activity.new(activity_params)
    respond_to do |format|
      if @activity.save
        correct_execution format, 'Activity was successfully created.', :created
      else
        error_execution format, :new
      end
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        correct_execution format, 'Activity was successfully updated.', :ok
      else
        error_execution format, :edit
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html do
        redirect_to activities_url,
                    notice: 'Activity was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_activity
    @activity = Activity.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def activity_params
    params.require(:activity).permit(:hours, :client_id)
  end
end
