document.addEventListener("DOMContentLoaded", function() {
    let tarefas = [];

    function criarTarefa() {
        const data = document.querySelector('#data').value;
        const descricao = document.querySelector('#descricao').value;
        const bloco = document.querySelector('#bloco').value;
        const atividade = document.querySelector('#atividade').value;
        const categoria = document.querySelector('#categoria').value;

        const tarefa = { data, descricao, bloco, atividade, categoria };
        tarefas.push(tarefa);
        // Aqui, você pode também adicionar a tarefa ao backend se necessário
        // E depois carregar novamente as tarefas no calendário
    }

    function marcarDiaComTarefa(data) {
        const calendario = document.querySelectorAll('.dia');
        calendario.forEach(dia => {
            const diaData = dia.getAttribute('data-date');
            if (diaData === data) {
                dia.classList.add('tem-tarefa');  // Adiciona uma classe indicando que há uma tarefa
            }
        });
    }

    function carregarTarefasNoCalendario() {
        tarefas.forEach(tarefa => {
            marcarDiaComTarefa(tarefa.data);
        });
    }

    carregarTarefasNoCalendario();
    document.querySelector('#criarTarefaBtn').addEventListener('click', criarTarefa);
});
