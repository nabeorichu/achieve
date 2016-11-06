class SubmitRequest < ActiveRecord::Base
  belongs_to :task
  belongs_to :user
  belongs_to :charger, class_name: 'User', foreign_key: 'charge_id'

  def self.task_select(user)
    where(charge_id: user.id).where.not(status: 8).order(updated_at: :desc)
  end

end
