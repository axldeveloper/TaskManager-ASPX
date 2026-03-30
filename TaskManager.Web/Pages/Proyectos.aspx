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
    <input type="date" id="txtInicio" title="Ingrese fecha de inicio" />
    <input type="date" id="txtFin" title="Ingrese fecha de fin" />
    
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
                <th>Descripcion</th>
                <th>Fecha Inicio</th>
                <th>Fecha Fin</th>
                <th>Estado</th>
                <th>Acciones</th>
            </tr>

        </thead>
        <tbody id="tabla"></tbody>

    </table>

    <hr />
    <button onclick="irUsuarios()">Usuarios</button>
    <button onclick="irTareas()">Tareas</button>

    <script>

        let listaProyectos = [];
        let proyectoSeleccionado = null;

        function listar() {
            $.ajax({
                url: "Proyectos.aspx/Listar",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (res) {

                    listaProyectos = res.d;

                    let html = "";
                    res.d.forEach(p => {
                        html += `<tr><td>${p.Nombre}</td><td>${p.Descripcion}</td><td>${formatearFecha(p.FechaInicio)}</td><td>${formatearFecha(p.FechaFin)}</td><td>${p.Estado}</td><td><button onclick="editar(${p.Id})">Editar</button><button onclick="eliminar(${p.Id})">Eliminar</button></td></tr>`;
                    });
                    $("#tabla").html(html);
                }
            });
        }

        function guardar() {
            let p = {
                Id: proyectoSeleccionado ? proyectoSeleccionado.Id : 0,
                Nombre: $("#txtNombre").val(),
                Descripcion: $("#txtDescripcion").val(),
                FechaInicio: $("#txtInicio").val(),
                FechaFin: $("#txtFin").val(),
                Estado: $("#ddlEstado").val()
            };

            if (!p.Nombre) {
                alert("Nombre requerido");
                return;
            }

            let url = proyectoSeleccionado ? "Proyectos.aspx/Actualizar" : "Proyectos.aspx/Guardar";

            $.ajax({
                url: url,
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ p: p }),
                success: function (res) {
                    alert(res.d);
                    limpiar();
                    listar();
                },

                error: function (err) {
                alert("Error AJAX");
            }
            });
        }

        function editar(id) {
            let p = listaProyectos.find(x => x.Id == id);

            proyectoSeleccionado = p;

            $("#txtNombre").val(p.Nombre);
            $("#txtDescripcion").val(p.Descripcion);
            $("#txtInicio").val(formatearFecha(p.FechaInicio, "input"));
            $("#txtFin").val(formatearFecha(p.FechaFin, "input"));
            $("#ddlEstado").val(p.Estado);
        }

        function eliminar(id) {

            if (!confirm("¿Eliminar proyecto?")) return;

            $.ajax({
                url: "Proyectos.aspx/Eliminar",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify({ id: id }),
                success: function (res) {

                    if (res.d === "RELACIONADO") {
                        alert("No se puede eliminar, tiene tareas asociadas");
                        return;
                    }

                    listar();
                }
            });
        }

        function limpiar() {
            $("input").val("");
            $("#ddlEstado").val("Activo");
            proyectoSeleccionado = null;
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

        function formatearFecha(fechaNet, tipo) {

            if (!tipo) tipo = "display";

            if (!fechaNet) return "";

            let fecha;

            if (fechaNet.includes("Date")) {
                let timestamp = parseInt(fechaNet.replace(/\/Date\((\d+)\)\//, '$1'));
                fecha = new Date(timestamp);
            } else {
                fecha = new Date(fechaNet);
            }

            let yyyy = fecha.getFullYear();
            let mm = String(fecha.getMonth() + 1).padStart(2, '0');
            let dd = String(fecha.getDate()).padStart(2, '0');

            if (tipo === "input") {
                return yyyy + "-" + mm + "-" + dd;
            }

            return dd + "/" + mm + "/" + yyyy;
        }

        function irUsuarios() {
            window.location.href = "Usuarios.aspx";
        }

        function irTareas() {
            window.location.href = "Tareas.aspx";
        }

        $(document).ready(function () {
            listar();
        });

    </script>

</body>
</html>
