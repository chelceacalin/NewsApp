
<html>
<head>
  <meta charset="utf-8">
  <title> Sign in</title>
  <link rel="stylesheet" type="text/css" href="register.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.concurrent.TimeUnit"%>

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

     if("POST".equals(request.getMethod()))
     {
          
         
     String nume=request.getParameter("nume");
     String prenume=request.getParameter("prenume");
     String email=request.getParameter("email");
     String parola=request.getParameter("parola");
    // String nume=request.getParameter("nume");
    // String prenume=request.getParameter("prenume");
    // String email=request.getParameter("email");
   

       
         
     PreparedStatement listaUtilizatori= conn.prepareStatement("Select nume,prenume,email,parola from utilizatori");
     ResultSet listaUtilizatoriResult=listaUtilizatori.executeQuery(); 
     
     
     while(listaUtilizatoriResult.next())
     {
         if(listaUtilizatoriResult.getString("email").equals(email))
         {
           msg="Email deja existent!";
           break;
         }
         
         if(listaUtilizatoriResult.getString("parola").equals(parola)){
               msg="Parola deja existenta!";
           break;
         }
     }
     
         
     if(msg!="Email deja existent!"&&msg!="Parola deja existenta!")
     {
          String insert= "insert into utilizatori(ID_Utilizator,Nume,Prenume,Email,Parola,Stare)  values(incr_id_utilizator.nextval,?,?,?,?,1)";
            PreparedStatement stmt = conn.prepareStatement(insert);
            stmt.setString(1,nume);
            stmt.setString(2,prenume);
            stmt.setString(3,email);
            stmt.setString(4,parola);
            stmt.execute();
            msg="Utilizator inregistrat cu succes.";
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
              <h2 class="text-uppercase text-center mb-5">Create an account: </h2>

              <form action="index.jsp" method="POST">

                <div class="form-outline mb-4">
                    <input type="text" id="form3Example1cg" class="form-control form-control-lg" name="nume" required />
                  <label class="form-label" for="form3Example1cg">Your Name</label>
                </div>

                   <div class="form-outline mb-4">
                  <input type="text" id="form3Example1cg" class="form-control form-control-lg" name="prenume" required/>
                  <label class="form-label" for="form3Example1cg">Your Surname</label>
                </div>


                <div class="form-outline mb-4">
                  <input type="email" id="form3Example3cg" class="form-control form-control-lg" name="email" required/>
                  <label class="form-label" for="form3Example3cg" >Your Email</label>
                </div>
                  
                    <div class="form-outline mb-4">
                  <input type="password" id="form3Example3cg" class="form-control form-control-lg" name="parola" required/>
                  <label class="form-label" for="form3Example3cg" >Your Password</label>
                </div>


                <div class="d-flex justify-content-center">
                  <button type="submit" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body" name="submit">Register</button>
                </div>

                <p class="text-center text-muted mt-5 mb-0">Have already an account? <a href="login.jsp" class="fw-bold text-body"><u>Login here</u></a></p>
                 
      <%
        
     if(msg.equals("Email deja existent!"))
    {
        out.print(" <div class=\"alert alert-danger mt-2  \" role=\"alert\">"+ 
"      Email deja existent!"+"</div>");
    }
     
           
     if(msg.equals("Parola deja existenta!"))
    {
        out.print(" <div class=\"alert alert-danger mt-2  \" role=\"alert\">"+ 
"      Parola deja existenta!"+"</div>");
    }
     
     
     if(msg.equals("Utilizator inregistrat cu succes."))
     {
        out.print(" <div class=\"alert alert-success\" role=\"alert\">"+ 
"Utilizator inregistrat cu succes."+"</div>");
        
            
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