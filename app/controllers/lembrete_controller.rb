class LembreteController < ApplicationController
  before_action :set_lembrete, only: %i[show edit update destroy]

  # GET /lembretes
  def index
    @lembretes = Lembrete.all
  end

  # GET /lembretes/:id
  def show
  end

  # GET /lembretes/new
  def new
    @lembrete = Lembrete.new
  end

  # GET /lembretes/:id/edit
  def edit
  end

  # POST /lembretes
  def create
    @lembrete = Lembrete.new(lembrete_params)

    if @lembrete.save
      redirect_to @lembrete, notice: 'Lembrete foi criado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lembretes/:id
  def update
    if @lembrete.update(lembrete_params)
      redirect_to @lembrete, notice: 'Lembrete foi atualizado com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /lembretes/:id
  def destroy
    @lembrete.destroy
    redirect_to lembretes_url, notice: 'Lembrete foi removido com sucesso.'
  end

  private

  # Use callbacks para compartilhar configurações ou restrições comuns entre as ações.
  def set_lembrete
    @lembrete = Lembrete.find(params[:id])
  end

  # Apenas permita uma lista de parâmetros confiáveis.
  def lembrete_params
    params.require(:lembrete).permit(:titulo, :descricao, :data, :hora, :prioridade)
  end
end
