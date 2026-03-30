<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tareas.aspx.cs" Inherits="TaskManager.Web.Pages.Tareas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Tareas</title>

    <script src="../Scripts/jquery-3.6.0.min.js"></script>

</head>
<body>
    <h2>Tareas</h2>

    <input type="text" id="txtTitulo" placeholder="Título" />
    <input type="text" id="txtDescripcion" placeholder="Descripción" />
    
    <select id="ddlProyecto"></select>
    <select id="ddlUsuario"></select>
    
    <select id="ddlEstado">
        <option value="Pendiente">Pendiente</option>
        <option value="En Proceso">En Proceso</option>
        <option value="Finalizado">Finalizado</option>

    </select>
    
    <button onclick="guardar()">Guardar</button>

    <button onclick="logout()">Cerrar sesión</button>
    
    <br /><br />
    
    <table border="1">
        <thead>
            <tr>
                <th>Título</th>
                <th>Proyecto</th>
                <th>Usuario</th>
                <th>Estado</th>

            </tr>

        </thead>
        <tbody id="tabla"></tbody>

    </table>

    <script>
        function cargarProyectos() {
            $.ajax({
                url: "Tareas.aspx/GetProyectos",
                type: "POST",
                contentType: "application/json",
                success: function (res) {
                    let html = "";
                    res.d.forEach(p => {
                        html += `<option value="${p.Id}">${p.Nombre}</option>`;
                    });
                    $("#ddlProyecto").html(html);
                }
            });
        }

        function cargarUsuarios() {
            $.ajax({
                url: "Tareas.aspx/GetUsuarios",
                type: "POST",
                contentType: "application/json",
                success: function (res) {
                    let html = "";
                    res.d.forEach(u => {
                        html += `<option value="${u.Id}">${u.Nombre}</option>`;
                    });
                    $("#ddlUsuario").html(html);
                }
            });
        }

        function listar() {
            $.ajax({
                url: "Tareas.aspx/Listar",
                type: "POST",
                contentType: "application/json",
                success: function (res) {
                    let html = "";
                    res.d.forEach(t => {
                        html += `<tr><td>${t.Titulo}</td><td>${t.NombreProyecto}</td><td>${t.NombreUsuario}</td><td>${t.Estado}</td></tr>`;
                    });
                    $("#tabla").html(html);
                }
            });
        }

        function guardar() {
            let t = {
                Titulo: $("#txtTitulo").val(),
                Descripcion: $("#txtDescripcion").val(),
                ProyectoId: $("#ddlProyecto").val(),
                UsuarioAsignadoId: $("#ddlUsuario").val(),
                Estado: $("#ddlEstado").val()
            };

            $.ajax({
                url: "Tareas.aspx/Guardar",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify({ t: t }),
                success: function (res) {
                    alert(res.d);
                    listar();
                }
            });
        }

        function logout() {
            document.cookie = "usuario=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
            window.location.href = "Login.aspx";
        }

        $(document).ready(function () {
            cargarProyectos();
            cargarUsuarios();
            listar();
        });

    </script>

</body>
</html>
