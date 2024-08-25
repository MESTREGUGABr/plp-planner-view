import Toastify from "toastify-js";
import "toastify-js/src/toastify.css";

// Função para mostrar toast
export function showToast(type, message) {
    Toastify({
        text: message,
        backgroundColor: type === 'success' ? 'green' : 'red',
        className: type,
        duration: 3000
    }).showToast();
}
