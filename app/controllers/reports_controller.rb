class ReportsController < ApplicationController
  def emitir
    concluida_status = Status.find_by(nome: 'Concluído')

    # Calcula o total de metas e metas cumpridas
    @total_metas = Meta.count
    @metas_cumpridas = concluida_status ? Meta.where(status_id: concluida_status.id).count : 0
    @porcentagem_metas_cumpridas = @total_metas.positive? ? (@metas_cumpridas.to_f / @total_metas * 100).round(2) : 0

    # Calcula o total de tarefas e tarefas executadas
    @total_tarefas = Tarefa.count
    @tarefas_executadas = concluida_status ? Tarefa.where(status_id: concluida_status.id).count : 0
    @porcentagem_tarefas_executadas = @total_tarefas.positive? ? (@tarefas_executadas.to_f / @total_tarefas * 100).round(2) : 0

    if concluida_status
      # Tarefas concluídas agrupadas por semana e por mês
      tarefas_concluidas = Tarefa.where(status_id: concluida_status.id)
      @tarefas_por_semana = tarefas_concluidas.group_by { |t| t.data.beginning_of_week }.transform_values(&:count)
      @tarefas_por_mes = tarefas_concluidas.group_by { |t| t.data.beginning_of_month }.transform_values(&:count)

      # Agrupando tarefas por turno
      @tarefas_por_turno = tarefas_concluidas.group(:turno).count

      # Agrupando tarefas e metas por categoria
      @tarefas_por_categoria = tarefas_concluidas.group(:categoria_id).count
      @metas_por_categoria = Meta.where(status_id: concluida_status.id).group(:categoria_id).count

      # NOVO: Agrupando metas cumpridas por mês
      metas_concluidas = Meta.where(status_id: concluida_status.id)
      @metas_por_mes = metas_concluidas.group_by { |m| m.updated_at.beginning_of_month }.transform_values(&:count)
    else
      # Se não houver status "Concluído", inicializa os valores com hashes vazios
      @tarefas_por_semana = {}
      @tarefas_por_mes = {}
      @tarefas_por_turno = {}
      @tarefas_por_categoria = {}
      @metas_por_categoria = {}
      @metas_por_mes = {}
    end
  end
end
