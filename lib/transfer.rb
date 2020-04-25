class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  @reject_transfer = false
  def execute_transaction
    if self.valid? && @sender.balance >= @amount && @status == "pending" && @reject_transfer = false
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
      @reject_transfer = true
    elsif self.valid? == false && @sender.balance < @amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
@reject_transfer = true


  end


end
