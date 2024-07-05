# frozen_string_literal: true

class CardsController < ApplicationController
  before_action :set_kanban
  before_action :set_kanban_column
  before_action :set_card, only: %i[show edit update destroy]

  def new
    @card = @kanban_column.cards.new
  end

  def show; end

  def create
    @card = @kanban_column.cards.new(card_params)

    if @card.save
      redirect_to @kanban, notice: 'Card was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @card.update(card_params)
      redirect_to @kanban, notice: 'Card was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @card.destroy
    redirect_to @kanban, notice: 'Card was successfully destroyed.'
  end

  private

  def set_kanban
    @kanban = Kanban.find(params[:kanban_id])
  end

  def set_kanban_column
    @kanban_column = @kanban.kanban_columns.find(params[:kanban_column_id])
  end

  def set_card
    @card = @kanban_column.cards.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:content, :position)
  end
end
