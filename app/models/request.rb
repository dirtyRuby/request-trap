class Request < ActiveRecord::Base
  serialize :parameters
  serialize :headers

  #
  # One-to-many dependency.
  #
  belongs_to :trap

end
