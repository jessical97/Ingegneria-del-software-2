# This exception permit to manage error that became during the bill process
# creation
class BillGenerationException < StandardError
  attr_reader :msg_to_print
  attr_reader :bill
  def initialize(msg = 'Error during the bill generation',
                 msg_to_print = nil,
                 bill = nil)
    @msg_to_print = msg_to_print
    @bill = bill
    super(msg)
  end
end
