<%@ page import="pe.edu.utp.jsp_cru.model.TipoVehiculo" %><%--
  Created by IntelliJ IDEA.
  User: Juanpi
  Date: 15/10/2024
  Time: 12:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Estacionamiento de Coches Cyberpunk 2077</title>
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

        .nav {
            width: 100%;
            margin-top: 1em;
            display: flex;
            justify-content: center;
        }

        .navegacion {
            background-color: rgba(9, 9, 11);
            padding: 20px;
            align-items: center;
            border-radius: 10px;
            box-shadow: 0 0 20px #00ff00;
            width: 80%;
            display: flex;
            justify-content: space-around;
            margin-bottom: 2em;
        }

        .content-wrapper {
            display: flex;
            width: 100%;
            justify-content: space-between;
            margin-bottom: 50px;
        }

        .image-container {
            flex: 1;
            max-width: 45%;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            position: relative;
            overflow: hidden;
            border-radius: 10px;
        }

        .car-image {
            width: 100%;
            height: auto;
            object-fit: cover;
            border-radius: 10px;
            box-shadow: 0 0 25px #00ffff;
            transition: transform 0.3s ease;
        }

        .car-image:hover {
            transform: scale(1.05);
        }

        .form-container {
            flex: 1;
            max-width: 45%;
            padding: 30px;
            background-color: rgba(0, 0, 0, 0.7);
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 255, 255, 0.3);
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

        .form-group {
            margin-bottom: 25px;
            position: relative;
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

        .toggle-container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            margin-bottom: 25px;
        }

        .toggle-switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 34px;
            margin-right: 10px;
        }

        .toggle-switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #333;
            transition: .4s;
            border-radius: 34px;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 26px;
            width: 26px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            transition: .4s;
            border-radius: 50%;
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

        .toggle-label {
            color: #00ffff;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .rental-status {
            width: 100%;
            max-width: 800px;
            margin: 0 auto;
        }

        .pilot-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 10px;
            margin-top: 30px;
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

        .status {
            padding: 5px 10px;
            border-radius: 20px;
            font-weight: bold;
            text-transform: uppercase;
        }

        .status-activo {
            background-color: #ffff00;
            color: #000;
        }

        .status-finalizado {
            background-color: #00ff00;
            color: #000;
        }

        .action-button {
            background-color: #ff00ff;
            color: #fff;
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
            text-transform: uppercase;
            transition: all 0.3s ease;
            display: inline-block;
            margin: 2px;
        }

        .action-button:hover {
            background-color: #00ffff;
            box-shadow: 0 0 10px #00ffff;
        }

        .action-button.disabled {
            background-color: #666;
            cursor: not-allowed;
        }

        .action-button.disabled:hover {
            background-color: #666;
            box-shadow: none;
        }

        @media (max-width: 768px) {
            .container {
                margin: 20px;
            }
            .content-wrapper {
                flex-direction: column;
            }
            .image-container, .form-container {
                max-width: 100%;
            }
            h1 {
                font-size: 2em;
            }
            .image-container {
                height: 300px;
            }
            .pilot-table {
                font-size: 14px;
            }
            .pilot-table th, .pilot-table td {
                padding: 10px;
            }
            .action-button {
                padding: 6px 10px;
                font-size: 12px;
            }
        }

        .glitch-effect {
            position: relative;
        }

        .glitch-effect::before,
        .glitch-effect::after {
            content: attr(data-text);
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }

        .glitch-effect::before {
            left: 2px;
            text-shadow: -2px 0 #ff00ff;
            clip: rect(44px, 450px, 56px, 0);
            animation: glitch-anim 5s infinite linear alternate-reverse;
        }

        .glitch-effect::after {
            left: -2px;
            text-shadow: -2px 0 #00ffff;
            clip: rect(44px, 450px, 56px, 0);
            animation: glitch-anim 5s infinite linear alternate-reverse;
        }

        @keyframes glitch-anim {
            0% { clip: rect(31px, 9999px, 94px, 0); }
            20% { clip: rect(62px, 9999px, 42px, 0); }
            40% { clip: rect(16px, 9999px, 78px, 0); }
            60% { clip: rect(89px, 9999px, 13px, 0); }
            80% { clip: rect(24px, 9999px, 57px, 0); }
            100% { clip: rect(73px, 9999px, 35px, 0); }
        }

        label.lavado-info{
            text-align: center;
            font-size: 10px;
            color: wheat;
            padding-top: 10px;
            margin: 0 0 0 0;
        }

        a {
            text-decoration: none;
            color: #ffffff;
        }

        .a:hover {
            color: #00ffff;
            text-shadow: 0 0 20px #00ffff;
        }
    </style>
</head>
<body>
<div class="nav">
    <nav class="navegacion">
        <a href="#" class="a">Formulario</a>
        <img src="img/car.svg" alt="carrito" width="50">
        <a href="driver" class="a">Alquileres Registrados</a>
    </nav>
</div>
<div class="container">
    <div class="content-wrapper">
        <div class="image-container">
            <img src="img/default.jpg" alt="Foto Principal " class="car-image" id="carImage">
        </div>
        <div class="form-container">
            <h1 class="glitch-effect" data-text="Guarda tu Coche">Guarda tu Coche</h1>
            <form id="reservationForm" action="driver_new" method="post">
                <div class="form-group">
                    <label for="fechaHora">Fecha y Hora de Reserva:</label>
                    <input type="datetime-local" id="fechaHora" name="fechaHora" required >
                </div>
                <div class="form-group">
                    <label for="tipoVehiculo">Tipo de Vehículo:</label>
                    <select id="tipoVehiculo" name="tipoVehiculo" required>
                        <% for (int i = 0; i < TipoVehiculo.values().length; i++) { %>
                        <option value="<%=java.util.Arrays.stream(TipoVehiculo.values()).toList().get(i).name()%>"><%=java.util.Arrays.stream(TipoVehiculo.values()).toList().get(i).name()  %> </option>
                        <% }  %>
                    </select>
                </div>
                <div class="form-group">
                    <label for="placa">Número de Placa:</label>
                    <input type="text" id="placa" name="placa" required title="Ingrese una placa válida (6 caracteres alfanuméricos)">
                </div>
                <div class="form-group">
                    <label for="dni">DNI del Piloto:</label>
                    <input type="text" id="dni" name="dni" required title="Ingrese un DNI válido (8 números seguidos)">
                </div>
                <div class="form-group">
                    <label for="nombreChofer">Nombre del Piloto:</label>
                    <input type="text" id="nombreChofer" name="nombreChofer" required>
                </div>

                <div class="toggle-container">
                    <label class="toggle-label">¿Desea lavado?</label>
                    <label class="toggle-switch">
                        <input type="checkbox" id="lavado" name="lavado" value="lavado">
                        <span class="slider"></span>
                    </label>
                    <label class="lavado-info" > <a href="suscripcion"> Tenemos suscripciones para ti solo con un click </a>   </label>
                    <label class="lavado-info" for="lavado">El lavado costara S/.20 adicional </label>
                </div>
                <button type="submit">Reservar Ahora</button>
            </form>
        </div>
    </div>
</div>

<script>
    document.getElementById('tipoVehiculo').addEventListener('change', function(e) {
        // Obtén el valor seleccionado correctamente
        var tipoVehiculo = document.getElementById("tipoVehiculo").value;
        // Selecciona la imagen del vehículo
        const carImage = document.getElementById('carImage');
        // Cambia el atributo 'src' de la imagen con el valor obtenido
        carImage.setAttribute('src', "img/" + tipoVehiculo + ".jpg");
    });

</script>

</body>
</html>
