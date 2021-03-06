class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :validate_search_key, only: [:search]
  before_action :validate_city_key, only: [:city]

  def index
    @suggests = Job.published.random5
    @jobs = case params[:order]
    when 'by_lower_bound'
      Job.published.order('wage_lower_bound DESC').paginate(:page => params[:page], :per_page => 5 )
    when 'by_upper_bound'
      Job.published.order('wage_upper_bound DESC').paginate(:page => params[:page], :per_page => 5 )
    else
      Job.published.recent.paginate(:page => params[:page], :per_page => 5 )
    end
  end

  def new
    @job = Job.new
  end

  def show
    @job = Job.find(params[:id])
    if @job.is_hidden
      flash[:warning] = "This Job already archived"
      redirect_to root_path
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to jobs_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path, alert: "Job deleted"
  end

  def search
    @suggests = Job.published.random5
    if @query_string.present?
      search_result = Job.published.ransack(@search_criteria).result(distinct: true)
      @jobs = search_result.paginate(page: params[:page], per_page: 5)
    end
    end

  protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, '') if params[:q].present?
    @search_criteria = search_criteria(@query_string)
  end

  def search_criteria(query_string)
    { :title_or_city_or_category_or_location_or_company_name_cont => query_string }
  end

  def city
    if @cuery_string.present?
      city_result = Job.published.ransack(@city_criteria).result(:distinct => true)
      @jobs = city_result.paginate(:page => params[:page], :per_page => 6 )
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :wage_lower_bound, :wage_upper_bound, :contact_email, :is_hidden,
    :title_request, :description_simple, :category, :city, :location, :company_name, :company_info, :company_url,
    :company_email, :company_logo, :company_picture, :company_wearfare, :company_year, :company_people, :company_hr)
  end

  def validate_city_key
    @cuery_string = params[:c].gsub(/\\|\'|\/|\?/, "") if params[:c].present?
    @city_criteria = {city_cont: @cuery_string}
  end

  def city_criteria(cuery_string)
    { :title_cont => cuery_string}
  end

end
