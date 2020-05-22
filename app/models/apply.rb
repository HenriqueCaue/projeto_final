class Apply < ApplicationRecord
  belongs_to :job_opportunity
  belongs_to :candidate
end
