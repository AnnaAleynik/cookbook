class Recipe < ApplicationRecord
  extend Enumerize

  AVAILABLE_STATUSES = %w(pending denied moderating approved).freeze

  enumerize :status, in: AVAILABLE_STATUSES, predicates: true, default: :pending
end