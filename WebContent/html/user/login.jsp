<%@include file="/html/common/header.jsp"%>
         <div id="content">
            <div id="login">
               <div id="logintop">
                     <h1>Iniciar Sesion</h1>
                  </div>
               <form action="/FlashEat/user" id="formlogin" method="post">
                  <input type="hidden" name="accion" value="login">
                  <input type="email" placeholder="Correo electr�nico" name="login" id="loginmail"><br/>
                  <input type="password" placeholder="Contrase�a" name="pass" id="loginpass"><br/>
                  <input type="checkbox" id="recordar">
                  <label for="recordar"><span></span>Recordar Datos</label><br/>
                  <input type="submit" value="Entrar" id="send" onmouseover="ponter(this)">
               </form>
               <a href="login.jsp">Olvid� mi Contrase�a</a>
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