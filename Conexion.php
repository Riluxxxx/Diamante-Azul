<?php

Class CONECTAR
{
    Private $servidor="localhost";
    Private $usuario="root";
    Private $basedatos="Diamante_azul";
    Private $passowrd="";

    public function conexion() 
    {
        $conexion=mysqli_connect($this->servidor,$this->usuario,$this->passowrd,$this->basedatos);
        if (!$conexion) {
            die("Error en la conexión: " . mysqli_connect_error());
        }
        return $conexion;
    }
}