class TarefasController < ApplicationController
  before_action :set_tarefa, only: %i[show edit update destroy]

  def new
    @categorias = Categoria.all
    @tarefa = Tarefa.new
  end

  # GET /tarefas
  def index
    @tarefas_por_data = Tarefa.where.not(status_id: 3).group_by(&:data) # Ignora tarefas concluídas

    respond_to do |format|
      format.html
      format.json { render json: @tarefas_por_data }
    end
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
    @tarefa.status_id = Status.find_by(nome: 'Pendente')&.id || default_status_id

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
  
  def marcar_como_concluida
    @tarefa = Tarefa.find_by(id: params[:id])

    if @tarefa.nil?
      render json: { success: false, message: 'Tarefa não encontrada.' }, status: :not_found
      return
    end

    # Use update para aplicar validações
    if @tarefa.update(status_id: 3) # Atualizando o status corretamente
      render json: { success: true, message: 'Tarefa marcada como concluída.' }
    else
      render json: { success: false, message: @tarefa.errors.full_messages.join(", ") }, status: :unprocessable_entity
    end
  end

  private

  def set_tarefa
    @tarefa = Tarefa.find(params[:id])
  end

  def tarefa_params
    params.require(:tarefa).permit(:data, :descricao, :bloco, :categoria_id, :status_id)
  end

  def default_concluded_status_id
    3 # Substitua pelo ID correto do status 'Concluída'
  end

  def default_status_id
    1 # Defina um ID padrão para o status
  end
end
