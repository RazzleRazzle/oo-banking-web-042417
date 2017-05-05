require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if @sender.valid? == true && self.status == 'pending' && @sender.balance > @amount
      @status = "complete"
      @sender.balance -= @amount
      @receiver.balance += @amount
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == 'complete'
      self.status = "reversed"
      @sender.balance += @amount
      @receiver.balance -= @amount

    end
  end
end
