# This exception permit to manage error that became during the bill process
# creation
class BillGenerationException < StandardError
  attr_reader :msg_to_print
  def initialize(msg = 'Error during the bill generation', msg_to_print = nil)
    @msg_to_print = msg_to_print
    super(msg)
  end
end
