class ReportsController < ApplicationController
    def emitir
      # Parâmetro para escolher o tipo de relatório
      report_type = params[:report_type] || 'weekly'
  
      case report_type
      when 'weekly'
        start_date = Date.today.beginning_of_week
        end_date = Date.today.end_of_week
      when 'monthly'
        start_date = Date.today.beginning_of_month
        end_date = Date.today.end_of_month
      when 'annual'
        start_date = Date.today.beginning_of_year
        end_date = Date.today.end_of_year
      else
        start_date = Date.today.beginning_of_week
        end_date = Date.today.end_of_week
      end
  
      @report = generate_report(start_date, end_date, report_type)
      render_report("Relatório #{report_type.capitalize}", @report)
    end
  
    private
  
    def generate_report(start_date, end_date, report_type)
      total_tasks = Tarefa.where(data: start_date..end_date).count
      completed_tasks = Tarefa.where(data: start_date..end_date, status: 'completed').count
      total_goals = Meta.where(data_fim: start_date..end_date).count
      completed_goals = Meta.where(data_fim: start_date..end_date, status: 'achieved').count
    
      productivity = calculate_productivity(start_date, end_date)
    
      {
        total_tasks: total_tasks,
        completed_tasks: completed_tasks,
        task_completion_rate: (completed_tasks.to_f / total_tasks * 100).round(2),
        total_goals: total_goals,
        completed_goals: completed_goals,
        goal_completion_rate: (completed_goals.to_f / total_goals * 100).round(2),
        most_productive_period: productivity[:most_productive_period],
        most_productive_shift: productivity[:most_productive_shift],
        most_common_task_category: productivity[:most_common_task_category],
        most_common_goal_category: productivity[:most_common_goal_category]
      }
    end
    
    def calculate_productivity(start_date, end_date)
      # Agrupa tarefas por categoria_id
      task_groups = Tarefa.where(data: start_date..end_date).group('categoria_id').count
      
      # Agrupa metas por categoria_id
      goal_groups = Meta.where(data_fim: start_date..end_date).group('categoria_id').count
    
      # Calcula a semana mais produtiva
      weeks = Tarefa.where(data: start_date..end_date)
                    .group("DATE_TRUNC('week', data)")
                    .count
      most_productive_week = weeks.max_by { |week, count| count }&.first
    
      # Calcula o mês mais produtivo
      months = Tarefa.where(data: start_date..end_date)
                     .group("DATE_TRUNC('month', data)")
                     .count
      most_productive_month = months.max_by { |month, count| count }&.first
    
      # Calcula o turno mais produtivo
      shifts = Tarefa.where(data: start_date..end_date)
                     .group("DATE_TRUNC('day', data) || '-' || EXTRACT(HOUR FROM data)")
                     .count
      most_productive_shift = shifts.max_by { |shift, count| count }&.first
    
      # Encontra o nome da categoria mais comum para tarefas
      most_common_task_category = Categoria.find(task_groups.max_by { |category_id, count| count }&.first)&.nome
    
      # Encontra o nome da categoria mais comum para metas
      most_common_goal_category = Categoria.find(goal_groups.max_by { |category_id, count| count }&.first)&.nome
    
      {
        most_productive_period: {
          week: most_productive_week || "Nenhum dado",
          month: most_productive_month || "Nenhum dado"
        },
        most_productive_shift: most_productive_shift || "Nenhum dado",
        most_common_task_category: most_common_task_category || "Nenhum dado",
        most_common_goal_category: most_common_goal_category || "Nenhum dado"
      }
    end    
end
