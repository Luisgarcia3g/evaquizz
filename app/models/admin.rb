class Admin < ActiveRecord::Base
    scope :active, -> { where(is_active: true) }
 validates(:name, presence: true)
 has_secure_password
end
