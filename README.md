# Aplicacion Web Task Manager

## 📌 Descripción

Aplicacion web desarrollada en ASP.NET WebForms con C# y SQL Server, que permite la gestion de proyectos, tareas y usuarios. Incluye asignacion de tareas y sistema de comentarios para colaboracion entre usuarios.

## 🏗 Arquitectura

El sistema esta construido bajo una arquitectura en capas:

* **Capa de Presentacion**: ASPX + JavaScript (jQuery)
* **Capa de Logica de Negocio (BLL)**: Reglas de negocio
* **Capa de Acceso a Datos (DAL)**: Acceso a datos con ADO.NET
* **Entidades**: Modelos del sistema

## 🗄 Base de Datos

Incluye las siguientes tablas:

* Usuarios
* Proyectos
* Tareas
* Comentarios
* Catalogos: Genero, EstadoCivil, Rol

### 👤 Usuarios

* Crear, editar, eliminar y listar usuarios
* Uso de catalogos dinamicos (genero, estado civil, rol)

### 📁 Proyectos

* CRUD completo de proyectos
* Gestion de estado (Activo, En proceso, Finalizado)

### ✅ Tareas

* Creacion y asignacion a usuarios
* Asociacion con proyectos
* Edicion y eliminacion
* Visualizacion con JOIN (Proyecto + Usuario)

### 💬 Comentarios

* Comentarios por tarea
* Historial de conversacion
* Asociacion automatica al usuario logueado

### 🔐 Autenticacion

* Inicio de sesion con sesion activa
* Uso de Session para control de acceso

## 🧪 Tecnologias

* ASP.NET WebForms (.NET Framework)
* C#
* SQL Server
* ADO.NET
* jQuery / JavaScript

## ⚙️ Ejecucion

1. Restaurar base de datos en SQL Server
2. El script de creacion de la base de datos se encuentra en la carpeta `DataBase/` del proyecto (archivo `Scripts.sql`).
3. Configurar cadena de conexión en Web.config
4. Ejecutar proyecto desde Visual Studio
5. Acceder con usuario registrado (usuario: admin y password: admin123)

## 📌 Notas

* No se utilizaron controles ASP.NET avanzados (según requerimiento)
* Interfaz desarrollada con HTML + JavaScript
* Comunicación vía AJAX

## 🚀 Mejoras futuras

* Implementar ReportViewer funcional
* Agregar paginación y filtros avanzados
* Manejo de roles y permisos
* UI más moderna (Bootstrap)

---

Desarrollado como prueba tecnica para evaluacion de habilidades en desarrollo web.
