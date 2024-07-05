# frozen_string_literal: true

class CreateKanbans < ActiveRecord::Migration[7.1]
  def change
    create_table :kanbans do |t|
      t.string :name
      t.string :description
      t.jsonb :cards

      t.timestamps
    end
  end
end
