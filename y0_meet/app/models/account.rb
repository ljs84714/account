class Account < ActiveRecord::Base
has_many :spends
belongs_to :user
end
