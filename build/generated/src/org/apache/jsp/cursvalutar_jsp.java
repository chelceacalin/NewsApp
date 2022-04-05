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
import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.w3c.dom.*;
import javax.xml.parsers.*;
import org.xml.sax.SAXException;

public final class cursvalutar_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write(" \n");
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"register.css\">\n");
      out.write("  <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("    \n");
      out.write("        \n");
      out.write("        \n");
      out.write(" <section class=\"vh-100 bg-image\" style=\"background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');\">\n");
      out.write("  <div class=\"mask d-flex align-items-center h-100 gradient-custom-3\">\n");
      out.write("    <div class=\"container h-100 w-300\">\n");
      out.write("      <div class=\"row d-flex justify-content-center align-items-center h-100\">\n");
      out.write("        <div class=\"col-12 col-md-9 col-lg-7 col-xl-6\">\n");
      out.write("          <div class=\"card\" style=\"border-radius: 15px;\">\n");
      out.write("            <div class=\"card-body p-5\">\n");
      out.write("              <h2 class=\"text-uppercase text-center mb-5\">XML PARSER</h2>\n");
      out.write("\n");
      out.write("              \n");
      out.write("              \n");
      out.write("              <form action=\"HAISAPARSAM.jsp\" method=\"POST\">\n");
      out.write("                <div class=\"d-flex justify-content-center\">\n");
      out.write("                  <button type=\"submit\" class=\"btn btn-success btn-block btn-lg gradient-custom-4 text-body \" name=\"submit\">Show XML</button>\n");
      out.write("                </div>\n");
      out.write("              </form>\n");
      out.write("              \n");
      out.write("              \n");
      out.write("        ");

       
        if("POST".equals(request.getMethod()))
     {
         
         
               out.println("<br>"); 
                out.println("<br>");
         
        //Get the Document Builder

         
   
         
         
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        
            DocumentBuilder builder = factory.newDocumentBuilder();

            // Get Document
            Document document = builder.parse(new File("/home/oracle/WebApplication3_COPY/XMLCURS1.xml"));

            // Normalize the xml structure
            document.getDocumentElement().normalize();

            // Get all the element by the tag name

      
   
            NodeList listaRate = document.getElementsByTagName("Rate");
            
            out.print("<table class=\"table table-dark\"> ");  
                            out.print("<thead>");  
                            out.print(" <th scope=\"col\">#</th>");  
                            out.print("  <th scope=\"col\">Moneda</th>");  
                            out.print("  <th scope=\"col\">Rata</th>");  
                            out.print("  </tr>");  
                            out.print("  </thead>");  
                            
                            
            for(int i = 0; i <listaRate.getLength(); i++) {
                Node RATA = listaRate.item(i);
                if(RATA.getNodeType() == Node.ELEMENT_NODE) {
     
                    Element RATA_ELEMENT = (Element) RATA;
                    
                    
                    NodeList RATA_DETALII =  RATA.getChildNodes();
                    
                    for(int j = 0; j < RATA_DETALII.getLength(); j++){
                        Node detaliu = RATA_DETALII.item(j);
                        if(detaliu.getNodeType() == Node.ELEMENT_NODE) {
                            Element detaliuElement = (Element) detaliu;
                            
                             out.print("<br/> ");
                             out.print(" <tbody> ");
                             out.print(" <tr> ");
                             out.print(" <td class=\"counterCell\"></td>");
                             out.print(" <td>"+RATA_ELEMENT.getAttribute("currency")+"</td> ");
                              out.print(" <td>"+detaliuElement.getAttribute("value")+"</td> ");
                             out.print(" </tr> ");
 out.print(" </tbody> ");
 
 
                            
                        }

                    }
                            

                }

            }
            out.print("  </table>");  
    }
       

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<style>\n");
      out.write("    table {\n");
      out.write("    counter-reset: tableCount;     \n");
      out.write("}\n");
      out.write(".counterCell:before {              \n");
      out.write("    content: counter(tableCount); \n");
      out.write("    counter-increment: tableCount; \n");
      out.write("}\n");
      out.write("</style>\n");
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
      out.write("</html>\n");
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
