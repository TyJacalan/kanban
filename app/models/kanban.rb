# frozen_string_literal: true

class Kanban < ApplicationRecord
  has_many :kanban_columns, dependent: :destroy
end
