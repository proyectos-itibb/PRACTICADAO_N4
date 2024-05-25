<%@page import="java.text.SimpleDateFormat"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.emergentes.modelo.Aviso"%>
<%
    Aviso aviso = (Aviso) request.getAttribute("aviso");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nueva Entrada</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
  
     <style>
        .datos {
            max-width: 400px;
            margin: 0 auto;
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #f9f9f9;
            font-family: Arial, sans-serif;
        }
        .datos p {
            margin: 10px 0;
            color: #333;
        }
        .datos p:first-child {
            font-weight: bold;
            font-size: 1.2em;
            text-align: center;
            color: #007BFF;
        }
        .datos p i {
            font-style: normal;
            font-weight: bold;
            color: #555;
        }
       
        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 100%;
        }
        .container h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
            font-size: 1.5em;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }
        .form-group input[type="date"],
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .form-group textarea {
            resize: vertical;
            height: 100px;
        }
        .action {
            text-align: right;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            margin: 5px 0;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-size: 1em;
        }
        .btn-primary {
            background-color: #007BFF;
            color: #fff;
        }
        .btn-success {
            background-color: #28a745;
            color: #fff;
        }
        .btn-primary:hover, .btn-success:hover {
            opacity: 0.8;
        }
    </style>
    <body>
        <div class="datos">
        <p>PRACTICA N° 4 TEM-742</p>
        <p>NOMBRE: <i>Daniela Tereza Huanca Ramirez</i></p>
        <p>CARNET: 9169630 LP</p>
    </div>
        <br> <br>
      <div class="container">
        <h1>NUEVA ENTRADA</h1>
        <form action="AvisoController" method="post">
            <input type="hidden" name="id" value="${aviso.id}" />
            <div class="form-group">
                <label>Fecha</label>
                <input type="date" id="fecha" name="fecha" value="${aviso.fecha}" required>
            </div>

            <div class="form-group">
                <label>Titulo</label>
                <textarea name="titulo" class="form-control">${aviso.titulo}</textarea>
            </div>
            <div class="form-group">
                <label>Contenido</label>
                <textarea name="contenido" class="form-control">${aviso.contenido}</textarea>
            </div>

            <div class="action">
                <input type="submit" class="btn btn-primary" value="Enviar" />
                <input type="submit" class="btn btn-success"  value="volver" onclick="index.jsp"  />
            </div>
        </form>
    </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>                    
    </body>
</html>
