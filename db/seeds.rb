# frozen_string_literal: true

# Clear resources
Card.destroy_all
KanbanColumn.destroy_all
Kanban.destroy_all

# Create Kanban Board
my_project = Kanban.create!(
  name: 'My Projects',
  description: 'This is a test description of a project'
)

p 'Seeded Kanban'

# Create Columns
columns = []

%w[Pending Active Inactive].each do |name|
  columns << { name:, kanban_id: my_project.id }
end

KanbanColumn.insert_all(columns)

p 'Seeded columns'

# Fetch the created columns
created_columns = KanbanColumn.where(kanban_id: my_project.id)

# Create Cards
cards = []

5.times do |i|
  cards << { content: "Project#{i}", position: 0, kanban_column_id: created_columns.sample.id }
end

Card.insert_all(cards)

p 'Seeded cards'
