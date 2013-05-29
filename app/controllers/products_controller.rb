class ProductsController < ApplicationController
  before_filter :authenticate_user!, :only => [:destroy]

  # GET /products
  # GET /products.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  def galery
    @products = Product.all

    respond_to do |format|
      format.html 
      format.json { }
    end
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
