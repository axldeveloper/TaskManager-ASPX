<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TaskManager.Web.Pages.Home" %>

<!DOCTYPE html>
<html>
<head>
    <title>Task Manager</title>

    <script src="../Scripts/jquery-3.6.0.min.js"></script>

</head>
<body>

    <h1>Sistema de Gestión de Tareas</h1>

    <p>Aplicación iniciada correctamente.</p>

    <p>Seleccione una opción:</p>

    <button onclick="irUsuarios()">Usuarios</button>
    <button onclick="irProyectos()">Proyectos</button>
    <button onclick="irTareas()">Tareas</button>

    <br><br>

    <button onclick="logout()">Cerrar sesión</button>

    <script>
        function irUsuarios() {
            window.location.href = "Usuarios.aspx";
        }

        function irProyectos() {
            window.location.href = "Proyectos.aspx";
        }

        function irTareas() {
            window.location.href = "Tareas.aspx";
        }

        function logout() {
            $.ajax({
                url: "Home.aspx/Logout",
                type: "POST",
                contentType: "application/json",
                success: function () {
                    window.location.href = "Login.aspx";
                }
            });
        }
    </script>

</body>
</html>