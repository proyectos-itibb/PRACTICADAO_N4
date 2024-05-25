<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="com.emergentes.modelo.Aviso"%>
<%
    List<Aviso> avisos = (List<Aviso>) request.getAttribute("avisos");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>LISTADO DE SEMINARIOS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            padding: 20px;
        }
        .container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
        }
        .container h1 {
            color: #007BFF;
        }
        .container p {
            color: #555;
        }
        .container .date {
            color: #999;
            font-size: 0.9em;
        }
        .container hr {
            border-top: 1px solid #ccc;
        }
        .btn-success, .btn-primary, .btn-danger {
            margin-top: 10px;
        }
        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }
        .btn-success:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }
        .btn-primary {
            background-color: #007BFF;
            border-color: #007BFF;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }
        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }
        .btn-danger:hover {
            background-color: #c82333;
            border-color: #bd2130;
        }
        .action {
            text-align: right;
        }
    </style>
</head>
<body>

<div class="container text-center">
    <h1>BLOG DE TECNOLOGÍA</h1>
    <p><i>Autor: Daniela Tereza Huanca Ramirez</i></p>
    <p><a class="btn btn-success" href="AvisoController?action=add">Nueva Entrada</a></p>
</div>

<c:forEach var="item" items="${avisos}">
    <div class="container">
        <article>
            <h2>${item.titulo}</h2>
            <p class="date">Fecha: ${item.fecha}</p>
            <p>${item.contenido}</p>
            <div class="action">
                <a class="btn btn-primary" href="AvisoController?action=edit&id=${item.id}">Editar</a>
                <a class="btn btn-danger" href="AvisoController?action=delete&id=${item.id}">Eliminar</a>
            </div>
            <hr>
        </article>
    </div>
</c:forEach>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>