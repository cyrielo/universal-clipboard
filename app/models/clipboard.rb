class Clipboard < ApplicationRecord
  belongs_to :user

  def copy_to_clipboard content
    if already_copied?(uid, content)
      make_recent(uid, content)
    else
      new_copy = self.new(:uid, :content)
      new_copy.save!
    end
  end

  def self.history
    self.all.to_json
  end

  def clear_history
    self.destroy_all
  end

  def already_copied? content
    exists = self.find_where(content: content)
    exists.any?
  end

  def make_recent(uid, content)
    self.destroy_where(content: content)
    copy_to_clipboard(uid, content)
  end
end
