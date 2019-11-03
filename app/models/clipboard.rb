class Clipboard < ApplicationRecord
  belongs_to :user
  before_save :make_recent

  def already_copied?
    matched = Clipboard.where(user_id: user_id, content: content)
    matched.any?
  end

  def is_most_recent?
    recent_clipboard = Clipboard.where(user_id: user_id).order(id: :desc).limit(1)
    recent_clipboard.first.content == content
  end

  def make_recent
    if already_copied? && !is_most_recent?
      self.touch(:updated_at)
    elsif already_copied?
      errors.add(:base, "Already copied!")
      throw(:abort)
    end
  end
end
