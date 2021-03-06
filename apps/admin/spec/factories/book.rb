# frozen_string_literal: true

FactoryBot.define do
  factory :book, class: Admin::Book do
    title { FFaker::Book.title }
    description { FFaker::Book.description }
    paper { FFaker::Internet.http_url }
    txt { FFaker::Internet.http_url }
    rtf { FFaker::Internet.http_url }
    doc { FFaker::Internet.http_url }
    pdf { FFaker::Internet.http_url }
    fb2 { FFaker::Internet.http_url }
    epub { FFaker::Internet.http_url }
    mobi { FFaker::Internet.http_url }
    djvu { FFaker::Internet.http_url }

    trait :completed do
      seo { FFaker::Internet.slug }
      authors { [create(:author)] }
    end
  end
end
