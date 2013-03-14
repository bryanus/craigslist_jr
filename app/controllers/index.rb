get '/' do
  @categories = Category.all
  # Look in app/views/index.erb
  erb :index
end

get '/post' do
  @post = Post.new
  @categories = Category.all
  erb :post
end  

post '/post' do
  @categories = Category.all
  @post = Post.create(params)
  erb :index
end  

get '/:post_url' do
  @categories = Category.all
  @post = Post.find_by_post_url(params[:post_url])
  erb :view_post
end

get '/:post_url/edit' do
  @categories = Category.all
  @post = Post.find_by_post_url(params[:post_url])
  
  erb :edit_post
end

put '/edit' do
  @categories = Category.all
  #raise params.inspect
  Post.find_by_post_url(params[:post_url]).update_attributes(params[:post])
  erb :index
end

get '/category/:category' do
  @category_name = params[:category].gsub(/_/, ' ')
   category_id = Category.find_by_name(@category_name).id
   @posts = Post.where('category_id = ?', category_id)
   erb :view_category
end

# get '/*' do
#   @categories = Category.all
#   # Look in app/views/index.erb
#   erb :view_post
# end
