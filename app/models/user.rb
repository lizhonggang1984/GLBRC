# since many-to-many relationship is hard to manage, this showcase we are using one to many
# each app belongs to one user, one user can has many apps

class User < ApplicationRecord
  validates(:login, presence: true,uniqueness: true)
  validates(:password, presence: true,uniqueness: false)
  has_many :apps
end
