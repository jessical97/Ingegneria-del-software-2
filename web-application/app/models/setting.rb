# This is the model used to assembly data from various table and export
# to client
class Setting
  include ActiveModel::Model
  extend ActiveModel::Naming
  extend ActiveModel::Callbacks

  include ActiveModel::Validations
  include Paperclip::Glue

  # Paperclip required callbacks
  define_model_callbacks :save, only: %I[after]
  define_model_callbacks :destroy, only: %I[before after]

  attr_accessor :invoice_template_file_name
  attr_accessor :name
  attr_reader   :errors
  attr_reader :price, :invoice_template

  has_attached_file :invoice_template

  def initialize(attributes = {})
    @price = attributes[:price]
    @invoice_template = attributes[:invoice_template]
    @errors = ActiveModel::Errors.new(self)
  end

  # The following methods are needed to be minimally implemented
  def read_attribute_for_validation(attr)
    send(attr)
  end

  def import; end

  def self.human_attribute_name(attr, _options = {})
    attr
  end

  def self.lookup_ancestors
    [self]
  end

  # def to_model
  #   self
  #   # You will get to_model error, if you don't have this dummy method
  # end

  # def valid?
  #   true
  # end

  # def new_record?
  #   true
  # end

  # def destroyed?
  #   true
  # end

  def add_errors(element, type, message)
    @errors.add(element, type, message: message)
  end

  # You need this otherwise you get an error
  # def persisted?
  #   false
  # end
end
