class Card < ActiveRecord::Base
  validates :original_text, :translated_text, presence: true
  validate :inequality_of_original_and_translated_texts

  after_validation :set_review_date

  protected
    def set_review_date
      self.review_date = Date.today + 3
    end

    def inequality_of_original_and_translated_texts
      if original_text.downcase.eql? translated_text.downcase
        errors.add(:translated_text, "Translated text cannot be same as original")
      end
    end
end
