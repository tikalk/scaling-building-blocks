class ProductsController < ApplicationController
  before_filter :authenticate_user!, :only => [:destroy]

  # Here our caching starts. It's similar to page caching, means very fast.
  # But in addition to just caching a page, we can run a before filter!
  caches_action :galery, :cache_path => :galery_cache_path.to_proc

  # Here we build our unique sequences, each sequence is pointing to a cached
  # version of a page. Extremely important for users, orders and other private
  # or sensitive data.
  def galery_cache_path
    current_user_id = current_user.nil?? 0 : current_user.id
    "home_index/#{params[:page]}/#{current_user_id}"
  end


  def index_cache_path
    current_user_id = current_user.nil?? 0 : current_user.id
    "home_index/#{params[:page]}/#{current_user_id}"
  end


  # GET /products
  # GET /products.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  def galery
    @products = Product.where("id > ?", 0).reverse_order().page(params[:page]).per(30)

    respond_to do |format|
      format.html 
      format.json { }
    end
  end

  def search
    q = params[:product][:name]
    #@products = Product.where("name LIKE ?", "%#{q}%").reverse_order().page(params[:page]).per(30)
    @products = Product.search { fulltext q; paginate :page => params[:page], :per_page => 30 }.results
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    if @product.save
      if params[:product][:image].present? 
        render :crop
      else
        redirect_to @product, notice: "Successfully created the product."
      end
    else
      render :new
    end

    # respond_to do |format|
    #   if @product.save
    #     format.html { redirect_to @product, notice: 'Product was successfully created.' }
    #     format.json { render json: @product, status: :created, location: @product }
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @product.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(params[:product])
      if params[:product][:image].present?
        render :crop
      else
        redirect_to @product, notice: "Successfully updated the product."
      end
    else
      render :update
    end

      # respond_to do |format|
      # if @product.update_attributes(params[:product])
      #   format.html { redirect_to @product, notice: 'Product was successfully updated.' }
      #   format.json { head :no_content }
      # else
      #   format.html { render action: "edit" }
      #   format.json { render json: @product.errors, status: :unprocessable_entity }
      # end
      # end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    # ability = Ability.new(current_user)
    # if (!@orders.empty? && !ability.can?(:manage, @order)) ....

    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to galery_products_url }
      format.json { head :no_content }
    end
  end
end
