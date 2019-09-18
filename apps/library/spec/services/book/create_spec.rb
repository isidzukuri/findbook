# frozen_string_literal: true

RSpec.describe Library::Book::Create do
  let(:params) { attributes_for(:book) }
  let(:authors) { [create(:author)] }

  describe '.call' do
    it 'creates new db entry' do
      expect { described_class.call(book: params) }.to change { Library::Book.count }.by(1)
    end

    it 'return errors if not valid' do
      result = described_class.call(book: { title: '' })

      expect(result.success?).to be_falsey
      expect(result.errors).to eq(title: ["can't be blank"], seo: ["can't be blank"])
    end

    it 'creates relation with author' do
      result = described_class.call(book: { title: params[:title], authors: authors })

      expect(result.success?).to be_truthy
      expect(result.context[:book].authors).to eq(authors)
    end

    it 'creates relation with author by ids parameter' do
      result = described_class.call(book: { title: params[:title] }, authors_ids: authors.map(&:id))

      expect(result.success?).to be_truthy
      expect(result.context[:book].authors).to eq(authors)
    end
  end
end
