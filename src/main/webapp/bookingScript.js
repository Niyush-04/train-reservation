document.addEventListener('DOMContentLoaded', function() {
    const baseFare = parseFloat(document.getElementById('baseFare').textContent);
    const totalFareElement = document.getElementById('totalFare');
    const passengerNameFields = [
        document.getElementById('passenger1Name'),
        document.getElementById('passenger2Name'),
        document.getElementById('passenger3Name')
    ];

    calculateTotalFare();

    passengerNameFields.forEach(field => {
        field.addEventListener('input', calculateTotalFare);
    });

    function calculateTotalFare() {
        let passengerCount = 0;
        
        passengerNameFields.forEach(field => {
            if (field.value.trim() !== '') {
                passengerCount++;
            }
        });

        passengerCount = Math.max(1, passengerCount);
        
        const totalFare = baseFare * passengerCount;
        
        totalFareElement.textContent = totalFare.toFixed(2);
        totalFareElement.parentElement.classList.add('fare-update');
        
        let totalFareInput = document.getElementById('totalFareInput');
        if (!totalFareInput) {
            totalFareInput = document.createElement('input');
            totalFareInput.type = 'hidden';
            totalFareInput.name = 'totalFare';
            totalFareInput.id = 'totalFareInput';
            document.querySelector('form').appendChild(totalFareInput);
        }
        totalFareInput.value = totalFare.toFixed(2);
        
        setTimeout(() => {
            totalFareElement.parentElement.classList.remove('fare-update');
        }, 1000);
    }
});