# frozen_string_literal: true

class Card < ApplicationRecord
  belongs_to :kanban_column
end
