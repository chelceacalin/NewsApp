<%-- 
    Document   : newjsp
    Created on : Feb 15, 2022, 5:08:59 PM
    Author     : oracle
--%>



<%@page import="java.util.ArrayList"%>
<%@page import="entities.Stire"%>
<%@ page import = "org.json.simple.JSONObject" %>
<%@ page import = "org.json.simple.parser.JSONParser" %>
<%@ page import = "org.json.simple.parser.*" %>
<%@page import="java.io.FileReader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%
    
    JSONParser jsonParser = new JSONParser();
    JSONObject jsonObject = (JSONObject) jsonParser.parse(new FileReader("/home/oracle/WebApplication3_COPY/web/newjson.json"));
    
     String User = (String) jsonObject.get("username");
     String Pass = (String) jsonObject.get("password");
     String Driver = (String) jsonObject.get("driverNume");
     String Drive = (String) jsonObject.get("driver");
     Class.forName(Driver);
     Connection conn = DriverManager.getConnection(Drive, User, Pass);

 
     //PreparedStatement ps = conn.prepareStatement("SELECT * FROM stiri ORDER BY id_stire");
     PreparedStatement ps1 = conn.prepareStatement("SELECT COUNT(*) FROM autori");
     
     //ResultSet result = ps.executeQuery();
        
     
              
             
             
             
     
     
    
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <title>News</title>
        <link rel="stylesheet" href="./css/utils.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
    <body>
        
     
        <nav class="navbar navbar-expand-lg navbar-dark bg-main p-3">
            <a class="navbar-brand" href="#">OAC Echipa 1</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
              <ul class="navbar-nav">
                  <li class="nav-item">
                      
                    <a class="nav-link" href="login.jsp">Home <span class="sr-only">(current)</span></a>
                    
                  </li>
                  
                <li class="nav-item active">
                  <a class="nav-link" href="#">News <span class="sr-only">(current)</span></a>
                </li>
                
                
                
                
          
                
                
                 <li class="nav-item mx-5">
                  <a class="nav-link text-warning" href="#">
                      
                      <%
                        
                        if(session.getAttribute("tipCont") == null)
                            out.println("<strong>Vizitator</strong>");
                         
                        
                        if(session.getAttribute("tipCont") == "utilizator") 
                        {
                            
                            String emailCurent = (String)session.getAttribute("email");
                            
                            String sql = "SELECT * FROM utilizatori WHERE email = " + " '"+emailCurent+"'  ";
                            
                            PreparedStatement findUtilizator = conn.prepareStatement(sql);
                            
                           
                            ResultSet findUtilizatorRESULT = findUtilizator.executeQuery();
                            findUtilizatorRESULT.next();
                            
                            out.println("<strong>" + findUtilizatorRESULT.getString("nume") + " " + findUtilizatorRESULT.getString("prenume") + " - " + session.getAttribute("tipCont") + "</strong>");
                        }
                        
                        if(session.getAttribute("tipCont") == "autor") 
                        {
                            
                            String emailCurent = (String)session.getAttribute("email");
                            
                            String sql = "SELECT * FROM autori WHERE email = " + " '"+emailCurent+"'  ";
                            
                            PreparedStatement findAutor = conn.prepareStatement(sql);
                            
                           
                            ResultSet findAutorRESULT = findAutor.executeQuery();
                            findAutorRESULT.next();
                            
                            out.println("<strong>" + findAutorRESULT.getString("nume") + " " + findAutorRESULT.getString("prenume") + " - " + session.getAttribute("tipCont") + "</strong>");
                        }
                        
                        
                        
                            

                      %>
                      
                      <span class="sr-only">(current)</span></a>
                </li>
                
                
                <% if(session.getAttribute("tipCont") != null){ %>
                 <li class="nav-item mx-3">
                  <a class="nav-link" href="logout.jsp">Logout <span class="sr-only">(current)</span></a>
                </li>
                <% } %>
              </ul>
            </div>
       </nav>
        
        
                <% if(session.getAttribute("tipCont") == "autor") { %>
              <div class="container mt-5 text-center">
                  <a href="adauga_stire.jsp" class="btn bg-main text-white w-50">Adauga stire noua</a>
              </div>       
              
              <% } %>
              
         
        
              
        <div class="container mt-5 text-center">
            <input type="text" class="form-control w-50" id="myInput" placeholder="Cauta stire...">
            
            <table class="table mt-3">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Nume stire</th>
                    <th scope="col">Data postarii</th>
                    <th scope="col">Categorie</th>
                    <th scope="col">Actiuni</th>
                  </tr>
                </thead>
                <tbody id="myTable">
                 
                     
                    <jsp:useBean id="obj" class="entities.JavaBean"/>
                    <%
     
     
                /*
                    while(result.next())
                    {
                        int id = result.getInt("id_stire");
                        String numeStire = result.getString("nume_stire");
                        Date data = result.getDate("data_postarii");
                        int idCategorie = result.getInt("id_categorie");
                        
                        PreparedStatement numeCategorie = conn.prepareStatement("SELECT nume_categorie FROM categorii WHERE id_categorie = " + idCategorie);
                        ResultSet numeCategorieRESULT = numeCategorie.executeQuery();
                        
                        numeCategorieRESULT.next();
                        
                        
                        
                        out.println(
                                    "<tr>" + 
                                    "<th>" + id + "</th>" +
                                    "<th>" + numeStire + "</th>" + 
                                    "<th>" + data + "</th>" +
                                    "<th>" + numeCategorieRESULT.getString(1) + "</th>" +
                                    "<th><a href=\"vezistiri.jsp?id= "+ id +"\"><button class=\"btn bg-main text-white\">Vizualizare</button></a></th>" +
                                     "</tr>"       
                                     
                                    
                        );
                        */
                
                
       
            
           
                            
           
                            
            
                        ArrayList<Stire> stiri = obj.getStiri();
                        
                        for(Stire s : stiri){
       
                        PreparedStatement numeCategorie = conn.prepareStatement("SELECT nume_categorie FROM categorii WHERE id_categorie = " + s.getIDCategorie());
                        ResultSet numeCategorieRESULT = numeCategorie.executeQuery();
                        
                        numeCategorieRESULT.next();
                            
                            
                            out.println(
                                    "<tr>" + 
                                    "<th>" + s.getID() + "</th>" +
                                    "<th>" + s.getNume() + "</th>" + 
                                    "<th>" + s.getDate() + "</th>" +
                                    "<th>" + numeCategorieRESULT.getString(1) + "</th>" +
                                    "<th><a href=\"vezistiri.jsp?id= "+ s.getID() +"\"><button class=\"btn bg-main text-white\">Vizualizare</button></a></th>" +
                                     "</tr>"       
                                     
                            );
                   
                        
                     
                        
                        }
                        
                            
                        
                        
                        
                        
                        
                        


                    

                     %>
                    
                </tbody>
            </table>
        </div>
                     
         <script>
            $(document).ready(function(){
              $("#myInput").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("#myTable tr").filter(function() {
                  $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
                });
              });
            });
        </script>
    </body>
</html>



    