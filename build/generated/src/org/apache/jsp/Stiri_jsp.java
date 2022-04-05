package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import entities.Stire;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.*;
import java.io.FileReader;
import java.sql.*;

public final class Stiri_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
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
      out.write("\n");

    
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
        
     
              
             
             
             
     
     
    

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css\" integrity=\"sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh\" crossorigin=\"anonymous\">\n");
      out.write("        <title>News</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"./css/utils.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("     \n");
      out.write("        <nav class=\"navbar navbar-expand-lg navbar-dark bg-main p-3\">\n");
      out.write("            <a class=\"navbar-brand\" href=\"#\">OAC Echipa 1</a>\n");
      out.write("            <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarNav\" aria-controls=\"navbarNav\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n");
      out.write("              <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("            </button>\n");
      out.write("            <div class=\"collapse navbar-collapse\" id=\"navbarNav\">\n");
      out.write("              <ul class=\"navbar-nav\">\n");
      out.write("                  <li class=\"nav-item\">\n");
      out.write("                      \n");
      out.write("                    <a class=\"nav-link\" href=\"login.jsp\">Home <span class=\"sr-only\">(current)</span></a>\n");
      out.write("                    \n");
      out.write("                  </li>\n");
      out.write("                  \n");
      out.write("                <li class=\"nav-item active\">\n");
      out.write("                  <a class=\"nav-link\" href=\"#\">News <span class=\"sr-only\">(current)</span></a>\n");
      out.write("                </li>\n");
      out.write("                \n");
      out.write("                \n");
      out.write("                \n");
      out.write("                \n");
      out.write("          \n");
      out.write("                \n");
      out.write("                \n");
      out.write("                 <li class=\"nav-item mx-5\">\n");
      out.write("                  <a class=\"nav-link text-warning\" href=\"#\">\n");
      out.write("                      \n");
      out.write("                      ");

                        
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
                        
                        
                        
                            

                      
      out.write("\n");
      out.write("                      \n");
      out.write("                      <span class=\"sr-only\">(current)</span></a>\n");
      out.write("                </li>\n");
      out.write("                \n");
      out.write("                \n");
      out.write("                ");
 if(session.getAttribute("tipCont") != null){ 
      out.write("\n");
      out.write("                 <li class=\"nav-item mx-3\">\n");
      out.write("                  <a class=\"nav-link\" href=\"logout.jsp\">Logout <span class=\"sr-only\">(current)</span></a>\n");
      out.write("                </li>\n");
      out.write("                ");
 } 
      out.write("\n");
      out.write("              </ul>\n");
      out.write("            </div>\n");
      out.write("       </nav>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("                ");
 if(session.getAttribute("tipCont") == "autor") { 
      out.write("\n");
      out.write("              <div class=\"container mt-5 text-center\">\n");
      out.write("                  <a href=\"adauga_stire.jsp\" class=\"btn bg-main text-white w-50\">Adauga stire noua</a>\n");
      out.write("              </div>       \n");
      out.write("              \n");
      out.write("              ");
 } 
      out.write("\n");
      out.write("              \n");
      out.write("         \n");
      out.write("        \n");
      out.write("              \n");
      out.write("        <div class=\"container mt-5 text-center\">\n");
      out.write("            <input type=\"text\" class=\"form-control w-50\" id=\"myInput\" placeholder=\"Cauta stire...\">\n");
      out.write("            \n");
      out.write("            <table class=\"table mt-3\">\n");
      out.write("                <thead>\n");
      out.write("                  <tr>\n");
      out.write("                    <th scope=\"col\">#</th>\n");
      out.write("                    <th scope=\"col\">Nume stire</th>\n");
      out.write("                    <th scope=\"col\">Data postarii</th>\n");
      out.write("                    <th scope=\"col\">Categorie</th>\n");
      out.write("                    <th scope=\"col\">Actiuni</th>\n");
      out.write("                  </tr>\n");
      out.write("                </thead>\n");
      out.write("                <tbody id=\"myTable\">\n");
      out.write("                 \n");
      out.write("                     \n");
      out.write("                    ");
      entities.JavaBean stiri = null;
      synchronized (_jspx_page_context) {
        stiri = (entities.JavaBean) _jspx_page_context.getAttribute("stiri", PageContext.PAGE_SCOPE);
        if (stiri == null){
          stiri = new entities.JavaBean();
          _jspx_page_context.setAttribute("stiri", stiri, PageContext.PAGE_SCOPE);
        }
      }
      out.write("\n");
      out.write("                    ");

     
     
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
                
                
                        try{
                            ArrayList<Stire> listaStiri = stiri.getStiri();
                        
                        
                        for(Stire s : listaStiri){
                            
                            
                            
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
                        
                        }
                        catch(Exception e)
                        {
                            e.printStackTrace();
                        
                        }
                        finally {
                   
                        }
                        
                        
                        
                            
                        
                        
                        
                        
                        
                        


                    

                     
      out.write("\n");
      out.write("                    \n");
      out.write("                </tbody>\n");
      out.write("            </table>\n");
      out.write("        </div>\n");
      out.write("                     \n");
      out.write("         <script>\n");
      out.write("            $(document).ready(function(){\n");
      out.write("              $(\"#myInput\").on(\"keyup\", function() {\n");
      out.write("                var value = $(this).val().toLowerCase();\n");
      out.write("                $(\"#myTable tr\").filter(function() {\n");
      out.write("                  $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);\n");
      out.write("                });\n");
      out.write("              });\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    ");
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
