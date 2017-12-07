# Controller for the bill list
class SettingsController < ApplicationController
  before_action :set_settings, only: %I[update]

  # GET /settings
  # GET /settings.json
  def index
    set_settings
  end

  def correct_execution(format, status)
    format.html do
      redirect_to action: 'index'
    end
    format.json { render :show, status: status, location: @settings }
  end

  def error_execution(format, status)
    format.html { render status }
    format.json do
      render json: @settings.errors,
             status: :unprocessable_entity
    end
  end

  # PATCH/PUT /settings
  # PATCH/PUT /settings.json
  def update
    respond_to do |format|
      if settings_update settings_params
        flash[:success] = 'Settings was successfully updated.'
        correct_execution format, :ok
      else
        flash[:error] = 'Error during the update of the settings.'
        error_execution format, :index
      end
    end
  end

  private

  def settings_update(settings_params)
    price_correct = price settings_params
    invoice_template_correct = invoice_template settings_params
    invoice_template_correct && price_correct
  end

  def price(settings_params)
    if @settings.price != settings_params['price'].to_f
      price_params = {
        import: settings_params['price']
      }
      @price = Price.new(price_params)
      return @price.save
    end
    true
  end

  def invoice_template(settings_params)
    if settings_params['invoice_template']
      invoice_params = {
        template: settings_params['invoice_template']
      }
      @invoice_template = InvoiceTemplate.new(invoice_params)
      return @invoice_template.save
    end
    true
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_settings
    last_price = Price.order(created_at: :desc).first
    price = last_price.nil? ? 0.0 : last_price.import
    last_invoice_template = InvoiceTemplate.order(created_at: :desc).first
    invoice_template = last_invoice_template.nil? ? 0.0 : last_invoice_template
    @settings = Setting.new(price: price,
                            invoice_template: invoice_template)
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def settings_params
    params.require(:setting).permit(:invoice_template,
                                    :price)
  end
end
