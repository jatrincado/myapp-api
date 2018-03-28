class WelcomeController < ApplicationController
  def index
    @articles = Article.all.order('created_at DESC').limit(10)
  end
end
