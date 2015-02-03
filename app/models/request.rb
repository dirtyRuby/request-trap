class Request < ActiveRecord::Base
  #
  # One-to-many dependency.
  #
  belongs_to :trap

end
