class Card < ActiveRecord::Base
  validates :original_text, :translated_text, :review_date, presence: true
  validate :inequality_of_original_and_translated_texts

  def inequality_of_original_and_translated_texts
    if original_text.downcase.eql? translated_text.downcase
      errors.add(original_text, "translated_text cannot be same as original")
    end
  end
end
