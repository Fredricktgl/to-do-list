class List < ApplicationRecord

    validates :message, presence: true
    validates :datetime, presence: true

end
