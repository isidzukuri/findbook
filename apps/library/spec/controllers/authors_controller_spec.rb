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
end
