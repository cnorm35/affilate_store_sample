class Visit < ActiveRecord::Base
  has_many :ahoy_events, class_name: "Ahoy::Event"
  belongs_to :user

  default_scope { order( 'started_at DESC') }
end
