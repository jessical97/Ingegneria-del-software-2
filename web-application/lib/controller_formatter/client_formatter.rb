# A sereis of method util to format printed information inside client controller
module ClientFormatter
  def self.country_name(country_code)
    country = ISO3166::Country.new(country_code)
    country.translation(I18n.locale.to_s) || country.name
  end

  def self.client_showing(business_or_private_client)
    name = business_or_private_client.complete_name
    client = business_or_private_client.becomes(Client)
    client[:name] = name
    client[:country] = country_name(client[:country])
    client
  end

  def self.client_conversion(parameter)
    type = parameter[:type]
    new_params = parameter.except(:type)
    return PrivateClient.new(new_params) if type == '0'
    BusinessClient.new(new_params)
  end

  def self.client_params_conversion(parameter)
    type = parameter[:type]
    new_params = parameter.except(:type)
    new_params[:type] = type == '0' ? :PrivateClient : :BusinessClient
    new_params
  end
end
