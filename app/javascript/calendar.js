$(document).ready(function() {
  toastr.success('Página carregada com sucesso!');

  const monthNames = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"];
  let currentDate = new Date();

  function formatNumber(num) {
    return num < 10 ? '0' + num : num;
  }

  // Função para renderizar o calendário com base no mês e ano atuais
  function renderCalendar(date) {
    const month = date.getMonth();
    const year = date.getFullYear();
    const firstDay = new Date(year, month, 1).getDay();
    const daysInMonth = new Date(year, month + 1, 0).getDate();

    $('#monthYear').text(`${monthNames[month]} - ${year}`);
    $('#calendarBody').empty();

    let dateCell = 1;
    for (let i = 0; i < 6; i++) {
      let row = $('<tr></tr>');
      for (let j = 0; j < 7; j++) {
        if (i === 0 && j < firstDay) {
          row.append('<td></td>');
        } else if (dateCell > daysInMonth) {
          break;
        } else {
          const fullDate = `${year}-${formatNumber(month + 1)}-${formatNumber(dateCell)}`;
          row.append(`<td class="dia" data-date="${fullDate}" style="text-align: left;">${formatNumber(dateCell)}</td>`);
          dateCell++;
        }
      }
      $('#calendarBody').append(row);
    }
    carregarTarefasNoCalendario();  // Marca os dias com tarefas após o novo mês ser renderizado
  }

  // Função para carregar as tarefas no calendário a partir do banco de dados
  function carregarTarefasNoCalendario() {
    $.ajax({
      url: '/tarefas_por_data',
      type: 'GET',
      dataType: 'json',
      success: function(response) {
        response.forEach(function(tarefa) {
          marcarDiaComTarefa(tarefa.data);
        });
      },
      error: function(jqXHR, textStatus, errorThrown) {
        console.error(`Erro ao carregar as tarefas: ${textStatus}, ${errorThrown}`);
      }
    });
  }

  // Função para marcar um dia com tarefas
  function marcarDiaComTarefa(data) {
    $(`[data-date="${data}"]`).addClass('tarefa');
  }

  // Navegação entre meses
  $(document).on('click', '#prevMonth', function() {
    currentDate.setMonth(currentDate.getMonth() - 1);
    renderCalendar(currentDate);
  });

  $(document).on('click', '#nextMonth', function() {
    currentDate.setMonth(currentDate.getMonth() + 1);
    renderCalendar(currentDate);
  });

  // Navegação para mês e ano específicos
  $(document).on('click', '#navigateBtn', function() {
    const selectedMonth = parseInt($('#monthSelect').val(), 10);
    const selectedYear = parseInt($('#yearSelect').val(), 10);
    currentDate.setMonth(selectedMonth);
    currentDate.setFullYear(selectedYear);
    renderCalendar(currentDate);
  });

  // Adicionar tarefa ao clicar no botão de submissão
  $(document).on('submit', '#formNovaTarefa', function(event) {
    event.preventDefault();
    
    const formData = $(this).serialize();
    
    $.ajax({
      url: '/tarefas', // Endereço para criar a nova tarefa no back-end
      type: 'POST',
      data: formData,
      success: function(response) {
        toastr.success('Tarefa adicionada com sucesso!');
        // Recarrega as tarefas no calendário para exibir a nova tarefa
        carregarTarefasNoCalendario();
      },
      error: function() {
        toastr.error('Erro ao adicionar a tarefa.');
      }
    });
  });

  // Renderiza o calendário inicialmente com o mês atual
  renderCalendar(currentDate);
});
