# since many-to-many relationship is hard to manage, this showcase we are using one to many
# each app belongs to one user, the app has its own user_id filed

class App < ApplicationRecord
  belongs_to :user
end
