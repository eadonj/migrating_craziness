class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string      :old_url
      t.references  :article
      t.timestamps
    end
  end
end
