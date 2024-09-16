class TarefasController < ApplicationController
  before_action :set_tarefa, only: %i[show edit update destroy]
 
  def new
    @categorias = Categoria.all # Pegue todas as categorias do banco
    @tarefa = Tarefa.new
  end
  # GET /tarefas
  def index
    @tarefas_por_data = Tarefa.all.group_by(&:data)
  end

  # GET /tarefas/:id
  def show
  end

  # GET /tarefas/new
  def new
    @tarefa = Tarefa.new
  end

  # GET /tarefas/:id/edit
  def edit
  end

  # POST /tarefas
  def create
    @tarefa = Tarefa.new(tarefa_params)
    @tarefa.status_id = Status.find_by(nome: 'Não concluída')&.id || default_status_id

    if @tarefa.save
      redirect_to home_path, notice: 'Tarefa foi criada com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tarefas/:id
  def update
    if @tarefa.update(tarefa_params)
      redirect_to @tarefa, notice: 'Tarefa foi atualizada com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tarefas/:id
  def destroy
    @tarefa.destroy
    redirect_to tarefas_url, notice: 'Tarefa foi removida com sucesso.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tarefa
    @tarefa = Tarefa.find(params[:id])
  end

  def tarefa_params
    params.require(:tarefa).permit(:data, :descricao, :bloco, :categoria_id)
  end

  def default_status_id
    1 # Defina um ID padrão para o status
  end
end
