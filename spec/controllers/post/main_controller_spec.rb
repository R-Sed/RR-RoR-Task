require 'rails_helper'
require 'json'

RSpec.describe PostsController, type: :controller do
  describe "GET #main" do
    before do
      get :main
    end

    it "response with right code" do
      expect(response.status).to eq(200)
    end

    it "return main page" do
      expect(response).to render_template('main')
    end

  end
end
