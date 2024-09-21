class MetasController < ApplicationController
  before_action :set_meta, only: %i[show edit update destroy]

  # GET /metas
  def index
    @metas_por_data = Meta.all.group_by(&:data_inicio)
    
    respond_to do |format|
      format.html
      format.json { render json: @metas_por_data }
    end
  end

  # GET /metas/:id
  def show
  end

  # GET /metas/new
  def new
    @categorias = Categoria.all # Pegue todas as categorias do banco
    @meta = Meta.new
  end

  # GET /metas/:id/edit
  def edit
  end

  # POST /metas
  def create
    @meta = Meta.new(meta_params)

    if @meta.save
      redirect_to home_path, notice: 'Meta foi criada com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /metas/:id
  def update
    if @meta.update(meta_params)
      redirect_to @meta, notice: 'Meta foi atualizada com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /metas/:id
  def destroy
    @meta.destroy
    redirect_to metas_url, notice: 'Meta foi removida com sucesso.'
  end

  private

  # Use callbacks para compartilhar configurações ou restrições comuns entre as ações.
  def set_meta
    @meta = Meta.find(params[:id])
  end

  # Apenas permita uma lista de parâmetros confiáveis.
  def meta_params
    params.require(:meta).permit(:descricao, :data_inicio, :data_fim, :status_id, :categoria_id)
  end
end
