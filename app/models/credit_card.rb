class CreditCard < ActiveRecord::Base
  belongs_to :user
  belongs_to :cc_type
  
  validates_presence_of :number
  validates_length_of :number, :is => 16
  validates_format_of :number, :with => /\A[0-9]+\z/, :message => ": Only numbers are allowed" 
  
  def encrypt
    self.salt = "salt"
    self.number = self.number + "_encrypted"
    self.month = self.month + "_encrypted"
    self.year = self.year + "_encrypted"
  end
  
end
