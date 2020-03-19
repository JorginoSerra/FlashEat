<%@include file="/html/common/header.jsp"%>
<%@page import="es.flasheat.web.util.AttributeNames, es.flasheat.web.util.ParameterNames"%>
         <div id="content">
            <div id="login">
               <div id="logintop">
                     <h1>Iniciar Sesion</h1>
                  </div>
                  	<b style="color:red;"><% if (request.getAttribute(AttributeNames.ERROR) != null) {%><%=request.getAttribute(AttributeNames.ERROR) %><% }%></b>
               <form action="/FlashEat/user" id="formlogin" method="post">
               
                  <input type="hidden" name="accion" value="login">
                  <input type="email" placeholder="Correo electrónico" name="login" id="loginmail" value="<% if (request.getParameter(ParameterNames.LOGIN) != null) {%><%=request.getParameter(ParameterNames.LOGIN) %><% }%>"><br/>
                  <input type="password" placeholder="Contraseña" name="pass" id="loginpass"><br/>
                  <input type="checkbox" id="recordar">
                  <label for="recordar"><span></span>Recordar Datos</label><br/>
                  <input type="submit" value="Entrar" id="send" onmouseover="ponter(this)">
               </form>
               <a href="login.jsp">Olvidé mi Contraseña</a>
            </div>
         </div>

    <%@include file="/html/common/footer.jsp"%>
      </div>

      <script>
            function ponter(x) {
              x.style.cursor="pointer";
            }
      </script>
   </body>
</html>