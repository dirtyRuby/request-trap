class UserAttrFormat < ActiveModel::Validator
  SYMBOL_SET = ['!', '@', '#', '%', '^', '&', '*', '(', ')', '=', '+', '|' ]

  def validate(record)
    if options[:fields].any? do |field|
      include = false
      unless record.send(field).nil?
        SYMBOL_SET.each do |symbol|
          if record.send(field).include?(symbol)
              record.errors[:base] << "Contains ancceptable symbol."
              include = true
              break
          end
        end
        break if include
      end
    end
    end
  end
end

class User < ActiveRecord::Base
  validates :user_name, presence: true, uniqueness: true
  validates_with UserAttrFormat, fields: [:user_name, :password_digest]
  validates_each :user_name, :password_digest do |record, attr, value|
    record.errors.add(attr, "Must include at least 1 upper case letter.") unless value.nil? || value.match(/[A-Z]/)
  end
  has_secure_password

  after_destroy :ensure_if_admin_remains



  private
  def ensure_if_admin_remains
    raise "Can't delete last admin user." if User.count.zero?
  end

end