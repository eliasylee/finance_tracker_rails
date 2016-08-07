class Transaction < ActiveRecord::Base
  validates :report_id, :item, :cost, :location, :transaction_date, presence: true

  belongs_to :report
  belongs_to :user
end
