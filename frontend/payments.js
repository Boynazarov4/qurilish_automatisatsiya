fetch("../api/get_payments.php")
    .then(response => response.json())
    .then(data => {
        let container = document.getElementById("payments");
        data.forEach(payment => {
            let item = document.createElement("li");
            item.innerHTML = `<strong>${payment.full_name}</strong> - ${payment.amount}$ (${payment.payment_status})`;
            container.appendChild(item);
        });
    });

document.getElementById("addPaymentForm").addEventListener("submit", function(event) {
    event.preventDefault();
    let formData = new FormData(this);

    fetch("../api/add_payment.php", {
        method: "POST",
        body: formData
    }).then(response => response.text())
      .then(data => alert(data));
});
