class ArticlesController < ApplicationController
  before_filter :find_story 
  def index
    @articles = @story.articles

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.xml
  def show
    @article = @story.articles.find(params[:id])
  end

  # GET /articles/new
  # GET /articles/new.xml
  def new
    @article = @story.articles.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = @story.articles.find(params[:id])
  end

  # POST /articles
  # POST /articles.xml
  def create
    @article = @story.articles.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to(story_article_path(@story, @article), :notice => 'Article was successfully created.') }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.xml
  def update
    @article = @story.articles.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to(story_article_path(@story, @article), :notice => 'Article was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.xml
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(articles_url) }
      format.xml  { head :ok }
    end
  end

  private
  
  def find_story 
    @story = Story.find(params[:story_id]) 
  end
end
