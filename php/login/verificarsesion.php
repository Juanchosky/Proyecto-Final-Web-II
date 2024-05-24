<?php

session_start();
include('conexion.php');

if (isset($_POST['correo']) && isset($_POST['Contraseña'])) {
    function validate($data){
        $data = trim($data);
        $data = stripcslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }

    $correo = validate($_POST['correo']);
    $Contraseña = validate($_POST['Contraseña']);

    if(empty($correo) || empty($Contraseña)){
        header("Location: iniciosesion.php?error=Ingrese el usuario y la contraseña");
        exit();
    } else {
        $sql = "SELECT * FROM usuarios WHERE correo = '$correo' AND Contraseña = '$Contraseña'";
        $resultado = mysqli_query($conexion, $sql);

        if (mysqli_num_rows($resultado) === 1) {
            $row = mysqli_fetch_assoc($resultado);
            
            // Verificar el rol del usuario
            if ($row['rol'] === 'administrador') {
                // Usuario administrador
                $_SESSION['Apellido'] = $row['Apellido'];
                $_SESSION['Nombre'] = $row['Nombre'];
                $_SESSION['Num_identificacion'] = $row['Num_identificacion'];
                $_SESSION['TipoIdentificacion'] = $row['TipoIdentificacion'];
                $_SESSION['correo'] = $row['correo'];
                $_SESSION['direccion'] = $row['direccion'];
                $_SESSION['Contraseña'] = $row['Contraseña'];
                $_SESSION['Fecha_nacimiento'] = $row['Fecha_nacimiento'];

                header("Location: ../administrador/PanelAdministrador.php");
                exit();

            }else if ($row['rol'] == 'medico'){

                $_SESSION['Apellido'] = $row['Apellido'];
                $_SESSION['Nombre'] = $row['Nombre'];
                $_SESSION['Num_identificacion'] = $row['Num_identificacion'];
                $_SESSION['TipoIdentificacion'] = $row['TipoIdentificacion'];
                $_SESSION['correo'] = $row['correo'];
                $_SESSION['direccion'] = $row['direccion'];
                $_SESSION['Contraseña'] = $row['Contraseña'];
                $_SESSION['Fecha_nacimiento'] = $row['Fecha_nacimiento'];
                header("Location: ../medico/PanelMedico.php");
                exit();

            }else {
                // Otros roles (por ejemplo, paciente)
                $_SESSION['Apellido'] = $row['Apellido'];
                $_SESSION['Nombre'] = $row['Nombre'];
                $_SESSION['Num_identificacion'] = $row['Num_identificacion'];
                $_SESSION['TipoIdentificacion'] = $row['TipoIdentificacion'];
                $_SESSION['correo'] = $row['correo'];
                $_SESSION['direccion'] = $row['direccion'];
                $_SESSION['Contraseña'] = $row['Contraseña'];
                $_SESSION['Fecha_nacimiento'] = $row['Fecha_nacimiento'];
                header("Location: ../paciente/Iniciopaciente.php");
                exit();
            }
            

        } else {
            // Usuario o contraseña incorrectos
            header("Location: iniciosesion.php?error=El usuario o la contraseña son incorrectas");
            exit();
        }
    }
} else {
    // Si no se enviaron correo y contraseña, redirigir a la página de inicio
    header("Location: inicio.php");
    exit();
}











