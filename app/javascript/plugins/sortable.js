import Sortable from "sortablejs";
import { patch } from "@rails/request.js";

const kanbanSortable = (columns) => {
  const saveKanbanBinded = saveKanban.bind(null, columns);
  columns.forEach((column) => {
    new Sortable(column, {
      group: "kanban",
      animation: 300,
      onEnd: saveKanbanBinded,
    });
  });
};

const saveKanban = (columns) => {
  const kanbanIds = { columns: [] };

  columns.forEach((column) => {
    const itemIds = [];
    const items = column.querySelectorAll(".kanban-column-item");

    items.forEach((item) => itemIds.push(Number.parseInt(item.dataset.id)));

    kanbanIds.columns.push({
      id: Number.parseInt(column.dataset.id),
      itemIds: itemIds,
    });
  });

  console.log(kanbanIds);

  const kanbanId = document.querySelector(".kanban");
  const formData = new FormData();
  formData.append("kanban[kanbanIds]", JSON.stringify(kanbanIds));

  async function updateKanban() {
    try {
      await patch(`/kanbans/${kanbanId}/sort`, {
        body: formData,
      });
    } catch (error) {
      console.error("Error:", error);
    }
  }

  updateKanban();
};

export { kanbanSortable };
