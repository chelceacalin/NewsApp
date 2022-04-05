<%-- 
    Document   : HAISAPARSAM
    Created on : Mar 5, 2022, 6:30:58 PM
    Author     : oracle
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.concurrent.TimeUnit"%>

<%@ page import = "org.json.simple.JSONObject" %>
<%@ page import = "org.json.simple.parser.JSONParser" %>
<%@ page import = "org.json.simple.parser.*" %>
<%@ page import="java.io.FileReader"%>
 
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.logging.Level" %>
<%@ page import = "java.util.logging.Logger" %>
<%@ page import = "org.w3c.dom.*" %>
<%@ page import = "javax.xml.parsers.*" %>
<%@ page import = "org.xml.sax.SAXException" %>




<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="register.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    </head>
    <body>
    
        
        
 <section class="vh-100 bg-image" style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
  <div class="mask d-flex align-items-center h-100 gradient-custom-3">
    <div class="container h-100 w-300">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
          <div class="card" style="border-radius: 15px;">
            <div class="card-body p-5">
              <h2 class="text-uppercase text-center mb-5">XML PARSER</h2>

              
              
              <form action="cursvalutar.jsp" method="POST">
                <div class="d-flex justify-content-center">
                  <button type="submit" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body " name="submit">Show XML</button>
                </div>
              </form>
              
              
        <%
       
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
                            
            int counter = 0;
            
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
                             out.print(" <td>"+ ++counter + "</td>");
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
       
%>



            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
    
   
</body>

</html>
