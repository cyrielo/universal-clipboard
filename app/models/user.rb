class User < ApplicationRecord
  has_many: clipboards, dependent :destroy
end
