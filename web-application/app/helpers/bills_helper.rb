# Contain function that can be called to help on view showing by bill views
module BillsHelper
  def clients_list
    Client.all.map do |client|
      [client.complete_name, client.id]
    end
  end
end
