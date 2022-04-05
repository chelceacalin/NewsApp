package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.sql.*;
import java.util.concurrent.TimeUnit;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.*;
import java.io.FileReader;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("  <meta charset=\"utf-8\">\n");
      out.write("  <title> Sign in</title>\n");
      out.write("  <link rel=\"stylesheet\" type=\"text/css\" href=\"register.css\">\n");
      out.write("  <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

   
    JSONParser jsonParser = new JSONParser();
    JSONObject jsonObject = (JSONObject) jsonParser.parse(new FileReader("/home/oracle/WebApplication3/web/newjson.json"));
    
     String User = (String) jsonObject.get("username");
     String Pass = (String) jsonObject.get("password");
     String Driver = (String) jsonObject.get("driverNume");
     String Drive = (String) jsonObject.get("driver");
     Class.forName(Driver);
     Connection conn = DriverManager.getConnection(Drive, User, Pass);
     


      out.write('\n');
      out.write('\n');

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

      out.write("\n");
      out.write("<body>\n");
      out.write("    \n");
      out.write(" <section class=\"vh-100 bg-image\" style=\"background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');\">\n");
      out.write("  <div class=\"mask d-flex align-items-center h-100 gradient-custom-3\">\n");
      out.write("    <div class=\"container h-100\">\n");
      out.write("      <div class=\"row d-flex justify-content-center align-items-center h-100\">\n");
      out.write("        <div class=\"col-12 col-md-9 col-lg-7 col-xl-6\">\n");
      out.write("          <div class=\"card\" style=\"border-radius: 15px;\">\n");
      out.write("            <div class=\"card-body p-5\">\n");
      out.write("              <h2 class=\"text-uppercase text-center mb-5\">Create an account: </h2>\n");
      out.write("\n");
      out.write("              <form action=\"index.jsp\" method=\"POST\">\n");
      out.write("\n");
      out.write("                <div class=\"form-outline mb-4\">\n");
      out.write("                    <input type=\"text\" id=\"form3Example1cg\" class=\"form-control form-control-lg\" name=\"nume\" required />\n");
      out.write("                  <label class=\"form-label\" for=\"form3Example1cg\">Your Name</label>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                   <div class=\"form-outline mb-4\">\n");
      out.write("                  <input type=\"text\" id=\"form3Example1cg\" class=\"form-control form-control-lg\" name=\"prenume\" required/>\n");
      out.write("                  <label class=\"form-label\" for=\"form3Example1cg\">Your Surname</label>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                <div class=\"form-outline mb-4\">\n");
      out.write("                  <input type=\"email\" id=\"form3Example3cg\" class=\"form-control form-control-lg\" name=\"email\" required/>\n");
      out.write("                  <label class=\"form-label\" for=\"form3Example3cg\" >Your Email</label>\n");
      out.write("                </div>\n");
      out.write("                  \n");
      out.write("                    <div class=\"form-outline mb-4\">\n");
      out.write("                  <input type=\"password\" id=\"form3Example3cg\" class=\"form-control form-control-lg\" name=\"parola\" required/>\n");
      out.write("                  <label class=\"form-label\" for=\"form3Example3cg\" >Your Password</label>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                <div class=\"d-flex justify-content-center\">\n");
      out.write("                  <button type=\"submit\" class=\"btn btn-success btn-block btn-lg gradient-custom-4 text-body\" name=\"submit\">Register</button>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <p class=\"text-center text-muted mt-5 mb-0\">Have already an account? <a href=\"login.jsp\" class=\"fw-bold text-body\"><u>Login here</u></a></p>\n");
      out.write("                 \n");
      out.write("      ");

        
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
   
      
   
        
      
      out.write("\n");
      out.write("              </form>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("</section>\n");
      out.write("    \n");
      out.write("   \n");
      out.write("</body>\n");
      out.write("\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
