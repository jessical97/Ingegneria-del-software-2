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
  attr_reader :price, :invoice_template

  has_attached_file :invoice_template
  validates_attachment :invoice_template, content_type: {
    content_type: 'text/html'
  }

  def initialize(attributes = {})
    @price = attributes[:price]
    @invoice_template = attributes[:invoice_template]
  end

  def to_model
    self
    # You will get to_model error, if you don't have this dummy method
  end

  def valid?
    true
  end

  def new_record?
    true
  end

  def destroyed?
    true
  end

  def errors
    obj = Object.new

    def obj.[](_key)
      []
    end

    def obj.full_messages
      []
    end
    obj
  end

  # You need this otherwise you get an error
  def persisted?
    false
  end
end
