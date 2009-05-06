class Account < ActiveRecord::Base
  belongs_to :plan
  belongs_to :user, :condition => "active = 1"
  has_many :languages, :through => :translator
  has_many :translations, :dependent => :destroy
  has_many :uploads, :dependent => :destroy
  
end
