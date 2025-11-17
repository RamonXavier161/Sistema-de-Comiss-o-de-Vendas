/**
 * Exibe uma notificação na página usando Toastr (AdminLTE3).
 *
 * @param {string} message – Texto da notificação.
 * @param {"success"|"info"|"warning"|"error"} [type="info"] – Tipo da notificação.
 * @param {string} [title] – (Opcional) Título da notificação.
 * @param {object} [options] – (Opcional) Override das opções do Toastr.
 */
function showPageNotification(message, type = "info", title = "", options = {}) {
    // Ajusta "error" para o método correto do Toastr
    const method = (type === "error") ? "error" : type;
  
    // Default globals (você só precisa chamar uma vez, mas podemos reforçar aqui)
    toastr.options = Object.assign({
      "closeButton": true,
      "debug": false,
      "newestOnTop": true,
      "progressBar": true,
      "positionClass": "toast-top-right",
      "preventDuplicates": false,
      "onclick": null,
      "showDuration": "300",
      "hideDuration": "1000",
      "timeOut": "5000",
      "extendedTimeOut": "1000",
      "showEasing": "swing",
      "hideEasing": "linear",
      "showMethod": "fadeIn",
      "hideMethod": "fadeOut"
    }, options);
  
    // Dispara a notificação
    if (typeof toastr[method] === "function") {
      toastr[method](message, title);
    } else {
      console.warn(`Tipo de notificação inválido: ${type}`);
      toastr.info(message, title);
    }
}

/**
 * Exibe um popup informativo usando SweetAlert2, apenas com botão “OK”.
 *
 * @param {Object} options
 * @param {"info"|"success"|"warning"|"error"} [options.icon="info"] – Ícone do popup.
 * @param {string} options.title – Título do popup.
 * @param {string} options.text – Texto de corpo.
 * @param {string} options.html – Texto de corpo.
 * @param {string} [options.okText="OK"] – Texto do botão de confirmação.
 * @param {Function} [options.onClose] – Callback executado após fechar o popup.
 */
function showPopup(options) {
  const {
    icon = "info",
    title,
    text,
    html,
    okText = "OK",
    onClose
  } = options;

  Swal.fire({
    icon,
    title,
    text,
    html,
    confirmButtonText: okText,
    showCancelButton: false
  }).then(() => {
    if (typeof onClose === "function") {
      onClose();
    }
  });
}

/**
 * Exibe um popup de confirmação genérico usando SweetAlert2.
 *
 * @param {Object} options
 * @param {"question"|"warning"|"info"|"error"|"success"} [options.icon="question"] – Ícone do SweetAlert.
 * @param {string} options.title – Título do popup.
 * @param {string} options.text – Texto de corpo.
 * @param {string} options.html – Texto de corpo.
 * @param {string} [options.confirmText="Sim"] – Texto do botão de confirmação.
 * @param {string} [options.cancelText="Cancelar"] – Texto do botão de cancelamento.
 * @param {string} [options.confirmColor] – (Opcional) Cor do botão de confirmação (hex).
 * @param {string} [options.cancelColor] – (Opcional) Cor do botão de cancelamento (hex).
 * @param {Function} options.onConfirm – Callback executado se o usuário confirmar.
 */
function showConfirmation(options) {
    const {
      icon = "question",
      title,
      text,
      html,
      width,
      confirmText,
      cancelText,
      confirmColor,
      cancelColor,
      onConfirm,
      onCancel,
      reverseButtons = false
    } = options;
  
    // Monta o objeto base
    const swalOptions = {
      icon,
      title,
      text,
      html,
      width,
      showCancelButton: true,
      confirmButtonText: confirmText,
      cancelButtonText: cancelText,
      reverseButtons: reverseButtons
    };
  
    if (confirmColor) swalOptions.confirmButtonColor = confirmColor;
    if (cancelColor)  swalOptions.cancelButtonColor  = cancelColor;
  
Swal.fire(swalOptions).then(result => {
  if (result.isConfirmed && typeof onConfirm === "function") {
    onConfirm();
  } else if (result.dismiss === Swal.DismissReason.cancel && typeof onCancel === "function") {
    onCancel();
  }
});
}

function showAlert(message) {
  alert(message);
}