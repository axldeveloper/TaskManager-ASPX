<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Proyectos.aspx.cs" Inherits="TaskManager.Web.Pages.Proyectos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Proyectos</title>

    <script src="../Scripts/jquery-3.6.0.min.js"></script>

</head>
<body>
    <h2>Proyectos</h2>

    <input type="text" id="txtNombre" placeholder="Nombre" title="Nombre del proyecto" />
    <input type="text" id="txtDescripcion" placeholder="Descripción" title="Descripción del proyecto" />
    <input type="date" id="txtInicio" title="Fecha de inicio" />
    <input type="date" id="txtFin" title="Fecha de fin" />
    
    <select id="ddlEstado" title="Estado del proyecto">
        <option value="Activo">Activo</option>
        <option value="En Proceso">En Proceso</option>
        <option value="Finalizado">Finalizado</option>

    </select>
    
    <button onclick="guardar()">Guardar</button>

    <button onclick="logout()">Cerrar sesion</button>

    <br /><br />
    <table border="1">
        <thead>
            <tr>
                <th>Nombre</th>
                <th>Estado</th>
            </tr>

        </thead>
        <tbody id="tabla"></tbody>

    </table>

    <script>
        function listar() {
            $.ajax({
                url: "Proyectos.aspx/Listar",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (res) {
                    let html = "";
                    res.d.forEach(p => {
                        html += `<tr><td>${p.Nombre}</td><td>${p.Estado}</td></tr>`;
                    });
                    $("#tabla").html(html);
                }
            });
        }

        function guardar() {
            let p = {
                Nombre: $("#txtNombre").val(),
                Descripcion: $("#txtDescripcion").val(),
                FechaInicio: $("#txtInicio").val(),
                FechaFin: $("#txtFin").val(),
                Estado: $("#ddlEstado").val()
            };

            $.ajax({
                url: "Proyectos.aspx/Guardar",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ p: p }),
                success: function (res) {
                    alert(res.d);
                    listar();
                },

                error: function (err) {
                alert("Error AJAX");
            }
            });
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

        $(document).ready(function () {
            listar();
        });

    </script>

</body>
</html>
