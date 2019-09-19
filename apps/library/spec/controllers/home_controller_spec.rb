# frozen_string_literal: true

RSpec.describe Library::HomeController, type: :controller do
  render_views

  it '' do
    get :index, params: { use_route: :root }

    expect(response.status).to eq 200
    expect(response).to render_template(:index)

    expect(response.body).to include('Home')
  end
end
