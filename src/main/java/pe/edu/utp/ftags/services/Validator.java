package pe.edu.utp.ftags.services;

import pe.edu.utp.ftags.model.TipoVehiculo;

import java.time.LocalDateTime;
import java.util.regex.Pattern;

public class Validator {

    public static boolean validarConductor(String nombre, String dni, String placa, TipoVehiculo tipoVehiculo, LocalDateTime entrada) {

        boolean validador = false;

        // Validador para nombre de conductor
        Pattern patter_nombre = Pattern.compile("^[a-zA-Z ]+$", Pattern.CASE_INSENSITIVE);
        boolean nombre_valido = patter_nombre.matcher(nombre).matches();

        if (nombre.length() < 2 || nombre.length() > 20 || !nombre_valido) {
            throw new IllegalArgumentException("Nombre de conductor no puede ser menor que 2 o mayor que 20");
        }

        if (nombre.isEmpty()) {
            throw new IllegalArgumentException("Nombre de conductor no puede ser nulo o vacio");
        }

        // Validador para DNI
        Pattern patter_dni = Pattern.compile("[0-9]+", Pattern.CASE_INSENSITIVE);
        boolean dni_valido = patter_dni.matcher(dni).matches();

        if (dni.length() != 8 || dni.isEmpty() || !dni_valido)
            throw new IllegalArgumentException("DNI no puede ser mayor o menor que 8 o este el campo vacio");

        // Validador placa
        Pattern patter_placa = Pattern.compile("^[a-zA-Z0-9]+$", Pattern.CASE_INSENSITIVE);
        boolean placa_valido = patter_placa.matcher(placa).matches();

        if (placa.length() != 6 || placa.isEmpty() || !placa_valido)
            throw new IllegalArgumentException("Placa no puede ser mayor o menor que 6 o este el campo vacio");

        // Validador fecha
        if (entrada.isBefore(LocalDateTime.now())) {
            throw new IllegalArgumentException("La fecha de entrada no puede ser anterior al momento actual.");
        }


        validador = true;
        return validador;
    }

    public static boolean validarSuscripcion(String dni, String placa, String tarjeta) {
        boolean validador = false;

        // Validador para DNI
        Pattern patter_dni = Pattern.compile("[0-9]+", Pattern.CASE_INSENSITIVE);
        boolean dni_valido = patter_dni.matcher(dni).matches();

        if (dni.length() != 8  || dni.isEmpty() || !dni_valido)
            throw new IllegalArgumentException("DNI no puede ser mayor o menor que 8 o este el campo vacio");

        // Validador placa
        Pattern patter_placa = Pattern.compile("^[a-zA-Z0-9]+$", Pattern.CASE_INSENSITIVE);
        boolean placa_valido = patter_placa.matcher(placa).matches();

        if (placa.length() != 6 || placa.isEmpty() || !placa_valido)
            throw new IllegalArgumentException("Placa no puede ser mayor o menor que 6 o este el campo vacio");

        // Validador tarjeta
        Pattern patter_tarjeta = Pattern.compile("[0-9]+", Pattern.CASE_INSENSITIVE);
        boolean tarjeta_valido = patter_tarjeta.matcher(tarjeta).matches();

        if (tarjeta.length() != 16 || tarjeta.isEmpty() || !tarjeta_valido)
            throw new IllegalArgumentException("Tarjeta no puede ser mayor o menor que 16 o este el campo vacio");

        validador = true;
        return validador;
    }

}
