
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>


<%@ page import = "org.json.simple.JSONObject" %>
<%@ page import = "org.json.simple.parser.JSONParser" %>
<%@ page import = "org.json.simple.parser.*" %>
<%@page import="java.io.FileReader"%>
<%@page import="org.w3c.dom.*,javax.xml.parsers.*" %>


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


<%@page import="java.text.SimpleDateFormat"%>

<%@ page import = "java.sql.*"%>


<%
    
   
    
   
 
    
    
    
    String id = (String)request.getParameter("id"); // id stire
    
    
    

 
    PreparedStatement ps = conn.prepareStatement("SELECT * FROM stiri WHERE id_stire=" + id);
    PreparedStatement comentariu = conn.prepareStatement("SELECT * FROM comentarii WHERE id_stire=" + id + " AND STARE_COMENTARIU = 1 ORDER BY data_comentariu DESC");
    PreparedStatement totalComentarii = conn.prepareStatement("SELECT COUNT(*) FROM comentarii WHERE id_stire=" + id + "AND STARE_COMENTARIU = 1");
     
     
    ResultSet result = ps.executeQuery();
    ResultSet comentariuResult = comentariu.executeQuery();
    ResultSet totalComentariiRESULT = totalComentarii.executeQuery();
    
    result.next();
    totalComentariiRESULT.next();
    int nrComentarii = totalComentariiRESULT.getInt(1);
    
    
    String nume_stire = result.getString("nume_stire");
    String continut_stire = result.getString("continut_stire");
    Date data = result.getDate("data_postarii");
    
    
     
        
    
    
    
%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <title>Vizualizare stire</title>
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
                <li class="nav-item active">
                  <a class="nav-link" href="Stiri.jsp">News <span class="sr-only">(current)</span></a>
                </li>
                
                
                 <li class="nav-item mx-5">
                  <a class="nav-link text-warning" href="#">
                      
                      <%
                        
                        if(session.getAttribute("tipCont") == null)
                            out.println("<strong>Vizitator</strong>");
                         
                        
                        if(session.getAttribute("tipCont") != null) 
                        {
                            
                            String emailCurent = (String)session.getAttribute("email");
                            
                            String sql = "SELECT * FROM " +session.getAttribute("tipCont")+ "i"  + " WHERE email = " + " '"+emailCurent+"'  ";
                            
                            PreparedStatement findUtilizator = conn.prepareStatement(sql);
                            
                           
                            ResultSet findUtilizatorRESULT = findUtilizator.executeQuery();
                            findUtilizatorRESULT.next();
                            
                            out.println("<strong>" + findUtilizatorRESULT.getString("nume") + " " + findUtilizatorRESULT.getString("prenume") + " - " + session.getAttribute("tipCont") + "</strong>");
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
        
        <div class="container m-5 p-2" style="max-width: 80%;">
            
                <div class="d-flex justify-content-between">
                    <div>
                        <p class="h2"><%=nume_stire %></p>

                        <p class="h5 mt-2 p-4"><%=continut_stire%></p>

                        <em class="mt-1"><%=data%>, postat de <%


                        PreparedStatement nrAutori = conn.prepareStatement("SELECT COUNT(*) FROM conexiune_autori_stiri WHERE id_stire =" + id);
                        ResultSet nrAutoriRESULT = nrAutori.executeQuery();
                        nrAutoriRESULT.next();


                        PreparedStatement idAutoriEfectivi = conn.prepareStatement("SELECT id_autor FROM conexiune_autori_stiri WHERE id_stire=" +id);
                        ResultSet idAutoriEfectiviRESULT = idAutoriEfectivi.executeQuery();

                        String r = "";

                        int autori = nrAutoriRESULT.getInt(1);

                        while(idAutoriEfectiviRESULT.next() && autori !=0 )
                        {
                            PreparedStatement numePrenumeAutor = conn.prepareStatement("SELECT nume, prenume FROM autori WHERE id_autor=" + idAutoriEfectiviRESULT.getInt(1));
                            ResultSet numePrenumeAutorRESULT = numePrenumeAutor.executeQuery();
                            numePrenumeAutorRESULT.next();

                            if(autori != 1) r+=numePrenumeAutorRESULT.getString("nume") + " " + numePrenumeAutorRESULT.getString("prenume") +", ";
                            else r+=numePrenumeAutorRESULT.getString("nume") + " " + numePrenumeAutorRESULT.getString("prenume");

                            autori--;
                        }

                        autori = nrAutoriRESULT.getInt(1);

                        out.println(r);

                        if(autori>1)out.println(" (" + autori + " autori)");
                        else out.println("(1 autor)");



                        %></em><br><br>

                        <p class="lead"><%
                                          if(nrComentarii > 0) out.println("Comentarii (" + nrComentarii + ")");
                                          else out.println("<b class=\"text-danger\">Stirea nu are comentarii!</b>");
                                        %></p>
                    </div>
                    
                    <div class="d-flex flex-column">
                        <!-- 200 height, 400 width -->
                        
                        <%
                                          
                                PreparedStatement urlMultimediaStire = conn.prepareStatement("SELECT url FROM multimedia m, conexiune_stiri_multimedia con WHERE m.id_multimedia = con.id_multimedia AND id_stire = " + id);          
                                ResultSet urlMultiMediaStireRESULT = urlMultimediaStire.executeQuery();
                                
                                while(urlMultiMediaStireRESULT.next())
                                {
                                    out.println("<img src=" + urlMultiMediaStireRESULT.getString(1) +" heigth=\"200\" width=\"400\">");
                                }       
                        %>
                               

                    </div>
            
            </div>
                    

                    
            
                    
                    
             <table class="table">
  
                <tbody>
                    
                    <%
                    
                        while(comentariuResult.next())
                            
                        {
                            int idUtilizator = comentariuResult.getInt("id_utilizator");
                            String continutComentariu = comentariuResult.getString("continut");
                            Date dataComentariu = comentariuResult.getDate("data_comentariu");
                            
                         
                            
                            
                            //String dataString = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss").format(aux);
                            
                            PreparedStatement utilizator = conn.prepareStatement("SELECT nume, prenume FROM utilizatori WHERE id_utilizator=?");
                            utilizator.setInt(1, idUtilizator);
                            
                            ResultSet utilizatorRESULT = utilizator.executeQuery();
                            
                            utilizatorRESULT.next();
                            
                            out.println(""
                                    + "<tr>"
                                    + "<td width=\"25%\" class=\"text-secondary\">" + utilizatorRESULT.getString("nume") + " "+ utilizatorRESULT.getString("prenume") +" a spus </td>"
                                    + "<td width=\"65%\"><i>" + continutComentariu + "</i></td>"                                    
                                    + "<td width=\"10%\">" + dataComentariu + "</td>"
                                    + "</tr>");
                        }
                    
                    
                    %>
                    

                </tbody>
             </table>
                    
                    <% if(session.getAttribute("tipCont") == null){ %>
                    <form action="#" method="post">
                        <input type="text" placeholder="Introdu comentariu" name="comentariu" class="w-50" disabled>
                        <button type="submit" class="btn btn-warning" disabled>Posteaza</button>
                    </form>
                    
                    
                    <% } %>
                    
                    <%if(session.getAttribute("tipCont") == "utilizator"){ %>
                    <form action="#" method="post">
                        <input type="text" placeholder="Introdu comentariu" name="comentariu" class="w-50">
                        <button type="submit" name="submit" class="btn btn-warning">Posteaza</button>
                    </form>
                    
                     <% } %>
            </div>
            
            
        
        
        
    </body>
</html>



<%
                    
              if("POST".equals(request.getMethod())) {
                  
                  
                  String comentariuPOST = request.getParameter("comentariu");
                 
                  String query = "INSERT INTO comentarii(id_comentariu, continut, id_utilizator, id_stire) VALUES (incr_id_comentariu.nextval, '"+comentariuPOST+"', "+session.getAttribute("id")+","+id+")";
                  
                  Statement stmt = conn.createStatement();

                  int count = stmt.executeUpdate(query);
                 
                  
                  
                  response.sendRedirect("vezistiri.jsp?id=" + id); // autorefresh
              }       
                    
                    
 %>