class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to new_admin_category_gif_path(@category.id)
    else
      flash[:error] = "Please try again."
      render new_admin_category_path
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:delete] = "Category successfully deleted."
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
