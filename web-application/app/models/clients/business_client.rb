# Contain the format of business client store in DB
class BusinessClient < Client
  VALID_CLIENTS_PIVA = /\A[0-9]{11}\z/

  validates(:ssn,
            presence: true,
            format: { with: VALID_CLIENTS_PIVA },
            uniqueness: { case_sensitive: false })

  def complete_name
    name
  end
end
