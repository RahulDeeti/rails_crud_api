class User < ApplicationRecord
    has_many :facts, dependent: :destroy
end
