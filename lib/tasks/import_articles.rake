ActiveRecord::Base.logger = nil

namespace :db do
  desc "import articles from old db"
  task :import_old_articles => :environment do
    ActiveRecord::Base.establish_connection("old_database")
    connection = ActiveRecord::Base.connection
    articles = connection.execute("select * from articles")
    ActiveRecord::Base.establish_connection("development")
    # parse_tags(articles)
    # parse_url(articles)
    # parse_categories(articles)
    parse_articles(articles)
  end
end

def parse_articles(articles)
  articles.each do |art|
    article = Article.create(title: art["title"], description: art["description"])
    art["tags"].split(',').each do |tag|
      taggle = Tag.find_by_tag_name(tag.strip)
      article.tags << taggle
    end
    cat = art["category"].singularize.parameterize
    article.category_id = Category.find_by_category_name(cat).id
    article.save
  end
end

def parse_url(articles)
  articles.each do |art|
    Url.create(:old_url => art["url"], :article_id => art["id"])
  end
end

def parse_tags(articles)
  ActiveRecord::Base.establish_connection("old_database")
  connection = ActiveRecord::Base.connection
  tags = Article.pluck(:tags)
  tags.map! {|tag| tag.split(',')}
  organized_tags = tags.flatten!
  organized_tags.map! {|tag| tag.strip}
  ActiveRecord::Base.establish_connection("development")
  organized_tags.uniq!.each do |tag|
    Tag.create(:tag_name => tag)
  end
end

def parse_categories(articles)
  ActiveRecord::Base.establish_connection("old_database")
  connection = ActiveRecord::Base.connection
  categories = Article.pluck(:category).map {|cat| cat.singularize.parameterize}.uniq!
  ActiveRecord::Base.establish_connection("development")
  categories.each do |cat|
    Category.create(category_name: cat)
  end
end
