<%@ page import="java.util.List" %>
<%@ page import="pe.edu.utp.jsp_cru.model.Suscriptor" %>
<%@ page import="pe.edu.utp.jsp_cru.model.PlanSuscripcion" %>
<%--
  Created by IntelliJ IDEA.
  User: Santiago
  Date: 17/10/2024
  Time: 20:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Suscriptor> allSuscriptor = (List<Suscriptor>) request.getAttribute("allSuscriptor");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Suscripciones de Lavado Cyberpunk 2077 - Experiencia Elevada</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&display=swap');

        :root {
            --primary-color: #00ff00;
            --secondary-color: #ff00ff;
            --tertiary-color: #00ffff;
            --bg-color: #0a0a0a;
            --text-color: #00ff00;
        }

        .marketing {
            text-align: center;
            margin-top: 50px;
            padding: 20px;
            background-color: rgba(255, 0, 255, 0.1);
            border-radius: 10px;
        }

        .marketing h2 {
            color: #00ffff;
        }

        .marketing p {
            font-size: 18px;
            margin-bottom: 20px;
        }

        body {
            font-family: 'Orbitron', sans-serif;
            background-color: var(--bg-color);
            color: var(--text-color);
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
            padding: 20px;
        }

        h1, h2, h3 {
            text-align: center;
            color: var(--secondary-color);
            text-transform: uppercase;
            letter-spacing: 3px;
            margin-bottom: 30px;
            text-shadow: 0 0 10px var(--secondary-color), 0 0 20px var(--secondary-color);
        }

        .subscription-plans {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 40px;
        }

        .plan {
            background-color: rgba(0, 0, 0, 0.7);
            border: 2px solid var(--primary-color);
            border-radius: 15px;
            padding: 20px;
            width: 300px;
            text-align: center;
            transition: all 0.3s ease;
            box-shadow: 0 0 15px rgba(0, 255, 255, 0.3);
            position: relative;
        }

        .plan:hover {
            transform: translateY(-10px);
            box-shadow: 0 0 30px rgba(0, 255, 255, 0.5);
        }

        .plan h3 {
            color: var(--tertiary-color);
            font-size: 24px;
            margin-bottom: 15px;
        }

        .plan .price {
            font-size: 36px;
            color: var(--secondary-color);
            margin-bottom: 20px;
        }

        .plan ul {
            list-style-type: none;
            padding: 0;
            margin-bottom: 20px;
            text-align: left;
        }

        .plan ul li {
            margin-bottom: 10px;
            padding-left: 20px;
            position: relative;
        }

        .plan ul li::before {
            content: '✓';
            position: absolute;
            left: 0;
            color: var(--tertiary-color);
        }

        .best-seller {
            position: absolute;
            top: -10px;
            right: -10px;
            background-color: var(--secondary-color);
            color: var(--bg-color);
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 14px;
            font-weight: bold;
            transform: rotate(15deg);
            box-shadow: 0 0 10px var(--secondary-color);
        }

        .subscription-form {
            background-color: rgba(0, 0, 0, 0.7);
            border: 2px solid var(--primary-color);
            border-radius: 15px;
            padding: 30px;
            max-width: 600px;
            margin: 0 auto;
            box-shadow: 0 0 15px rgba(0, 255, 255, 0.3);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: var(--tertiary-color);
            font-size: 18px;
        }

        .form-group input, .form-group select {
            width: 100%;
            padding: 12px;
            border: 1px solid var(--primary-color);
            background-color: rgba(0, 255, 0, 0.1);
            color: var(--primary-color);
            border-radius: 5px;
            font-family: 'Orbitron', sans-serif;
            font-size: 16px;
            box-sizing: border-box;
        }

        .form-group input:focus, .form-group select:focus {
            outline: none;
            box-shadow: 0 0 10px var(--tertiary-color);
        }

        .submit-btn {
            background-color: var(--secondary-color);
            color: var(--bg-color);
            border: none;
            padding: 15px 30px;
            font-size: 20px;
            cursor: pointer;
            transition: all 0.3s ease;
            border-radius: 5px;
            width: 100%;
            text-transform: uppercase;
            letter-spacing: 2px;
            font-weight: bold;
        }

        .submit-btn:hover {
            background-color: var(--tertiary-color);
            color: var(--bg-color);
            box-shadow: 0 0 15px var(--tertiary-color);
        }

        .subscribers-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 10px;
            margin-top: 50px;
        }

        .subscribers-table th, .subscribers-table td {
            padding: 15px;
            text-align: left;
            background-color: rgba(0, 255, 255, 0.1);
            border: 1px solid var(--tertiary-color);
        }

        .subscribers-table th {
            background-color: rgba(255, 0, 255, 0.2);
            color: var(--secondary-color);
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .subscribers-table tr {
            transition: all 0.3s ease;
        }

        .subscribers-table tr:hover {
            background-color: rgba(0, 255, 255, 0.2);
            transform: scale(1.02);
            box-shadow: 0 0 15px rgba(0, 255, 255, 0.5);
        }

        .coming-soon {
            text-align: center;
            margin-top: 30px;
            padding: 20px;
            background-color: rgba(255, 0, 255, 0.1);
            border-radius: 10px;
        }

        .coming-soon p {
            font-size: 18px;
            color: var(--tertiary-color);
            font-weight: bold;
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
            text-shadow: -2px 0 var(--secondary-color);
            clip: rect(44px, 450px, 56px, 0);
            animation: glitch-anim 5s infinite linear alternate-reverse;
        }

        .glitch-effect::after {
            left: -2px;
            text-shadow: -2px 0 var(--tertiary-color);
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
    </style>
</head>
<body>
<div class="container">
    <h1 class="glitch-effect" data-text="Suscripciones de Lavado Cyberpunk">Suscripciones de Lavado Cyberpunk</h1>

    <div class="subscription-plans">
        <div class="plan">
            <h3>Gold</h3>
            <div class="price">S/. 50/mes</div>
            <ul>
                <li>Lavado exterior completo</li>
                <li>Limpieza de llantas y rines</li>
                <li>Aspirado interior básico</li>
                <li>Protección UV básica</li>
                <li>Aromatizante de alta tecnología</li>
            </ul>
        </div>

        <div class="plan">
            <div class="best-seller">Más vendido</div>
            <h3>Diamond</h3>
            <div class="price">S/. 250/mes</div>
            <ul>
                <li>Lavado exterior premium con nanotecnología</li>
                <li>Detallado interior completo</li>
                <li>Pulido y encerado de carrocería</li>
                <li>Tratamiento de cuero y plásticos</li>
                <li>Desinfección con luz UV</li>
                <li>Protección contra lluvia ácida</li>
                <li>Recubrimiento anti-rayones</li>
            </ul>
        </div>

        <div class="plan">
            <h3>Radio</h3>
            <div class="price">S/. 300/mes</div>
            <ul>
                <li>Todo lo incluido en Diamond</li>
                <li>Lavado con espuma activa fluorescente</li>
                <li>Tratamiento cerámico para pintura</li>
                <li>Personalización de luces LED interiores</li>
                <li>Actualización de software del vehículo</li>
                <li>Escudo electromagnético anti-hackeo</li>
                <li>Servicio de recogida y entrega</li>
            </ul>
        </div>
    </div>

    <h2 class="glitch-effect" data-text="Únete a la élite del cuidado vehicular">Únete a la élite del cuidado vehicular</h2>
    <form id="subscriptionForm" class="subscription-form" action="newSuscription">
        <div class="form-group">
            <label for="dni">DNI:</label>
            <input type="text" id="dni" name="dni" required pattern="\d{8}" title="Ingrese un DNI válido (8 números seguidos)">
        </div>
        <div class="form-group">
            <label for="placa">Placa:</label>
            <input type="text" id="placa" name="placa" required pattern="[A-Za-z0-9]{6}" title="Ingrese una placa válida (6 caracteres alfanuméricos)">
        </div>
        <div class="form-group">
            <label for="tarjeta">Tarjeta de Pago:</label>
            <input type="text" id="tarjeta" name="tarjeta" required pattern="\d{16}" title="Ingrese un número de tarjeta válido (16 dígitos)">
        </div>
        <div class="form-group">
            <label for="plan">Plan de Suscripción:</label>
            <select id="plan" name="plan"  required>
                <% for (int i = 0; i < PlanSuscripcion.values().length; i++) { %>
                <option value="<%=java.util.Arrays.stream(PlanSuscripcion.values()).toList().get(i).name()%>"><%=java.util.Arrays.stream(PlanSuscripcion.values()).toList().get(i).name()  %> </option>
                <% }  %>
            </select>
        </div>
        <button type="submit" class="submit-btn">Suscribirse</button>
    </form>

    <div class="marketing">
        <h2 class="glitch-effect" data-text="¡Únete a la élite del lavado cyberpunk!">¡Únete a la élite del lavado cyberpunk!</h2>
        <p>La mayoría de nuestros clientes eligen el plan Diamond por su increíble relación calidad-precio. ¡Experimenta el futuro del cuidado automotriz hoy!</p>
        <p>Con nuestras suscripciones, tu vehículo no solo estará limpio, ¡brillará en las calles de Night City como nunca antes!</p>
        <p>Al estar suscripto te llevaras un codigo para participar en el gran sorteo del leoncito de Akicoders!!! No te lo puedes perder.</p>
    </div>


    <h2 class="glitch-effect" data-text="Nuestros Suscriptores">Nuestros Suscriptores</h2>
    <table class="subscribers-table">
        <thead>
        <tr>
            <th>DNI</th>
            <th>Placa</th>
            <th>Plan de Suscripción</th>
            <th>Código de Sorteo</th>
        </tr>
        </thead>
        <tbody id="subscribersTableBody">
        <% for(Suscriptor suscriptor : allSuscriptor) {%>
        <tr>
            <td><%=suscriptor.dni %> </td>
            <td><%=suscriptor.placa%> </td>
            <td><%=suscriptor.detalle_suscripcion.getNombre().toUpperCase()%></td>
            <td><%=suscriptor.codigo_sorteo%> </td>
        </tr>
        <% } %>
        </tbody>
    </table>

    <div class="coming-soon">
        <p>Coming Soon: Estamos trabajando en el sorteo. ¡Mantente atento para más novedades!</p>
    </div>
</div>
