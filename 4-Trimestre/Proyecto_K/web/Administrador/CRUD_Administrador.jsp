<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="controlador.eliminar_administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

    <link rel="shortcut icon" href="https://fotos.subefotos.com/9f07d19705d6bde4351c7e17c87c4d7fo.png">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
        integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="style.css">

    <title>
        Kuykeisho_Administrador
    </title>

<body>

        <style type="text/css">
            body{
              background: #eeeeee;
            }
              .form-inline {
                  display: inline-block;
              }
            .navbar-header.col {
              padding: 0 !important;
            }	
            .navbar {		
              background: #fff;
              padding-left: 16px;
              padding-right: 16px;
              border-bottom: 1px solid #d6d6d6;
              box-shadow: 0 0 4px rgba(0,0,0,.1);
            }
            .nav-link img {
              border-radius: 50%;
              width: 36px;
              height: 36px;
              margin: -8px 0;
              float: left;
              margin-right: 10px;
            }
            .navbar .navbar-brand {
              color: #555;
              padding-left: 0;
              padding-right: 50px;
              font-family: 'Merienda One', sans-serif;
            }
            .navbar .navbar-brand i {
              font-size: 20px;
              margin-right: 5px;
            }
            .search-box {
                  position: relative;
              }	
              .search-box input {
              box-shadow: none;
                  padding-right: 35px;
                  border-radius: 3px !important;
              }
            .search-box .input-group-addon {
                  min-width: 35px;
                  border: none;
                  background: transparent;
                  position: absolute;
                  right: 0;
                  z-index: 9;
                  padding: 7px;
              height: 100%;
              }
              .search-box i {
                  color: #a0a5b1;
              font-size: 19px;
              }
            .navbar .nav-item i {
              font-size: 18px;
            }
            .navbar .dropdown-item i {
              font-size: 16px;
              min-width: 22px;
            }
            .navbar .nav-item.open > a {
              background: none !important;
            }
            .navbar .dropdown-menu {
              border-radius: 1px;
              border-color: #e5e5e5;
              box-shadow: 0 2px 8px rgba(0,0,0,.05);
            }
            .navbar .dropdown-menu li a {
              color: #777;
              padding: 8px 20px;
              line-height: normal;
            }
            .navbar .dropdown-menu li a:hover, .navbar .dropdown-menu li a:active {
              color: #333;
            }	
            .navbar .dropdown-item .material-icons {
              font-size: 21px;
              line-height: 16px;
              vertical-align: middle;
              margin-top: -2px;
            }
            .navbar .badge {
              background: #f44336;
              font-size: 11px;
              border-radius: 20px;
              position: absolute;
              min-width: 10px;
              padding: 4px 6px 0;
              min-height: 18px;
              top: 5px;
            }
            .navbar ul.nav li a.notifications, .navbar ul.nav li a.messages {
              position: relative;
              margin-right: 10px;
            }
            .navbar ul.nav li a.messages {
              margin-right: 20px;
            }
            .navbar a.notifications .badge {
              margin-left: -8px;
            }
            .navbar a.messages .badge {
              margin-left: -4px;
            }	
            .navbar .active a, .navbar .active a:hover, .navbar .active a:focus {
              background: transparent !important;
            }
            @media (min-width: 1200px){
              .form-inline .input-group {
                width: 300px;
                margin-left: 30px;
              }
            }
            @media (max-width: 1199px){
              .form-inline {
                display: block;
                margin-bottom: 10px;
              }
              .input-group {
                width: 100%;
              }
            }
          </style>
          </head> 
          <body>
          <nav class="navbar navbar-default navbar-expand-xl navbar-dark bg-dark">
            <div class="navbar-header d-flex col">
                <a href="../../index.html">
                    <img width="380" height="70" src="https://fotos.subefotos.com/105fb41d255ed1489a748b723f448441o.png" class="img-fluid" alt="Responsive image">
                    </a>            
             <button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle navbar-toggler ml-auto">
                <span class="navbar-toggler-icon"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
            </div>
            <div id="navbarCollapse" class="collapse navbar-collapse justify-content-start">
              <ul class="nav navbar-nav">
                <li class="nav-item active"><a href="../Inicio_Administrador.jsp" class="nav-link">Página de administración</a></li>
                <li class="nav-item"><a href="#" class="nav-link">Ayuda</a></li>
                </li>
              </ul>
              <form class="navbar-form form-inline">
                <div class="input-group search-box">								
                  <input type="text" id="search" class="form-control" placeholder="Buscar">
                  <span class="input-group-addon"><i class="fa fa-search" aria-hidden="true"></i></span>
                </div>
              </form>
              <ul class="nav navbar-nav navbar-right ml-auto">
                <li class="nav-item"><a href="#" class="nav-link notifications"><i class="fa fa-bell-o"></i><span class="badge">10</span></a></li>
                <li class="nav-item"><a href="#" class="nav-link messages"><i class="fa fa-envelope-o"></i><span class="badge">100</span></a></li>
                <li class="nav-item dropdown" >
                  <a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle user-action"><img src="https://miro.medium.com/max/1024/1*Age2mlAUaGBPNWcLvQPEUA.jpeg" class="avatar" alt="Avatar"> Andres Olaya <b class="caret"></b></a>
                  <ul class="dropdown-menu" style="background-color: #343a40">
                    <li><a href="../Perfil_Administrador.html" style="color: rgb(255, 255, 255)" class="dropdown-item"><i class="fa fa-user-o"></i> Perfil</a></li>
                    <li class="divider dropdown-divider"></li>
                    <li><a href="../../index.html" style="color: rgb(255, 255, 255)" class="dropdown-item"><i class="material-icons"></i> Cerrar Sesión</a></li>
                  </ul>
                </li>
              </ul>
            </div>
          </nav>
          <br>
    <center>
        <div class="btn-group">
            <button type="button" class="btn btn-outline-info dropdown-toggle" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                Productos
            </button>
            <div class="dropdown-menu">
                    <a class="dropdown-item" href="Crud_Productos_No_Tan_Vendidos.jsp">Productos No Tan Vendidos</a>
                  </div>
                </div>
                <div class="btn-group">
                      <button type="button" class="btn btn-outline-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Juegos
                      </button>
                      <div class="dropdown-menu">
                        <a class="dropdown-item" href="Juegos/Juegos_Mas_Pedidos.jsp">Juegos Mas Pedidos</a>
                        <a class="dropdown-item" href="Juegos/Crud_Juegos_No_Tan_Pedidos.jsp">Juegos No Tan Pedidos</a>
                        <a class="dropdown-item" href="Juegos/Todos_Juegos_1.jsp">Todos los juegos</a>
                      </div>
                    </div>
                    <div class="btn-group">
                          <button type="button" class="btn btn-outline-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Consolas
                          </button>
                          <div class="dropdown-menu">
                            <a class="dropdown-item" href="Consolas/Consolas.jsp">Consolas</a>
                            <a class="dropdown-item" href="Consolas/Crud_Consolas_Mas_Pedidas.jsp">Consolas Mas Pedidas</a>
                            <a class="dropdown-item" href="Consolas/Crud_Consolas_Poco_Pedidas.jsp">Consolas No Tan Pedidas</a>
                        </div>
                      </div>
                        <div class="btn-group">
                              <button type="button" class="btn btn-outline-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Citas
                              </button>
                              <div class="dropdown-menu">
                                <a class="dropdown-item" href="../CRUD Citas/Crud_Citas_Activas.jsp">Citas Activas</a>
                                <a class="dropdown-item" href="../CRUD Citas/Crud_Citas_Inactivas.jsp">Citas Inactivas</a>
                              </div>
                            </div>
                                  <a href="../CRUD Clientes/Clientes_Registrados.jsp"><button type="button" class="btn btn-outline-info">Clientes Registrados</button></a>

                                  <a href="../CRUD Categorias/Categorias_1.jsp"><button type="button" class="btn btn-outline-info">Categorias</button></a>
                      </div>
    </center>
    <br>

    <center>
        <h3>Administrador</h3>
    </center>
    <br>
    <br>


    <style type="text/css">
        body {
            color: #566787;
            background: #f5f5f5;
            font-family: 'Varela Round', sans-serif;
            font-size: 13px;
        }

        .table-wrapper {
            background: #fff;
            padding: 20px 25px;
            margin: 30px 0;
            border-radius: 3px;
            box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
        }

        .table-title {
            padding-bottom: 15px;
            background: #435d7d;
            color: #fff;
            padding: 16px 30px;
            margin: -20px -25px 10px;
            border-radius: 3px 3px 0 0;
        }

        .table-title h2 {
            margin: 5px 0 0;
            font-size: 24px;
        }

        .table-title .btn-group {
            float: right;
        }

        .table-title .btn {
            color: #fff;
            float: right;
            font-size: 13px;
            border: none;
            min-width: 50px;
            border-radius: 2px;
            border: none;
            outline: none !important;
            margin-left: 10px;
        }

        .table-title .btn i {
            float: left;
            font-size: 21px;
            margin-right: 5px;
        }

        .table-title .btn span {
            float: left;
            margin-top: 2px;
        }

        table.table tr th,
        table.table tr td {
            border-color: #e9e9e9;
            padding: 12px 15px;
            vertical-align: middle;
        }

        table.table tr th:first-child {
            width: 60px;
        }

        table.table tr th:last-child {
            width: 100px;
        }

        table.table-striped tbody tr:nth-of-type(odd) {
            background-color: #fcfcfc;
        }

        table.table-striped.table-hover tbody tr:hover {
            background: #f5f5f5;
        }

        table.table th i {
            font-size: 13px;
            margin: 0 5px;
            cursor: pointer;
        }

        table.table td:last-child i {
            opacity: 0.9;
            font-size: 22px;
            margin: 0 5px;
        }

        table.table td a {
            font-weight: bold;
            color: #566787;
            display: inline-block;
            text-decoration: none;
            outline: none !important;
        }

        table.table td a:hover {
            color: #2196F3;
        }

        table.table td a.edit {
            color: #FFC107;
        }

        table.table td a.delete {
            color: #F44336;
        }

        table.table td i {
            font-size: 19px;
        }

        table.table .avatar {
            border-radius: 50%;
            vertical-align: middle;
            margin-right: 10px;
        }

        .pagination {
            float: right;
            margin: 0 0 5px;
        }

        .pagination li a {
            border: none;
            font-size: 13px;
            min-width: 30px;
            min-height: 30px;
            color: #999;
            margin: 0 2px;
            line-height: 30px;
            border-radius: 2px !important;
            text-align: center;
            padding: 0 6px;
        }

        .pagination li a:hover {
            color: #666;
        }

        .pagination li.active a,
        .pagination li.active a.page-link {
            background: #03A9F4;
        }

        .pagination li.active a:hover {
            background: #0397d6;
        }

        .pagination li.disabled i {
            color: #ccc;
        }

        .pagination li i {
            font-size: 16px;
            padding-top: 6px
        }

        .hint-text {
            float: left;
            margin-top: 10px;
            font-size: 13px;
        }

        /* Custom checkbox */
        .custom-checkbox {
            position: relative;
        }

        .custom-checkbox input[type="checkbox"] {
            opacity: 0;
            position: absolute;
            margin: 5px 0 0 3px;
            z-index: 9;
        }

        .custom-checkbox label:before {
            width: 18px;
            height: 18px;
        }

        .custom-checkbox label:before {
            content: '';
            margin-right: 10px;
            display: inline-block;
            vertical-align: text-top;
            background: white;
            border: 1px solid #bbb;
            border-radius: 2px;
            box-sizing: border-box;
            z-index: 2;
        }

        .custom-checkbox input[type="checkbox"]:checked+label:after {
            content: '';
            position: absolute;
            left: 6px;
            top: 3px;
            width: 6px;
            height: 11px;
            border: solid #000;
            border-width: 0 3px 3px 0;
            transform: inherit;
            z-index: 3;
            transform: rotateZ(45deg);
        }

        .custom-checkbox input[type="checkbox"]:checked+label:before {
            border-color: #03A9F4;
            background: #03A9F4;
        }

        .custom-checkbox input[type="checkbox"]:checked+label:after {
            border-color: #fff;
        }

        .custom-checkbox input[type="checkbox"]:disabled+label:before {
            color: #b8b8b8;
            cursor: auto;
            box-shadow: none;
            background: #ddd;
        }

        /* Modal styles */
        .modal .modal-dialog {
            max-width: 400px;
        }

        .modal .modal-header,
        .modal .modal-body,
        .modal .modal-footer {
            padding: 20px 30px;
        }

        .modal .modal-content {
            border-radius: 3px;
        }

        .modal .modal-footer {
            background: #ecf0f1;
            border-radius: 0 0 3px 3px;
        }

        .modal .modal-title {
            display: inline-block;
        }

        .modal .form-control {
            border-radius: 2px;
            box-shadow: none;
            border-color: #dddddd;
        }

        .modal textarea.form-control {
            resize: vertical;
        }

        .modal .btn {
            border-radius: 2px;
            min-width: 100px;
        }

        .modal form label {
            font-weight: normal;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            // Activate tooltip
            $('[data-toggle="tooltip"]').tooltip();

            // Select/Deselect checkboxes
            var checkbox = $('table tbody input[type="checkbox"]');
            $("#selectAll").click(function () {
                if (this.checked) {
                    checkbox.each(function () {
                        this.checked = true;
                    });
                } else {
                    checkbox.each(function () {
                        this.checked = false;
                    });
                }
            });
            checkbox.click(function () {
                if (!this.checked) {
                    $("#selectAll").prop("checked", false);
                }
            });
        });
    </script>
    </head>
    
<c:remove var="message" scope="session" /> 

         <center>
             <div class="container" >
                 <div class="row" >
                     <table class="table table-striped table-hover text-center "  width="1000" align="center">
                         <thead>
                         <tr bgcolor="#088A68">
                             <th align="center" colspan="5"><h2 style="text-align:left" text="left">Administrador</h2>
                         <th align="right" colspan="5" style="text-align:right">                 
                            <a  href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i
                                    class="material-icons"><i class="fa fa-trash" aria-hidden="true"></i>
                                </i><span>Eliminar Administrador</span></a>
                         </th>
                         <th align="right" colspan="5">  
                             <a href="registrar_administrador.jsp" class="btn btn-success" >
                                 <i class="fa fa-plus-circle" aria-hidden="true"></i>
                                </i><span>Registrar Administrador</span></a>
                         </th>
                     </th>
            </tr>
            
                     </table>
                     </div>
                 </div>
        <div class="container" >
            <div class="row" >
                <div class="container" style="background-color:#FFFFFF">
        <table class="table table-striped table-hover text-center "  width="1000">
            <thead>
            <tr bgcolor="#04B486">
                    <th>
                        <span class="custom-checkbox">
                            <input type="checkbox" id="selectAll">
                            <label for="selectAll"></label>
                        </span>
                     </th>
                <th  colspan="1">Id Administrador</th><th colspan="3">Primer Nombre</th>
                <th colspan="3">Segundo Nombre</th><th colspan="3">Primer Apellido</th>
                <th colspan="3">Segundo Apellido</th><th colspan="3">Correo</th>
                <th colspan="3">Telefono</th><th colspan="3">Contraseña</th>
                <th colspan="2">Editar</th><th colspan="2">Eliminar</th>
            </tr>
            </thead>
            <%
            Connection conn = null;
            Statement sta = null;
            ResultSet rs = null;    
              
            try{
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3310/Kyukeisho?user=root&password=");
            
            sta = conn.createStatement();
            rs = sta.executeQuery("select id_administrador, primer_nombre_administrador, segundo_nombre_administrador, primer_apellido_administrador, segundo_apellido_administrador, correo_administrador, telefono_administrador, contraseña_administrador"
                    +" from administrador");
            
            while(rs.next()){
                %>
                <tr>
                    <th>
                        <span class="custom-checkbox">
                            <input type="checkbox" id="selectAll">
                            <label for="selectAll"></label>
                        </span>
                     </th>
                    <th colspan="1"> <%=rs.getString(1)%></th>
                    <th colspan="3" style="text-align:left"> <%=rs.getString(2)%></th>
                    <th colspan="3"><%=rs.getString(3)%></th>
                    <th colspan="3"><%=rs.getString(4)%></th>
                    <th colspan="3"><%=rs.getString(5)%></th>
                    <th colspan="3"><%=rs.getString(6)%></th>
                    <th colspan="3"><%=rs.getString(7)%></th>
                    <th colspan="3"><%=rs.getString(8)%></th>
                    <th colspan="3">
                        <a href="editar_administrador.jsp?cod=<%=rs.getString(1)%>">
                        <img src="../../IMG/editar.png" width="25"/>
                        </a>
                    </th>
                    
                    <th colspan="2">
                        <a href="eliminar_administrador?cod=<%=rs.getString(1)%>">
                          <img src="../../IMG/eliminar.png" width="25"/>
                        </a>                        
                    </th>
                    
                </tr>     
                
                <%
            }
        sta.close();
        rs.close();
        conn.close();
            }catch(Exception e){
                
            }
             %>   
        </table>
        </div>
        </div>
        </div>
                     <div class="container" >
                 <div class="row" >
                     <table class="table table-striped table-hover text-center "  width="1000" align="center">
                         <thead>
                         <tr bgcolor="#088A68">
                             <th align="center" colspan="5">
                        <div class="clearfix">
                    <div class="hint-text">Mostrando 5 de 5 entradas</div>
                    <ul class="pagination">
                        <li class="page-item active"><a href="#" class="page-link">1</a></li>
                        <li class="page-item"><a href="#" class="page-link">2</a></li>
                        <li class="page-item"><a href="#" class="page-link">3</a></li>
                        <li class="page-item"><a href="#" class="page-link">4</a></li>
                        <li class="page-item"><a href="#" class="page-link">5</a></li>
                        <li class="page-item"><a href="#" class="page-link">Siguiente</a></li>
                    </ul>
                </div>
                     </th>
            </tr>
            
                     </table>
        <br>
        </center>
       
                
        <div class="copyright text-center  font-weight-bold p-2" style="background-color:#343a40">
            <p style="color:rgb(255, 217, 0)">Desarrollado por Kyukeisho Copyright<i class="fa fa-copyright"
                    aria-hidden="true"></i> 2019</p>

            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
                crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
                integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
                crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
                integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
                crossorigin="anonymous"></script>
    </body>

    </head>

</html>