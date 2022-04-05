
<html>
<head>
  <meta charset="utf-8">
  <title> Login </title>
  <link rel="stylesheet" type="text/css" href="register.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>

<%@ page import = "org.json.simple.JSONObject" %>
<%@ page import = "org.json.simple.parser.JSONParser" %>
<%@ page import = "org.json.simple.parser.*" %>
<%@page import="java.io.FileReader"%>

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

<%
     String msg="";
     boolean gasit=false;
     
     
     String email="";
     String parola = "";
     
     if("POST".equals(request.getMethod()))
     {
          
   
     email=request.getParameter("email");
     parola=request.getParameter("parola");
     PreparedStatement listaUtilizatori= conn.prepareStatement("Select email,parola from utilizatori");
     ResultSet listaUtilizatoriResult=listaUtilizatori.executeQuery(); 
     
                 
     while(listaUtilizatoriResult.next())
     {
         if(listaUtilizatoriResult.getString("email").equals(email) && listaUtilizatoriResult.getString("parola").equals(parola))
         {
              msg="Autentificat cu succes!";
            session.setAttribute("tipCont", "utilizator");
            gasit=true;
           
           break;
         }
     }
     
     if(!gasit){
         PreparedStatement listaAutori= conn.prepareStatement("Select email,parola from autori");
         ResultSet listaAutoriRESULT=listaAutori.executeQuery(); 
         
         while(listaAutoriRESULT.next())
        {
            if(listaAutoriRESULT.getString("email").equals(email) && listaAutoriRESULT.getString("parola").equals(parola))
            {
                 msg="Autentificat cu succes!";
                 session.setAttribute("tipCont", "autor");
               gasit=true;

              break;
            }
         }
         
     }
     
        
     
     if(!gasit)
     {
            
            msg="Email sau parola gresite!";
     }
    
     
    }
%>
<body>
    
 <section class="vh-100 bg-image" style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
  <div class="mask d-flex align-items-center h-100 gradient-custom-3">
    <div class="container h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
          <div class="card" style="border-radius: 15px;">
            <div class="card-body p-5">
              <h2 class="text-uppercase text-center mb-5">Login into your account: </h2>

              <form  method="POST">

                    <div class="form-outline mb-4">
                  <input type="email" id="form3Example3cg" class="form-control form-control-lg" name="email" required/>
                  <label class="form-label" for="form3Example3cg" >Your Email</label>
                </div>

                  
                <div class="form-outline mb-4">
                    <input type="password" id="form3Example1cg" class="form-control form-control-lg" name="parola" required />
                  <label class="form-label" for="form3Example1cg">Your Password</label>
                </div>

              
           
             

                <div class="d-flex justify-content-center">
                  <button type="submit" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body" name="submit">Login</button>
                </div>

      <%
        
     if(msg.equals("Email sau parola gresite!"))
     {
        out.print(" <div class=\"alert alert-danger mt-2  \" role=\"alert\">"+ 
"      Email sau parola gresite! "+"</div>");
            
    }
     
     if(msg.equals("Autentificat cu succes!")){
         
         
          session.setAttribute("email", email);
          session.setAttribute("parola", parola);
                          
          
          
          if(session.getAttribute("tipCont").equals("utilizator")){
              PreparedStatement getID = conn.prepareStatement("SELECT id_utilizator FROM utilizatori WHERE email=? AND parola = ?");
              getID.setString(1, email);
              getID.setString(2, parola);
              
              ResultSet getIDRESULT = getID.executeQuery();
              
              getIDRESULT.next();
              
              int id = getIDRESULT.getInt(1);
              
               session.setAttribute("id", id);
         
         
               response.sendRedirect("Stiri.jsp");  
              
          } else if(session.getAttribute("tipCont").equals("autor")){
              
              PreparedStatement getID = conn.prepareStatement("SELECT id_autor FROM autori WHERE email=? AND parola = ?");
              getID.setString(1, email);
              getID.setString(2, parola);
              
              ResultSet getIDRESULT = getID.executeQuery();
              
              getIDRESULT.next();
              
              int id = getIDRESULT.getInt(1);
              
               session.setAttribute("id", id);
         
         
               response.sendRedirect("Stiri.jsp");  
     }
          
          
         

     }
   
      
   
        
      %>
              </form>

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
    
   
</body>

</html>