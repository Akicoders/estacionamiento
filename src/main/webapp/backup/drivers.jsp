<%@ page import="java.util.List" %>
<%@ page import="pe.edu.utp.jsp_cru.model.RegistroEntrada" %>
<%@ page import="pe.edu.utp.jsp_cru.model.RegistroSalida" %>
<%@ page import="pe.edu.utp.jsp_cru.business.ReservaDAO" %><%--
  Created by IntelliJ IDEA.
  User: Juanpi
  Date: 15/10/2024
  Time: 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<RegistroEntrada> allDriver = (List<RegistroEntrada>) request.getAttribute("allDriver");
    List<RegistroSalida> allDriverOut = (List<RegistroSalida>) request.getAttribute("allDriverOut");
%>

<html>
<head>
    <title>Title</title>
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
            display: flex;
            flex-direction: column;
            justify-content: center;
            max-width: 1400px;
            margin: 40px auto;
            background-color: rgba(26, 26, 26, 0.9);
            border: 2px solid #00ff00;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 0 30px #00ff00, 0 0 50px #ff00ff;
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
            width: 100%;
            padding: 12px;
            border: 1px solid #00ff00;
            background-color: rgba(0, 255, 0, 0.1);
            color: #00ff00;
            border-radius: 5px;
            font-family: 'Orbitron', sans-serif;
            font-size: 16px;
            transition: all 0.3s ease;
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

        input:checked + .slider:after {
            content: 'SÍ';
            left: 30%;
        }

        .rental-status {
            width: 100%;
            max-width: 70em;
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
        <a href="formulario.jsp" class="a">Formulario</a>
        <img src="img/car.svg" alt="carrito" width="50">
        <a href="#" class="a">Alquileres Registrados</a>
    </nav>
</div>
<div class="container">
    <div class="rental-status">
        <h2  class="glitch-effect" data-text="Estado de Alquileres">Estado de Alquileres</h2>
        <table class="pilot-table">
            <thead>
            <tr>
                <th>Piloto</th>
                <th>Vehículo</th>
                <th>Placa</th>
                <th>Fecha y Hora</th>
                <th>Lavado</th>
                <th>Acciones</th>
            </tr>
            </thead>
            <tbody id="pilotTableBody">
            <% for (RegistroEntrada item: allDriver) { %>
            <tr>
                <td><%= item.getNombreConductor() %></td>
                <td><%= item.getTipoVehiculo() %></td>
                <td name="plaquita" id="plaquita"><%= item.getPlaca() %></td>
                <td><%= item.getFechaHoraEntrada() %></td>
                <td name="lavado" id="lavado"><%= item.getLavado() %></td>
                <td><a href="delete_driver.jsp?txtId=<%= item.getIdRegistroEntrada()%>"><button>Finalizar</button></a></td>
            </tr>
            <% } %>
            </tbody>
        </table>

        <h2 class="glitch-effect" data-text="Alquileres Finalizados">Alquileres Finalizados</h2>
        <table class="pilot-table">
            <thead>
            <tr>
                <th>Estacionamiento</th>
                <th>Piloto</th>
                <th>Vehículo</th>
                <th>Placa</th>
                <th>Lavado</th>
                <th>Fecha y Hora de Entrada</th>
                <th>Fecha y Hora de Salida</th>
                <th>Total</th>
            </tr>
            </thead>
            <tbody id="finishedRentalsTableBody">
            <% for (RegistroSalida item: allDriverOut) { %>
            <tr>
                <td><%= item.getNombreEstacionamiento() %></td>
                <td><%= item.getNombreConductor() %></td>
                <td><%= item.getTipoVehiculo() %></td>
                <td><%= item.getPlaca() %></td>
                <td><%= item.getLavado() %></td>
                <td><%= item.getFechaHoraEntrada() %></td>
                <td><%= item.getFechaHoraSalida() %></td>
                <td><%= item.getTotal() %></td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>


</div>
</body>
</html>
