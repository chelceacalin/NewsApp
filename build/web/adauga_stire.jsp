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

%>




<!DOCTYPE html>

    <head>
        <title>OAC Echipa 1</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/utils.css">
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
                      
                    <a class="nav-link" href="index.html">Home <span class="sr-only">(current)</span></a>
                    
                  </li>
                  
                <li class="nav-item">
                  <a class="nav-link" href="news.jsp">News <span class="sr-only">(current)</span></a>
                </li>
                
                <li class="nav-item active">
                  <a class="nav-link" href="#">Adauga stire <span class="sr-only">(current)</span></a>
                </li>
                
                 <li class="nav-item mx-5">
                  <a class="nav-link text-warning" href="#">
                      
                      <%
                        
                        if(session.getAttribute("tipCont") == null || session.getAttribute("tipCont") == "utilizator")
                            response.sendRedirect("login_autor.jsp");
                         
                        
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
                
                
                <% if(session.getAttribute("tipCont") == "autor"){ %>
                 <li class="nav-item mx-3">
                  <a class="nav-link" href="logout.jsp">Logout <span class="sr-only">(current)</span></a>
                </li>
                <% } %>
              </ul>
            </div>
       </nav>
        
              
              
              <div class="container mt-5">
                  
                  <p class="h3 my-5 text-center">Adauga stire</p>
                  
                  <form action="adauga_stire.jsp" method="post">
                        <div class="form-group">
                          
                          <input name="titlu" type="text" class="form-control" id="exampleFormControlInput1" placeholder="Titlu stire" required>
                        </div>
                        <div class="form-group">
                          <label for="exampleFormControlSelect1">Selecteaza categoria</label>
                          <select name="categorie" class="form-control" id="exampleFormControlSelect1">
                              
                              <%
                
                                PreparedStatement numeCategorii = conn.prepareStatement("SELECT nume_categorie FROM categorii WHERE stare_categorie = 1");
                                ResultSet numeCategoriiRESULT = numeCategorii.executeQuery();
                                
                                while(numeCategoriiRESULT.next())
                                {
                                    out.println("<option>" + numeCategoriiRESULT.getString("nume_categorie") + "</option>");
                                }
                
                
                             %>
                             
                          </select>
                        </div>
                        
                        <div class="form-group">
                          
                            <textarea name="continut" class="form-control" id="exampleFormControlTextarea1" rows="5" cols="20" placeholder="Continut stire" required></textarea>
                        </div>
                          
                         <div class="form-group">
                          
                          <input name="url" type="text" class="form-control" id="exampleFormControlInput1" placeholder="URL imagine">
                        </div>
                          
                        <div class="text-center mt-5">
                            <button type="submit" name = "submit" class="btn bg-main text-white mx-auto w-50">Posteaza stire</button>
                        </div>
                 </form>
                  
          </div>
        
    </body>
</html>


<%
            if("POST".equals(request.getMethod())) {
                
                conn.setAutoCommit(true);
                
                String titlu = request.getParameter("titlu");
                String categorie = request.getParameter("categorie");
                String continut = request.getParameter("continut");
                String url = request.getParameter("url");
                
                //Preiau ID-ul categoriei pe care o transmit prin form
                
                PreparedStatement idCategorie = conn.prepareStatement("SELECT id_categorie FROM categorii WHERE nume_categorie = ?");
                idCategorie.setString(1, categorie);
                ResultSet idCategorieRESULT = idCategorie.executeQuery();
                idCategorieRESULT.next();
                int idCat = idCategorieRESULT.getInt(1);
                
                
                //Adaug in tabela MULTIMEDIA imaginea respectiva
                PreparedStatement adaugareImagine = conn.prepareStatement("INSERT INTO MULTIMEDIA(id_multimedia, url, tip_multimedia, vizibilitate) VALUES (incr_id_multimedia.nextval, ?, 'imagine', 1)");
                adaugareImagine.setString(1, url);
                int adaugareImagineRESULT = adaugareImagine.executeUpdate();
                
                
                
                
                //Adaug stirea
                PreparedStatement adaugareStire = conn.prepareStatement("INSERT INTO STIRI(id_stire, nume_stire, continut_stire, id_categorie) VALUES(incr_id_stire.nextval, ?, ?, ?)");
                
                adaugareStire.setString(1, titlu);
                adaugareStire.setString(2, continut);
                adaugareStire.setInt(3, idCat);
                
                int adaugareStireRESULT = adaugareStire.executeUpdate();
                
                
                // Aflu ID-ul stirii pe care tocmai am adaugat-o, precum si ID-ul imaginii
                
                PreparedStatement idStire = conn.prepareStatement("SELECT id_stire FROM (SELECT id_stire FROM stiri ORDER BY id_stire DESC) WHERE ROWNUM = 1");
                ResultSet idStireRESULT = idStire.executeQuery();
                idStireRESULT.next();
                int idStireNecesar = idStireRESULT.getInt(1);
                
                
                PreparedStatement idMultimedia = conn.prepareStatement("SELECT id_multimedia FROM (SELECT id_multimedia FROM multimedia ORDER BY id_multimedia DESC) WHERE ROWNUM = 1");
                ResultSet idMultimediaRESULT = idMultimedia.executeQuery();
                idMultimediaRESULT.next();
                int idMultimediaNecesar = idMultimediaRESULT.getInt(1);
                
                
                // Introduc in tabela de jonctiunea id-ul stirii si id-ul multimedia
                
                
                PreparedStatement stire_multimedia = conn.prepareStatement("INSERT INTO conexiune_stiri_multimedia(id_stire, id_multimedia) VALUES(?, ?)");
                stire_multimedia.setInt(1, idStireNecesar);
                stire_multimedia.setInt(2, idMultimediaNecesar);
                
                int stire_multimediaRESULT = stire_multimedia.executeUpdate();
                
                
                // Introduc in tabela de jonctiune pentru stire si autor
                PreparedStatement stire_autor = conn.prepareStatement("INSERT INTO conexiune_autori_stiri(id_autor, id_stire) VALUES ("+session.getAttribute("id")+","+idStireNecesar+")");
            
                int stire_autorRESULT = stire_autor.executeUpdate();
                
                
                
                
                response.sendRedirect("Stiri.jsp");
                      
                
                
                
                
                
                
               
               
                
            }                    
                                
%>
