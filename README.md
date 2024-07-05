# Kanban Board

This project implements a Kanban board management system using Ruby on Rails. Kanban boards are widely used in project management to visualize tasks across different stages. In this application:

- **Kanbans**: Represent high-level project boards.
- **Kanban Columns**: Categorize tasks within each Kanban (e.g., To Do, In Progress, Done).
- **Cards**: Tasks or items that move between columns within a Kanban.

# Features

- Create and manage multiple Kanban boards
- Customize columns and tasks within each board
- Drag-and-drop functionality using SortableJS for seamless task management
- CRUD operations for Kanbans, Kanban Columns, and Cards
- Integration of AJAX requests for real-time updates

# Dependencies

- Sortable.js
- Request.js

# Usage

1. Install

```
bundle && yarn install
```

2. Create the database

```
bin/rails db:create && bin/rails db:migrate
```

1. (Optional) Seed the data

```
bin/rails db:seed
```
