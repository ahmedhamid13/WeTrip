class Contact < ApplicationRecord
    validates_presence_of :email, :message # required
end
