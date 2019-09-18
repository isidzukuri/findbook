# frozen_string_literal: true

FactoryBot.define do
  factory :author, class: Library::Author do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    full_name { FFaker::Name.name }
    seo { FFaker::Name.last_name }

    trait :with_book do
      books { [create(:book, seo: FFaker::Internet.slug)] }
    end
  end
end
