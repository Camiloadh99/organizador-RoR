# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  due_date    :date
#  category_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Task < ApplicationRecord
  belongs_to :category
  belongs_to :owner, class_name: "User"

  validates :name, :description, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validate :due_date_validity

  def due_date_validity
    return if due_date.nil?
    return if due_date.blank?

    errors.add :due_date, I18n.t("task.error.invalit_due_date") if due_date < Date.today
  end
end
