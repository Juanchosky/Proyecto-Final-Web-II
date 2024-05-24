<?php
include("../login/conexion.php"); // Asegúrate que esta ruta también sea correcta
session_start();

if (isset($_POST['submit'])) {
    $nombreArchivo = $_POST['nombre'];
    $idPaciente = $_POST['num_id'];
    $medicoId = $_SESSION['Num_identificacion'];
    $archivo = $_FILES['documento']['name'];
    $rutaTemporal = $_FILES['documento']['tmp_name'];
    $extension = strtolower(pathinfo($archivo, PATHINFO_EXTENSION));

    if ($extension != "pdf" && $extension != "docx") {
        echo "Solo se admiten archivos PDF o DOCX.";
    } else {
        // Ruta relativa al directorio Documentos desde el script actual
        $directorio = "../../Documentos/";
        $rutaArchivo = $directorio . basename($archivo);

        // Verificar y crear el directorio si no existe
        if (!file_exists($directorio)) {
            mkdir($directorio, 0777, true); // Intenta crear el directorio si no existe
        }

        // Intentar mover el archivo subido al directorio de Documentos
        if (move_uploaded_file($rutaTemporal, $rutaArchivo)) {
            $sql = "INSERT INTO documento (nombre, archivo, id_paciente, medico)
                    VALUES ('$nombreArchivo', '$rutaArchivo', '$idPaciente', '$medicoId')";
            if ($conexion->query($sql) === TRUE) {
                echo "El documento ha sido subido y registrado exitosamente.";
            } else {
                echo "Error al guardar en la base de datos: " . $conexion->error;
            }
        } else {
            echo "Hubo un error al subir el archivo.";
        }
    }
}
?>
