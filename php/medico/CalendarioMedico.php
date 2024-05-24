<?php
include ("../login/conexion.php");
session_start();
$medico_id =  $_SESSION['Nombre']; // Asegúrate de que esto corresponde al ID del médico
$Nombre = $_SESSION['Nombre'];
    $Apellido = $_SESSION['Apellido'];
    $Tipo_identifcacion = $_SESSION['TipoIdentificacion'];
    $correo = $_SESSION['correo'];
    $direccion = $_SESSION['direccion'];
    $Num_identificacion = $_SESSION['Num_identificacion'];
// Realizar la consulta SQL
$sql = "SELECT c.fecha, c.hora, c.motivo, c.paciente_id, u.nombre AS Nombre_Paciente, u.apellido AS Apellido_Paciente
FROM agendar_citas c
JOIN usuarios u ON c.paciente_id = u.num_identificacion
WHERE c.medico = '$medico_id'"; // Cambia 'medico_id' por el campo correcto si es necesario
$resultado = $conexion->query($sql);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de Control - Medico</title>
    <link rel="stylesheet" href="../../estilos/PanelInstructor.css">
</head>

<body>
    

    <div class="container">
    <div class="sidebar">
            <div class="header">
                <h1>Panel de Control</h1>
                <p><?php echo $Nombre . " " . $Apellido; ?></p>
                <p><?php echo $Num_identificacion; ?></p>
            </div>
            <ul>
            <li><a href="PanelMedico.php">Inicio</a></li>
                <li><a href="GestionDeCitasMedico.php">Citas Medicas</a></li>
                <li><a href="GestionDocumentosMedico.php">Documentos</a></li>
                <li><a href="CalendarioMedico.php">Calendario Citas</a></li>
                <li><a href="ConfiguracionMedico.php">Configuración</a></li>
                <li><a href="../cerrarsesion.php">Cerrar Sesión</a></li>
            </ul>
        </div>

        <div class="content">
            <h2>Calendario Medico</h2>
    </div>
</body>
</html>
