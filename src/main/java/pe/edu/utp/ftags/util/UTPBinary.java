package pe.edu.utp.ftags.util;

import java.io.*;
import java.nio.ByteBuffer;
import java.security.DigestException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class UTPBinary {

    public static void catbin(String filename)
            throws IOException {
        try(BufferedInputStream in = new BufferedInputStream(
                new FileInputStream(filename))
        ){
            byte[] data = in.readAllBytes();
            int idx = 0;
            for (byte item : data) {
                System.out.print("["+item+"]");
                idx++;
            }
        } catch (IOException e) {
            throw e;
        }
    }

    public static byte[] readBinData(String filename) {
        try(BufferedInputStream in = new BufferedInputStream(
                new FileInputStream(filename))
        ){
            return in.readAllBytes();
        } catch (IOException e) {
            return new byte[] {};
        }
    }

    public static byte[] readBinData(String filename, int nbytes){
        try(BufferedInputStream in = new BufferedInputStream(
                new FileInputStream(filename))
        ){
            byte[] res = new byte[nbytes];
            in.read(res, 0, nbytes);
            return res;
        } catch (IOException e) {
            return new byte[] {};
        }
    }

    public static byte[] readBinData(String filename, int offset, int nbytes){
        try(BufferedInputStream in = new BufferedInputStream(
                new FileInputStream(filename))
        ){
            byte[] res = new byte[nbytes];
            in.skip(offset);
            in.read(res, 0, nbytes);
            return res;
        } catch (IOException e) {
            return new byte[] {};
        }
    }

    public static void echobin(byte[] data, String filename)
            throws IOException{
        try(BufferedOutputStream out = new BufferedOutputStream(
                new FileOutputStream(filename,true))
        ){
            out.write(data);
        } catch (IOException e) {
            throw e;
        }
    }

    public static void writeFile(byte[] data, String filename) throws IOException {
        echobin(data, filename);
    }

    public static byte[] int2Bytes(int val){
        // Crear un byte buffer de 4 bytes
        // (el tipo int tiene un tamaño de 4 bytes)
        ByteBuffer bb = ByteBuffer.allocate(4);
        bb.putInt(val);
        return bb.array();
    }

    public static byte[] int2BigEndian(int val){
        return int2Bytes(val);
    }

    public static byte[] int2LittleEndian(int val){
        byte[] le = int2Bytes(val);
        byte[] be = new byte[le.length];
        int idx = 0;
        for (int i = le.length-1; i >= 0; i--) {
            be[idx] = le[i];
            idx++;
        }
        return be;
    }

    public static void swapEndian(byte[] data){
        byte[] atad = new byte[data.length];
        int idx = 0;
        for (int i = data.length-1; i >= 0; i--) {
            atad[idx] = data[i];
            idx++;
        }
        // copiar en data
        for (int i = 0; i < atad.length; i++) {
            data[i] = atad[i];
        }
    }

    public static int byteArray2int(byte[] data){
        ByteBuffer bb = ByteBuffer.wrap(data);
        return bb.getInt();
    }

    public static short byteArray2short(byte[] data){
        ByteBuffer bb = ByteBuffer.wrap(data);
        return bb.getShort();
    }

    public static String md5(String input) throws NoSuchAlgorithmException {
        try {
            // Obtén la instancia del algoritmo MD5
            MessageDigest md = MessageDigest.getInstance("MD5");
            // Convierte la entrada (contraseña) a bytes y calcula el hash
            byte[] hashBytes = md.digest(input.getBytes());

            // Convierte el hash a formato hexadecimal
            StringBuilder hexString = new StringBuilder();
            for (byte b : hashBytes) {
                // Aplica la conversión a dos dígitos hexadecimales por cada byte
                String hex = Integer.toHexString(0xFF & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }

            return hexString.toString(); // Devuelve el hash en formato hexadecimal
        } catch (NoSuchAlgorithmException e) {
            throw new NoSuchAlgorithmException("El algoritmo MD5 no fue encontrado.");
        }
    }
}
