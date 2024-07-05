# frozen_string_literal: true

class KanbanColumnsController < ApplicationController
  before_action :set_kanban
  before_action :set_kanban_column, only: %i[edit update destroy]

  def new
    @kanban_column = @kanban.kanban_columns.new
  end

  def create
    @kanban_column = @kanban.kanban_columns.new(kanban_column_params)

    respond_to do |format|
      if @kanban_column.save
        format.html { redirect_to kanban_path(@kanban), notice: 'Kanban was successfully created.' }
      else
        flash[:alert] = 'Failed to create Kanban column'
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    if @kanban_column.update(kanban_column_params)
      redirect_to @kanban, notice: 'Kanban column was successfully updated.'
    else
      flash[:alert] = 'Failed to update Kanban column.'
      render :edit
    end
  end

  def destroy
    if @kanban_column.destroy
      redirect_to @kanban, notice: 'Kanban column was successfully deleted.'
    else
      flash[:alert] = 'Failed to delete Kanban column.'
      render :show
    end
  end

  private

  def set_kanban
    @kanban = Kanban.find(params[:kanban_id])
  end

  def set_kanban_column
    @kanban_column = @kanban.kanban_columns.find(params[:id])
  end

  def kanban_column_params
    params.require(:kanban_column).permit(:name)
  end
end
