<%-- 
    Document   : Sidebar
    Created on : Oct 13, 2023, 2:09:43 AM
    Author     : doant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <style>
            ul{
                list-style-type: none;
            }
            /* Apply basic styles to the entire page */
            html, body {
                height: 100%;
                margin: 0;
                padding: 0;
            }

            /* Create a container to hold the sidebar and main content */
            .sidebar-container {
                display: flex;
                flex-direction: column;
                justify-content: flex-start;
                height: 100%;
            }

            /* Define the sidebar */
            .sidebar {
                overflow: hidden;
                width: 15%;
                background-color: #333; /* Set your desired background color */
                color: #fff; /* Set your desired text color */
                padding: 20px; /* Add padding for content inside the sidebar */
                box-sizing: border-box; /* Include padding in the width */
            }

            /* Define the main content */
            .content {
                flex: 1;
                padding: 20px; /* Add padding for content inside the main area */
                box-sizing: border-box; /* Include padding in the width */
            }
            .management-list{
                padding: 0;
            }
            .management-list li{
                padding: 10px 2px;
                margin: 10px 0;
                border-radius: 5px;
                /*background-color: aliceblue;*/
            }
            .management-list li:hover{
                opacity: 0.9;
                cursor: pointer;
                background-color: #666666;
            }
            .manage-active{
                background-color: #999999;
            }
            a{
                text-decoration: none;
                color:white;
            }
        </style>
    </head>
    <body>

        <div class="sidebar-container">
            <a href="MainController?action=Shop"><h4>Rubik shop</h4></a>
            <!-- Main content goes here -->
            <ul class="management-list">
                <li class="manage-active"><a href="AdminMainController?action=User">User management</a></li>
            </ul>

        </div>
        <!-- Component End  -->
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

    </body>
</html>
