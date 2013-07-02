require 'spec_helper'

describe Category do
  
  let!(:category) { create(:category) }
  let(:article) { create(:article, :category => category)}

  describe "accessible attributes" do
    it "responds to category name" do
      expect(category).to respond_to(:category_name)
    end

    it "responds to articles" do
      expect(category).to respond_to(:articles)
    end

    it "should return an array when calling #articles" do
      category.articles.should == [article]
    end

    it "has many articles" do
      expect(category).to have_many(:articles)
    end

  end

end

