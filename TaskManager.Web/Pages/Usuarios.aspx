<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="TaskManager.Web.Pages.Usuarios" %>

<!DOCTYPE html>
<html>
<head>
    <title>Usuarios</title>

    <script src="../Scripts/jquery-3.6.0.min.js"></script>
</head>
<body>

    <h2>Gestión de Usuarios</h2>

    <input type="text" id="txtNombre" placeholder="Nombre" title="Ingrese el nombre" />
    <input type="text" id="txtApellido" placeholder="Apellido" />
    <input type="text" id="txtCedula" placeholder="Cédula" />

    <button onclick="guardar()">Guardar</button>

    <hr />

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

function guardar() {

    var usuario = {
        Nombre: $("#txtNombre").val(),
        Apellido: $("#txtApellido").val(),
        Cedula: $("#txtCedula").val(),
        GeneroId: 1,
        EstadoCivilId: 1,
        RolId: 1,
        FechaNacimiento: "2000-01-01",
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

$(document).ready(function () {
    listar();
});

</script>
