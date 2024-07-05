# frozen_string_literal: true

class KanbansController < ApplicationController
  before_action :set_kanban, only: %i[show edit update destroy]

  def index
    @kanbans = Kanban.all
  end

  def show
    @columns = @kanban.kanban_columns
  end

  def new
    @kanban = Kanban.new
  end

  def edit; end

  def create
    @kanban = Kanban.new(kanban_params)

    respond_to do |format|
      if @kanban.save
        format.html { redirect_to kanban_url(@kanban), notice: 'Kanban was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @kanban.update(kanban_params)
        format.html { redirect_to kanban_url(@kanban), notice: 'Kanban was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @kanban.destroy!

    respond_to do |format|
      format.html { redirect_to kanbans_url, notice: 'Kanban was successfully destroyed.' }
    end
  end

  def sort
    sorted_cols = JSON.parse(kanban_params['kanbanIds'])['columns']
    sorted_cols.each do |col|
      col['itemIds'].each do |card_id|
        Card.find(card_id).update(
          kanban_column: KanbanColumn.find(col['id']),
          position: col['itemIds'].find_index(card_id)
        )
      end
    end
  end

  private

  def set_kanban
    @kanban = Kanban.find(params[:id])
  end

  def kanban_params
    params.require(:kanban).permit(:name, :description, :kanbanIds)
  end
end
