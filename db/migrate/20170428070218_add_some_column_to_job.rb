class AddSomeColumnToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :title_request, :string
    add_column :jobs, :description_simple, :string
    add_column :jobs, :category, :string
    add_column :jobs, :city, :string
    add_column :jobs, :location, :string
    add_column :jobs, :company_name, :string
    add_column :jobs, :company_info, :string
    add_column :jobs, :company_url, :string
    add_column :jobs, :company_email, :string
    add_column :jobs, :company_logo, :string
    add_column :jobs, :company_picture, :string
    add_column :jobs, :company_wearfare, :string
    add_column :jobs, :company_year, :string
    add_column :jobs, :company_people, :string
    add_column :jobs, :company_hr, :string
  end
end
