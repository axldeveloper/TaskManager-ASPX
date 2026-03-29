<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="TaskManager.Web.Pages.Usuarios" %>

<!DOCTYPE html>
<html>
<head>
    <title>Usuarios</title>

    <script src="../Scripts/jquery-3.6.0.min.js"></script>

    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
</head>
<body>

    <h2>Gestión de Usuarios</h2>

    <input type="text" id="txtNombre" placeholder="Nombre" title="Ingrese el nombre" />
    <input type="text" id="txtApellido" placeholder="Apellido" />
    <input type="text" id="txtCedula" placeholder="Cedula" />

    <input type="date" id="txtFecha" title="Seleccione fecha de nacimiento" />

    <select id="ddlGenero" title="Seleccione genero"></select>
    <select id="ddlEstadoCivil" title="Seleccione estado civil"></select>
    <select id="ddlRol" title="Seleccione rol"></select>

    <button onclick="guardar()">Guardar</button>

    <hr />

    <h3>.:Buscar:.</h3>

    <input type="text" id="txtBuscarNombre" placeholder="Buscar por nombre" />
    <input type="text" id="txtBuscarCedula" placeholder="Buscar por cedula" />

    <button onclick="filtrar()">Buscar</button>
    <button onclick="listar()">Limpiar</button>

    <table border="1" id="tablaUsuarios">
        <thead>
            <tr>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Cédula</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody></tbody>
    </table>

</body>
</html>

<script>

    $(function () {
        $("#txtFecha").datepicker({
            dateFormat: "yy-mm-dd"
        });
    });

    function guardar() {

        var usuario = {
            Nombre: $("#txtNombre").val(),
            Apellido: $("#txtApellido").val(),
            Cedula: $("#txtCedula").val(),
            GeneroId: $("#ddlGenero").val(),
            EstadoCivilId: $("#ddlEstadoCivil").val(),
            RolId: $("#ddlRol").val(),
            FechaNacimiento: $("#txtFecha").val(),
            UserName: "test",
            Password: "1234"
        };

    $.ajax({
        url: "Usuarios.aspx/Guardar",
        method: "POST",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: JSON.stringify({ usuario: usuario }),

        success: function (res) {
            alert(res.d);
            listar();
        },
        
        error: function (err) {
            alert("Error AJAX");
        }
    });
}

    function listar() {

        $.ajax({
            url: "Usuarios.aspx/Listar",
            method: "POST",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (res) {

                var data = res.d;
                var html = "";

                data.forEach(function (u) {
                    html += "<tr>";
                    html += "<td>" + u.Nombre + "</td>";
                    html += "<td>" + u.Apellido + "</td>";
                    html += "<td>" + u.Cedula + "</td>";
                    html += "<td><button onclick='eliminar(" + u.Id + ")'>Eliminar</button></td>";
                    html += "</tr>";
                });

                $("#tablaUsuarios tbody").html(html);
            }
        });
    }

    function eliminar(id) {

        $.ajax({
            url: "Usuarios.aspx/Eliminar",
            method: "POST",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: JSON.stringify({ id: id }),
            success: function () {
                listar();
            }
        });
    }

    function cargarCombos() {

        $.ajax({
            url: "Usuarios.aspx/GetGeneros",
            type: "POST",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (res) {
                let html = "";
                res.d.forEach(x => {
                    html += `<option value="${x.Id}">${x.Descripcion}</option>`;
                });
                $("#ddlGenero").html(html);
            }
        });

        $.ajax({
            url: "Usuarios.aspx/GetEstadoCivil",
            type: "POST",
            contentType: "application/json; charset=utf-8",
            success: function (res) {
                let html = "";
                res.d.forEach(x => {
                    html += `<option value="${x.Id}">${x.Descripcion}</option>`;
                });
                $("#ddlEstadoCivil").html(html);
            }
        });

        $.ajax({
            url: "Usuarios.aspx/GetRoles",
            type: "POST",
            contentType: "application/json; charset=utf-8",
            success: function (res) {
                let html = "";
                res.d.forEach(x => {
                    html += `<option value="${x.Id}">${x.Descripcion}</option>`;
                });
                $("#ddlRol").html(html);
            }
        });
    }

    function filtrar() {

        var nombre = $("#txtBuscarNombre").val();
        var cedula = $("#txtBuscarCedula").val();

        $.ajax({
            url: "Usuarios.aspx/Filtrar",
            type: "POST",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({
                nombre: nombre,
                cedula: cedula
            }),
            success: function (res) {

                var data = res.d;
                var html = "";

                for (var i = 0; i < data.length; i++) {

                    html += "<tr>";
                    html += "<td>" + data[i].Nombre + "</td>";
                    html += "<td>" + data[i].Apellido + "</td>";
                    html += "<td>" + data[i].Cedula + "</td>";
                    html += "<td><button onclick='eliminar(" + data[i].Id + ")'>Eliminar</button></td>";
                    html += "</tr>";
                }

                $("#tablaUsuarios tbody").html(html);
            }
        });
    }

    $(document).ready(function () {
        listar();
        cargarCombos();
    });

</script>
