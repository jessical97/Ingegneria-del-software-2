# Contain the format of private client store in DB
class PrivateClient < Client
  VALID_NAME_OR_SURNAME = /\A[a-z ,.'-]+\z/i
  VALID_CLIENTS_CF = /\A(?:[B-DF-HJ-NP-TV-Z](?:[AEIOU]{2}|[AEIOU]X)|[AEIOU]{2}X|
                        [B-DF-HJ-NP-TV-Z]{2}[A-Z]){2}[\dLMNP-V]{2}
                        (?:[A-EHLMPR-T](?:[04LQ][1-9MNP-V]|
                        [1256LMRS][\dLMNP-V])|[DHPS][37PT][0L]|
                        [ACELMRT][37PT][01LM])(?:[A-MZ][1-9MNP-V][\dLMNP-V]{2}|
                        [A-M][0L](?:[\dLMNP-V][1-9MNP-V]|
                        [1-9MNP-V][0L]))[A-Z]\z/x

  validates(:name,
            presence: true,
            format: { with: VALID_NAME_OR_SURNAME })
  validates(:surname,
            presence: true,
            format: { with: VALID_NAME_OR_SURNAME })

  validates(:ssn,
            presence: true,
            format: { with: VALID_CLIENTS_CF },
            uniqueness: { case_sensitive: false })

  def complete_name
    name + ' ' + surname
  end
end
