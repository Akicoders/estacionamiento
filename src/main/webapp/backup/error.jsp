<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Result</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" >
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&display=swap');

        body {
            font-family: 'Orbitron', sans-serif;
            background-color: #0a0a0a;
            color: #00ff00;
            margin: 0;
            padding: 0;
            line-height: 1.6;
            background-image:
                    linear-gradient(45deg, rgba(255, 0, 255, 0.1) 25%, transparent 25%),
                    linear-gradient(-45deg, rgba(255, 0, 255, 0.1) 25%, transparent 25%),
                    linear-gradient(45deg, transparent 75%, rgba(255, 0, 255, 0.1) 75%),
                    linear-gradient(-45deg, transparent 75%, rgba(255, 0, 255, 0.1) 75%);
            background-size: 20px 20px;
            background-position: 0 0, 0 10px, 10px -10px, -10px 0px;
        }

        .container {
            max-width: 1200px;
            margin: 40px auto;
            background-color: rgba(9, 9, 11, 0.9);
            border: 2px solid #00ff00;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 0 30px #00ff00, 0 0 50px #ff00ff;
            display: flex;
            flex-direction: column;
            align-items: center;
            backdrop-filter: blur(5px);
        }

        h1, h2 {
            text-align: center;
            color: #ff00ff;
            text-transform: uppercase;
            letter-spacing: 3px;
            margin-bottom: 30px;
            text-shadow: 0 0 10px #ff00ff, 0 0 20px #ff00ff;
        }

        h1 {
            font-size: 2.5em;
        }

        h2 {
            font-size: 2em;
            margin-top: 50px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #00ffff;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        input, select {
            width: 90%;
            padding: 12px;
            border: 1px solid #00ff00;
            background-color: rgba(0, 255, 0, 0.1);
            color: #00ff00;
            border-radius: 5px;
            font-family: 'Orbitron', sans-serif;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        select {
            width: 95%;
        }

        input:focus, select:focus {
            outline: none;
            box-shadow: 0 0 15px #00ffff;
            background-color: rgba(0, 255, 255, 0.1);
        }

        button {
            width: 100%;
            padding: 15px;
            background-color: #ff00ff;
            color: #0a0a0a;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 2px;
            transition: all 0.3s ease;
            box-shadow: 0 0 15px #ff00ff;
        }

        button:hover {
            background-color: #00ffff;
            box-shadow: 0 0 25px #00ffff;
            transform: translateY(-3px);
        }

        .toggle-switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        input:checked + .slider {
            background-color: #00ffff;
        }

        input:checked + .slider:before {
            transform: translateX(26px);
        }

        .slider:after {
            content: 'NO';
            color: #fff;
            display: block;
            position: absolute;
            transform: translate(-50%,-50%);
            top: 50%;
            left: 70%;
            font-size: 10px;
            font-family: Verdana, sans-serif;
        }

        input:checked + .slider:after {
            content: 'SÍ';
            left: 30%;
        }

        .pilot-table th, .pilot-table td {
            padding: 15px;
            text-align: left;
            background-color: rgba(0, 255, 255, 0.1);
            border: 1px solid #00ffff;
        }

        .pilot-table th {
            background-color: rgba(255, 0, 255, 0.2);
            color: #ff00ff;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .pilot-table tr:not(:first-child) {
            transition: all 0.3s ease;
        }

        .pilot-table tr:not(:first-child):hover {
            background-color: rgba(0, 255, 255, 0.2);
            transform: scale(1.02);
            box-shadow: 0 0 15px rgba(0, 255, 255, 0.5);
        }


        @media (max-width: 768px) {
            .container {
                margin: 20px;
            }
            h1 {
                font-size: 2em;
            }
            .pilot-table th, .pilot-table td {
                padding: 10px;
            }
        }

        @keyframes glitch-anim {
            0% { clip: rect(31px, 9999px, 94px, 0); }
            20% { clip: rect(62px, 9999px, 42px, 0); }
            40% { clip: rect(16px, 9999px, 78px, 0); }
            60% { clip: rect(89px, 9999px, 13px, 0); }
            80% { clip: rect(24px, 9999px, 57px, 0); }
            100% { clip: rect(73px, 9999px, 35px, 0); }
        }

        a {
            text-decoration: none;
            color: #ffffff;
            margin-top: 20em;
        }

        .alert {
            background-color: #3d0006;
            color: #eb8791;
            border: 1px solid #660711;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="card-content">
        <div class="alert" role="alert">
            Ocurri&oacute; un error ineperado. Contactar con el administrador
        </div>
        <a href="formulario.jsp"> <button id="confirmBtn" class="confirm-btn">Regresar al formulario</button></a>
    </div>
</div>

</body>
</html>
