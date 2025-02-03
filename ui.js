function redeem() {
    const amount = document.getElementById('amount').value;
    if (amount <= 0) {
        alert('Please enter a valid amount.');
        return;
    }

    // Send the redemption request to the server
    fetch(`https://redeem-currency/redeem`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({ amount: amount }),
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('Redemption successful! Please contact transaction staff on Discord.');
        } else {
            alert('Redemption failed: ' + data.message);
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('An error occurred. Please try again.');
    });
}