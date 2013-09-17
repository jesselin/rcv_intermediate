class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save 
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render action: 'new'
    end
  end

  def show
    set_product
  end

  def edit
    set_product
  end

  def update
    set_product

    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render action: 'edit'
    end

  end

  def destroy
    if set_product.destroy
      redirect_to products_path, notice: 'Product deleted.'
    else
      render action: 'index'
    end
  end

  private
    
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit([:name, :description, :pricing, :category_id])
    end

end
