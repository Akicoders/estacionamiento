
<%@ page import="pe.edu.utp.jsp_cru.model.Suscriptor" %><%--
  Created by IntelliJ IDEA.
  User: Juanpi
  Date: 15/10/2024
  Time: 12:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Suscriptor suscriptor = (Suscriptor) request.getAttribute("suscriptor");
%>


<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Resumen de Suscripción Cyberpunk</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&display=swap');

    :root {
      --neon-green: #00ff00;
      --neon-pink: #ff00ff;
      --neon-blue: #00ffff;
      --dark-bg: #0a0a0a;
    }

    body {
      font-family: 'Orbitron', sans-serif;
      background-color: var(--dark-bg);
      color: var(--neon-green);
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      background-image:
              linear-gradient(45deg, rgba(255, 0, 255, 0.1) 25%, transparent 25%),
              linear-gradient(-45deg, rgba(255, 0, 255, 0.1) 25%, transparent 25%),
              linear-gradient(45deg, transparent 75%, rgba(255, 0, 255, 0.1) 75%),
              linear-gradient(-45deg, transparent 75%, rgba(255, 0, 255, 0.1) 75%);
      background-size: 20px 20px;
      background-position: 0 0, 0 10px, 10px -10px, -10px 0px;
    }

    .summary-card {
      background-color: rgba(0, 0, 0, 0.8);
      border: 2px solid var(--neon-green);
      border-radius: 15px;
      padding: 30px;
      width: 100%;
      max-width: 400px;
      box-shadow: 0 0 20px var(--neon-green), 0 0 40px var(--neon-pink);
    }

    .summary-title {
      color: var(--neon-pink);
      font-size: 24px;
      text-align: center;
      margin-bottom: 20px;
      text-transform: uppercase;
      letter-spacing: 2px;
      text-shadow: 0 0 10px var(--neon-pink);
    }

    .summary-item {
      display: flex;
      justify-content: space-between;
      margin-bottom: 15px;
      border-bottom: 1px solid var(--neon-blue);
      padding-bottom: 10px;
    }

    .summary-label {
      color: var(--neon-blue);
      font-weight: bold;
    }

    .summary-value {
      color: var(--neon-green);
      text-shadow: 0 0 5px var(--neon-green);
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
      text-shadow: -2px 0 var(--neon-pink);
      clip: rect(44px, 450px, 56px, 0);
      animation: glitch-anim 5s infinite linear alternate-reverse;
    }

    .glitch-effect::after {
      left: -2px;
      text-shadow: -2px 0 var(--neon-blue);
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
<div class="summary-card">
  <h1 class="summary-title glitch-effect" data-text="Resumen de Suscripción">Resumen de Suscripción</h1>
  <div class="summary-item">
    <span class="summary-label">DNI:</span>
    <span class="summary-value"><%= suscriptor.getDni()%></span>
  </div>
  <div class="summary-item">
    <span class="summary-label">Placa:</span>
    <span class="summary-value"><%= suscriptor.getPlaca()%></span>
  </div>
  <div class="summary-item">
    <span class="summary-label">Tarjeta:</span>
    <span class="summary-value">************<%= suscriptor.getTarjeta().substring(12) %></span>
  </div>
  <div class="summary-item">
    <span class="summary-label">Suscripción:</span>
    <span class="summary-value"><%= suscriptor.getDetalle_suscripcion().getNombre()%></span>
  </div>

  <div class="summary-item">
    <span class="summary-label">Precio de la suscripcion:</span>
    <span class="summary-value"><%= suscriptor.getDetalle_suscripcion().getPrecio()%></span>
  </div>

  <div class="summary-item">
    <span class="summary-label">Codigo de sorteo:</span>
    <span class="summary-value">Apareceras en la tabla con tu codigo de sorteo :D!!!</span>
  </div>

</div>
</body>
</html>

