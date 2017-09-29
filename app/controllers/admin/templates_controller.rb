class Admin::TemplatesController < AdminController

  before_action :find_template, only: [:show, :edit, :update, :destroy]

  def index
    @templates = Template.all
  end

  def new
    @template = Template.new
    @templatephoto = @template.templatephotos.build
  end

  def show
  end

  def edit
  end

  def create
    @template = Template.new(template_params)

    if @template.save
      if params[:templatephotos] != nil
        params[:templatephotos]['image'].each do |a|
          @templatephoto = @template.templatephotos.create(:image => a)
        end
      end
      redirect_to admin_templates_path
    else
      render :new
    end
  end

  def update
    if @template.update(template_params)
      redirect_to admin_templates_path
    else
      render :edit
    end
  end

  def destroy
    @template.destroy
    redirect_to admin_templates_path, alert: 'Template Deleted'
  end

  private

  def template_params
    params.require(:template).permit(:title, :description, :price, :version, :proportion, templatephoto_attributes: [:image, :id])
  end

  def find_template
    @template = Template.find(params[:id])
  end

end
