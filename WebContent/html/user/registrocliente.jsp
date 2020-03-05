<%@include file="/html/common/header.jsp"%>
         <div id="content">
               <div id="registro">
                     <div id="registrotop">
                           <h1>Registrarse como Cliente</h1>
                        </div>
                     <form action="/FlashEat/user" id="formregistro" method="post">
                        <input type="hidden" name="accion" value="registro">
                        <div id="indexar">
                           <div id="funo">
                           <input type="text" placeholder="Nombre" name="nombre" id="nombre" onchange="(this.style.borderColor='white')">
                           <input type="text" placeholder="Apellidos" name="apellidos" id="apellidos" onchange="(this.style.borderColor='white')">
                           </div>
                           <div id="fdos">
                           <input placeholder="Fecha de Nacimiento" class="textbox-n" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="fechanacimiento" name="fechanacimiento" onchange="(this.style.borderColor='white')"/>
                           <select id="sexo" name="sexo" form="formregistro">
                              <option value="M">Hombre</option>
                              <option value="F">Mujer</option>
                              <option value=" ">Prefiero no decirlo</option>
                           </select>
                           </div>
                           <div id="ftres">
                           <input type="email" placeholder="Correo Electrónico" name="email" id="email" onchange="(this.style.borderColor='white')">
                       		<input type="text" placeholder="Telefono" name="telefono" id="telefono" onchange="(this.style.borderColor='white')">
                         </div>
                           <div id="fcuatro">
                           <input type="password" placeholder="Contraseña" name="contrasena1" class="contrasena" id="c1" onchange="(this.style.borderColor='white')">
                           <input type="password" placeholder="Repetir Contraseña" name="contrasena2" class="contrasena" id="c2" onchange="(this.style.borderColor='white')">
                        </div>
                           <input type="button" value="Registrarse" id="send" onclick="comprobar()" onmouseover="(this.style.cursor='pointer')">
                        </div>
                        
                     </form>
                  </div>
         </div>

    <%@include file="/html/common/footer.jsp"%>
      </div>
      <script>
      function comprobar(){
         var n = document.getElementById("nombre").value;
         var a = document.getElementById("apellidos").value;
         var f = document.getElementById("fechanacimiento").value;
         var e = document.getElementById("email").value;
         var x = document.getElementById("c1").value;
         var x2 = document.getElementById("c2").value;
if (n.length == 0) {
   nombre = document.getElementById("nombre");
   nombre.style.borderColor='red';
  return false;
}
if (a.length == 0) {
   apellidos = document.getElementById("apellidos");
   apellidos.style.borderColor='red';
  return false;
}
if (f.length == 0) {
   fechanacimiento = document.getElementById("fechanacimiento");
   fechanacimiento.style.borderColor='red';
  return false;
}
if (e.length == 0 || emailIsValid(e) == false) {
   email = document.getElementById("email");
   email.style.borderColor='red';
  return false;
}

   if (x.length == 0 || x2.length == 0) {
   c1 = document.getElementById("c1");
   c1.style.borderColor='red';
   c2 = document.getElementById("c2");
   c2.style.borderColor='red';
  return false;
}
    if (x == x2)
    document.getElementById("formregistro").submit()
    else{
    c1 = document.getElementById("c1");
   c1.style.borderColor='red';
   c2 = document.getElementById("c2");
   c2.style.borderColor='red';
  return false;
      }
   }
       
      function emailIsValid (email) {
         return /\S+@\S+\.\S+/.test(email);
      }
      </script>
   </body>
</html>