class User < ActiveRecord::Base
  has_one :registration, :dependent => :destroy
  has_one :account, :dependent => :destroy
  has_one :plan, :through => :account
  has_many :languages, :through => :account
  has_many :translations, :through => :account
  has_many :uploads, :through => :account
  
end
