require 'rails_helper'

RSpec.describe "Translates", type: :request do
  describe "GET /input" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /output" do
    it "returns http success" do
      get "/translate/output"
      expect(response).to have_http_status(:success)
    end

    it "returns correct result" do
      get "/translate/output.x?ch=6&get_database[checked]=0&commit=Translate"
      expect(controller.instance_variable_get(:@result_table)).to eq([6,'110','011',3])
    end
    it "returns correct result" do
      get "/translate/output.x?ch=8&get_database[checked]=0&commit=Translate"
      expect(controller.instance_variable_get(:@result_table)).to eq([8,'1000','0001',1])
    end
  end

end
