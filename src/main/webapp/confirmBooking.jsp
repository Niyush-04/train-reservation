<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Confirmation</title>
</head>
<body style="font-family: 'Arial', sans-serif; background-color: #f5f5f5; margin: 0; padding: 0; display: flex; justify-content: center; align-items: center; min-height: 100vh;">
    <div style="background-color: white; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); padding: 40px; max-width: 500px; width: 90%; text-align: center;">
        <div style="color: #4CAF50; margin-bottom: 30px;">
            <svg style="width: 64px; height: 64px;" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M12 22C17.5228 22 22 17.5228 22 12C22 6.47715 17.5228 2 12 2C6.47715 2 2 6.47715 2 12C2 17.5228 6.47715 22 12 22Z" stroke="#4CAF50" stroke-width="2"/>
                <path d="M8 12L11 15L16 9" stroke="#4CAF50" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
        </div>
        <h1 style="color: #333; font-size: 28px; margin: 0 0 10px 0;">Booking Confirmed</h1>
        <p style="color: #666; font-size: 16px; margin-bottom: 30px;">Thank you for your booking. Your reservation is confirmed.</p>
        
        <h2 style="color: #555; font-size: 16px; font-weight: normal; margin-bottom: 10px;">Please note this PNR for future reference</h2>
        <div class="pnr" style="background-color: #f8f9fa; border: 1px dashed #ddd; border-radius: 4px; padding: 15px; font-size: 24px; font-weight: bold; letter-spacing: 2px; color: #333; margin-bottom: 30px;"><%= request.getAttribute("pnr") %></div>
        
        <a href="dashboard.jsp" style="display: inline-block; background-color: #4CAF50; color: white; text-decoration: none; padding: 12px 24px; border-radius: 4px; font-weight: bold; transition: background-color 0.3s;">Go to Dashboard</a>
        
        <p style="color: #999; font-size: 12px; margin-top: 30px;">If you have any questions, please contact our customer support.</p>
    </div>
</body>
</html>