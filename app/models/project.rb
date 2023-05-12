class Project < ApplicationRecord
  has_many :project_status_changes

  enum status: { inactive: 0, active: 1, archived: 2, wip: 3, done: 4 }

  after_update :log_status_change

  has_many :comments, dependent: :destroy

  validates :user_id, presence: true

  accepts_nested_attributes_for :comments

  private

  def log_status_change
    if status_changed?
      project_status_changes.create(
        from_status: status_was,
        to_status: status
      )
    end
  end
end
