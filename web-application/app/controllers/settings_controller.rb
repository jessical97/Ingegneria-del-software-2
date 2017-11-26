# Controller for the bill list
class SettingsController < ApplicationController
  before_action :set_settings, only: %I[update]

  # GET /settings
  # GET /settings.json
  def index
    set_settings
  end

  def correct_execution(format, message, status)
    format.html do
      redirect_to action: 'index',
                  notice: message
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
      price_correct = price settings_params
      invoice_template_correct = invoice_template settings_params
      if invoice_template_correct && price_correct
        correct_execution format, 'Settings was successfully updated.', :ok
      else
        error_execution format, :index
      end
    end
  end

  private

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
    price = Price.order(:created_at).first.import
    invoice = InvoiceTemplate.order(:created_at).limit(1)[0]
    @settings = Setting.new(price: price,
                            invoice_template: invoice)
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def settings_params
    params.require(:setting).permit(:invoice_template,
                                    :price)
  end
end
