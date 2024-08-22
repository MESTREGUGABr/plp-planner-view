class CategoriaController < ApplicationController
  before_action :set_categoria, only: %i[show edit update destroy]

  # GET /categorias
  def index
    @categorias = Categoria.all
  end

  # GET /categorias/:id
  def show
  end

  # GET /categorias/new
  def new
    @categoria = Categoria.new
  end

  # GET /categorias/:id/edit
  def edit
  end

  # POST /categorias
  def create
    @categoria = Categoria.new(categoria_params)

    if @categoria.save
      redirect_to @categoria, notice: 'Categoria foi criada com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categorias/:id
  def update
    if @categoria.update(categoria_params)
      redirect_to @categoria, notice: 'Categoria foi atualizada com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /categorias/:id
  def destroy
    @categoria.destroy
    redirect_to categorias_url, notice: 'Categoria foi removida com sucesso.'
  end

  private

  # Use callbacks para compartilhar configurações ou restrições comuns entre as ações.
  def set_categoria
    @categoria = Categoria.find(params[:id])
  end

  # Apenas permita uma lista de parâmetros confiáveis.
  def categoria_params
    params.require(:categoria).permit(:nome, :descricao)
  end
end
