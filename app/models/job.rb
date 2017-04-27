# == Schema Information
#
# Table name: jobs
#
#  id                    :integer          not null, primary key
#  title                 :string
#  description           :text
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  wage_lower_bound      :integer
#  wage_upper_bound      :integer
#  contact_email         :string
#  is_hidden             :boolean          default(TRUE)
#  category_name         :string           default("工程师")
#  location              :string
#  company_name          :string
#  company_url           :string
#  company_contact_email :string
#  category              :string
#

class Job < ApplicationRecord
  validates :title, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

  scope :published, -> { where(is_hidden: false) }
  scope :recent, -> { order('created_at DESC') }

  has_many :resumes
end
