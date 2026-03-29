<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TaskManager.Web.Pages.Home" %>

<!DOCTYPE html>
<html>
<head>
    <title>Task Manager</title>
</head>
<body>

    <h1>Sistema de Gestión de Tareas</h1>

    <p>Aplicación iniciada correctamente.</p>

    <p>Seleccione una opción:</p>

    <button onclick="irUsuarios()">Usuarios</button>
   <%-- <button onclick="irProyectos()">Proyectos</button>
    <button onclick="irTareas()">Tareas</button>--%>

    <br><br>

    <button onclick="logout()">Cerrar sesión</button>

    <script>
        function irUsuarios() {
            window.location.href = "Usuarios.aspx";
        }

        //function irProyectos() {
        //    window.location.href = "Proyectos.aspx";
        //}

        //function irTareas() {
        //    window.location.href = "Tareas.aspx";
        //}

        function logout() {
            document.cookie = "usuario=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
            window.location.href = "Login.aspx";
        }
    </script>

</body>
</html>