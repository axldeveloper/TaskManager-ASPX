<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TaskManager.Web.Pages.Login" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>

        <script src="../Scripts/jquery-3.6.0.min.js"></script>
    </head>
    <body>
        <h2>Login</h2>
        <input type="text" id="txtUser" placeholder="Usuario" />
        <input type="password" id="txtPass" placeholder="Contraseña" />
        <button onclick="login()">Ingresar</button>
    <script>
        function login() {
            var user = $("#txtUser").val();
            var pass = $("#txtPass").val();

            $.ajax({
                url: "Login.aspx/ValidarLogin",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ user: user, pass: pass }),

                success: function (res) {
                    if (res.d === "OK") {
                        window.location.href = "Home.aspx";
                    } else {
                        alert("Credenciales incorrectas");
                    }
                }
            });
        }

    </script>
    </body>
</html>
