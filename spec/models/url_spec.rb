require 'spec_helper'

describe Url do
  
  let!(:article) { create(:article)}
  let(:url) { create(:url, :article => article) }

  describe "acessible attributes" do
    it "should respond to old_url" do
      expect(url).to respond_to(:old_url)
    end

    it "should belong to an article" do
      expect(url).to belong_to(:article)
    end
  end
end
