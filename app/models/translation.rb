class Translation < ActiveRecord::Base
  belongs_to :account
  belongs_to :upload
  belongs_to :start_language, :class_name => "Language", :foreign_key => "start_language_id"
  belongs_to :end_language, :class_name => "Language", :foreign_key => "end_language_id"

end
