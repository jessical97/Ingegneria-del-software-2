# Contain the format of client store in DB
class Client < ApplicationRecord
  # Contain the format of business client store in DB
  class BusinessClient < Client
  end

  # Contain the format of private client store in DB
  class PrivateClient < Client
  end
end
