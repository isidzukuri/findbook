RSpec.describe Library::AuthorsController, type: :controller do
  render_views

  describe 'index' do
    let!(:authors) { create_list(:author, 2)}

    it 'displays list of authors' do
      get :index,  params: {use_route: :authors}

      expect(response.status).to eq 200
      expect(response).to render_template(:index)
      expect(response.body).to include(authors[0].full_name)
      expect(response.body).to include(authors[1].full_name)
      expect(response.body).to include(authors[0].seo)
      expect(response.body).to include(authors[1].seo)
    end
  end

  describe 'show' do
    let!(:author) { create(:author, :with_book)}

    it 'displays list of authors' do
      get :show,  params: {id: author.seo, use_route: :author}

      expect(response.status).to eq 200
      expect(response).to render_template(:show)
      expect(response.body).to include(author.full_name)
      expect(response.body).to include(author.books[0].title)
      expect(response.body).to include(author.books[0].seo)
    end
  end
end
