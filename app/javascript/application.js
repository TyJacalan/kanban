// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";
import { kanbanSortable } from "./plugins/sortable";

document.addEventListener("turbo:load", () => {
  const columns = document.querySelectorAll(".kanban .kanban-column");
  if (columns.length > 0) {
    kanbanSortable(columns);
  }
});
