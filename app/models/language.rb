class Language < ActiveRecord::Base
  has_many :start_languages, :class_name => "Translation", :foreign_key => "start_language_id"
  has_many :end_languages, :class_name => "Translation", :foreign_key => "end_language_id"
end
