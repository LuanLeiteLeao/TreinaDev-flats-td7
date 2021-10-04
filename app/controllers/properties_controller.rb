class PropertiesController<ApplicationController
  def show
    id = params[:id]
    @property = Property.find(id)
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.create(params.require(:property).permit(:title,:description,:rooms,:parking_slot,:bathroom,:pets,:daily_rate))
    if @property.save 
      redirect_to @property
    else
      # render :new ==> renderisa a tela new, e não redireciona
      render :new
      # redirect_to new_property_path
    end 
  end 

end