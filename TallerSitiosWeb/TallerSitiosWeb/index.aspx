<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="TallerSitiosWeb.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Grupo 4 - Portfolio</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            background-color: #f1f1f1;
            padding: 20px;
            font-family: Arial;
        }

        /* Center website */
        .main {
            max-width: 1000px;
            margin: auto;
        }

        h1 {
            font-size: 50px;
            word-break: break-all;
        }

        .row {
            margin: 10px -16px;
        }

        /* Add padding BETWEEN each column */
        .row,
        .row > .column {
            padding: 8px;
        }

        /* Create three equal columns that float next to each other */
        .column {
            float: left;
            width: 33.33%;
            display: none; /* Hide all elements by default */
        }

        /* Clear floats after rows */
        .row:after {
            content: "";
            display: table;
            clear: both;
        }

        /* Content */
        .content {
            background-color: white;
            padding: 10px;
        }

        /* The "show" class is added to the filtered elements */
        .show {
            display: block;
        }

        /* Style the buttons */
        .btn {
            border: none;
            outline: none;
            padding: 12px 16px;
            background-color: white;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #ddd;
        }

        .btn.active {
            background-color: #666;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- MAIN (Center website) -->
        <div class="main">
            <h1>MYLOGO.COM</h1>
            <hr>
            <h2>PORTFOLIO</h2>
            <div id="myBtnContainer">
                <asp:Button runat="server" CssClass="btn active" OnClientClick="filterSelection('all'); return false;" Text="Show all" />
                <asp:Button runat="server" CssClass="btn" OnClientClick="filterSelection('barcos'); return false;" Text="Barcos" />
                <asp:Button runat="server" CssClass="btn" OnClientClick="filterSelection('motocicletas'); return false;" Text="Motocicletas" />
                <asp:Button runat="server" CssClass="btn" OnClientClick="filterSelection('automoviles'); return false;" Text="Automoviles" />
            </div>

            <!-- Portfolio Gallery Grid -->
<div class="row">
    <asp:Repeater ID="rptImagenes" runat="server">
        <ItemTemplate>
            <div class="column <%# Eval("Categoria") %>">
                <div class="content">
                    <div style="height: 300px; overflow: hidden;">
                        <asp:Image ID="imgImage" runat="server" ImageUrl='<%# Eval("URL") %>' AlternateText='<%# Eval("Descripcion") %>' style="width:100%; height:100%" />
                    </div>
                    <h4><%# Eval("Categoria") %></h4>
                    <p><%# Eval("Descripcion") %></p>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
   </div>
    </form>
    <script>
        filterSelection("all");
        function filterSelection(categoria) {
            var x, i;
            x = document.getElementsByClassName("column");
            if (categoria == "all") {
                for (i = 0; i < x.length; i++) {
                    x[i].classList.add("show");
                }
            } else {
                for (i = 0; i < x.length; i++) {
                    x[i].classList.remove("show");
                    if (x[i].classList.contains(categoria)) {
                        x[i].classList.add("show");
                    }
                }
            }
        }

        function w3AddClass(element, name) {
            var i, arr1, arr2;
            arr1 = element.className.split(" ");
            arr2 = name.split(" ");
            for (i = 0; i < arr2.length; i++) {
                if (arr1.indexOf(arr2[i]) == -1) { element.className += " " + arr2[i]; }
            }
        }

        function w3RemoveClass(element, name) {
            var i, arr1, arr2;
            arr1 = element.className.split(" ");
            arr2 = name.split(" ");
            for (i = 0; i < arr2.length; i++) {
                while (arr1.indexOf(arr2[i]) > -1) {
                    arr1.splice(arr1.indexOf(arr2[i]), 1);
                }
            }
            element.className = arr1.join(" ");
        }

        // Add active class to the current button (highlight it)
        var btnContainer = document.getElementById("myBtnContainer");
        var btns = btnContainer.getElementsByClassName("btn");
        for (var i = 0; i < btns.length; i++) {
            btns[i].addEventListener("click", function () {
                var current = document.getElementsByClassName("active");
                current[0].className = current[0].className.replace(" active", "");
                this.className += " active";
            });
        }
    </script>
</body>
</html>
