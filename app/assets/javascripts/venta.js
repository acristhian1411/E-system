function radio(venta_forma_pago_credito) {
var x = document.getElementById("venta_forma_pago_credito").value;
if (x = "Credito") {
  <%= render partial: 'credito/credito' %>
}
}
