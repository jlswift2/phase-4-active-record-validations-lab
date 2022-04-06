class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :title_is_clickbait

    def title_is_clickbait
        if [/Won't Believe | Secret | Guess | Top / ].none? { |exp| exp.match(title) }
            errors.add(:title, "Clickbait titles only, please")
        end
    end

end
