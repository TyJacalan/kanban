# frozen_string_literal: true

class KanbanColumn < ApplicationRecord
  belongs_to :kanban
  has_many :cards, dependent: :destroy
end
