# frozen_string_literal: true

RSpec.describe Admin::Seo::GenerateSlug do
  let(:book) { build(:book) }

  describe '.call' do
    it 'validates params' do
      expect { described_class.call }.to raise_error(ArgumentError)
      expect { described_class.call(object: Admin::Book.new) }.to raise_error(ArgumentError)
    end

    it 'creates uniq slug by attribute' do
      result = described_class.call(object: book, attribute: :title)

      expect(result.success?).to be_truthy
    end

    it 'tranliterate to english' do
      cyrylic_book = build(:book, title: 'новий чудовий репозиторій')
      result = described_class.call(object: cyrylic_book, attribute: :title)

      expect(result.success?).to be_truthy
      expect(result.context[:slug]).to eq('novii-chudovii-riepozitorii')
    end

    it 'adds suffix if slug exists' do
      not_uniq_book = build(:book, title: 'test', seo: 'test')
      not_uniq_book.save

      result = described_class.call(object: not_uniq_book, attribute: :title)
      expect(result.context[:slug]).not_to eq('test')

      expect(result.success?).to be_truthy
    end
  end
end
