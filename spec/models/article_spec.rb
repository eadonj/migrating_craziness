require 'spec_helper'

describe Article do
  
  let(:article) { create(:article) }

  describe "accessible attributes" do
    it "should respond to title" do
      expect(article).to respond_to(:title)
    end

    it "should respond to description" do
      expect(article).to respond_to(:description)
    end

    it "belongs to a category" do
      article.should belong_to(:category)
    end

    it "should have many tags" do
      expect(article).to respond_to(:tags)
    end

    it "should have_one url" do
      expect(article).to respond_to(:url)
    end
  end
end
