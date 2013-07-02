class ArticleTags < ActiveRecord::Migration
  def change
    create_table :article_tags do |t|
      t.references :article
      t.references :tags
      t.timestamps
    end
  end
end
