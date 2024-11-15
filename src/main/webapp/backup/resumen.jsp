<%@ page import="pe.edu.utp.jsp_cru.model.Reserva" %><%--
  Created by IntelliJ IDEA.
  User: Juanpi
  Date: 15/10/2024
  Time: 12:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Reserva reserva = (Reserva) request.getAttribute("reserva");
%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Resumen de Reserva</title>
  <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="container">
  <div class="card">
    <div class="card-content">
      <h1 class="title glitch-effect">Resumen de Reserva</h1>
      <div class="reservation-details">
        <div class="detail">
          <span class="label">Fecha:</span>
          <span class="value"><%= reserva.getFechaHoraEntrada()%></span>
        </div>
        <div class="detail">
          <span class="label">Vehículo:</span>
          <span class="value"><%= reserva.getTipoVehiculo()%></span>
        </div>
        <div class="detail">
          <span class="label">DNI del Piloto:</span>
          <span class="value"><%= reserva.getDni()%></span>
        </div>
        <div class="detail">
          <span class="label">Nombre del Piloto:</span>
          <span class="value"><%= reserva.getNombreConductor()%></span>
        </div>
        <% if ( reserva.isLavado() ) { %>
        <div class="detail">
          <span class="label">Lavado:</span>
          <span class="value">Si</span>
        </div>
        <% } %>
      </div>
      <a href="formulario.jsp"> <button id="confirmBtn" class="confirm-btn">Regresar al formulario</button></a>
    </div>
  </div>
</div>
<script >
  document.addEventListener('DOMContentLoaded', function() {
    const confirmBtn = document.getElementById('confirmBtn');
    confirmBtn.addEventListener('click', function() {
      alert('Reserva confirmada. ¡Prepárate para el futuro!');
    });
  });
</script>
</body>
</html>

<style>
  body {
    font-family: 'Orbitron', sans-serif;
    background-color: rgba(0, 0, 0, 0.9);
    color: #22c55e;
    margin: 0;
    padding: 0;
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background-image:
            linear-gradient(45deg, rgba(255, 0, 255, 0.1) 25%, transparent 25%),
            linear-gradient(-45deg, rgba(255, 0, 255, 0.1) 25%, transparent 25%),
            linear-gradient(45deg, transparent 75%, rgba(255, 0, 255, 0.1) 75%),
            linear-gradient(-45deg, transparent 75%, rgba(255, 0, 255, 0.1) 75%);
    background-size: 20px 20px;
    background-position: 0 0, 0 10px, 10px -10px, -10px 0px;
  }

  .container {
    width: 100%;
    max-width: 28rem;
    padding: 2rem;
  }

  .card {
    background-color: #111827;
    border-radius: 0.5rem;
    box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
    border: 2px solid #22c55e;
    position: relative;
    overflow: hidden;
  }

  .card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: linear-gradient(135deg, rgba(168, 85, 247, 0.1), rgba(6, 182, 212, 0.1));
    z-index: 0;
  }

  .card-content {
    position: relative;
    z-index: 1;
    padding: 2rem;
  }

  .title {
    font-size: 1.875rem;
    font-weight: bold;
    text-align: center;
    margin-bottom: 1.5rem;
    color: #ec4899;
    text-transform: uppercase;
    letter-spacing: 0.05em;
  }

  .reservation-details {
    display: flex;
    flex-direction: column;
    gap: 1rem;
  }

  .detail {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  .label {
    color: #22d3ee;
  }

  .value {
    color: #f472b6;
  }

  .confirm-btn {
    width: 100%;
    margin-top: 1.5rem;
    padding: 0.5rem;
    background-color: #db2777;
    color: #000000;
    font-weight: bold;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    border: none;
    border-radius: 0.25rem;
    cursor: pointer;
    transition: background-color 0.3s ease-in-out;
  }

  .confirm-btn:hover {
    background-color: #22d3ee;
  }

  .glitch-effect {
    position: relative;
    animation: glitch 5s infinite;
  }

  @keyframes glitch {
    0% {
      text-shadow: 0.05em 0 0 rgba(255, 0, 0, 0.75),
      -0.05em -0.025em 0 rgba(0, 255, 0, 0.75),
      0.025em 0.05em 0 rgba(0, 0, 255, 0.75);
    }
    14% {
      text-shadow: 0.05em 0 0 rgba(255, 0, 0, 0.75),
      -0.05em -0.025em 0 rgba(0, 255, 0, 0.75),
      0.025em 0.05em 0 rgba(0, 0, 255, 0.75);
    }
    15% {
      text-shadow: -0.05em -0.025em 0 rgba(255, 0, 0, 0.75),
      0.025em 0.025em 0 rgba(0, 255, 0, 0.75),
      -0.05em -0.05em 0 rgba(0, 0, 255, 0.75);
    }
    49% {
      text-shadow: -0.05em -0.025em 0 rgba(255, 0, 0, 0.75),
      0.025em 0.025em 0 rgba(0, 255, 0, 0.75),
      -0.05em -0.05em 0 rgba(0, 0, 255, 0.75);
    }
    50% {
      text-shadow: 0.025em 0.05em 0 rgba(255, 0, 0, 0.75),
      0.05em 0 0 rgba(0, 255, 0, 0.75),
      0 -0.05em 0 rgba(0, 0, 255, 0.75);
    }
    99% {
      text-shadow: 0.025em 0.05em 0 rgba(255, 0, 0, 0.75),
      0.05em 0 0 rgba(0, 255, 0, 0.75),
      0 -0.05em 0 rgba(0, 0, 255, 0.75);
    }
    100% {
      text-shadow: -0.025em 0 0 rgba(255, 0, 0, 0.75),
      -0.025em -0.025em 0 rgba(0, 255, 0, 0.75),
      -0.025em -0.05em 0 rgba(0, 0, 255, 0.75);
    }
  }
</style>
