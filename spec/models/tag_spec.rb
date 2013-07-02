require 'spec_helper'

describe Tag do

  let!(:tag) {create(:tag)}
  let(:article) { create(:article) }


  describe "accessible attribute" do
    it "responds to tag_name" do
      expect(tag).to respond_to(:tag_name)
    end

    it "has many articles through article_tags" do
      expect(tag).to have_many(:articles).through(:article_tags)
    end
  end
end
