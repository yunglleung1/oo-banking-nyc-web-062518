class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if sender.status = "open" && receiver.status == "open"
      true
    end
    sender.valid?
    receiver.valid?
  end

  def execute_transaction
    #counter = 0
    if sender.valid? == true && sender.balance > @amount && self.status == "pending"
      sender.balance -= @amount
      receiver.balance += @amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status = "complete" && sender.balance != 1000 && receiver.balance != 1000
      sender.balance += @amount
      receiver.balance -= @amount
      self.status = "reversed"
    end
  end
end
