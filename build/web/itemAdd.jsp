<%-- 
    Document   : itemAdd
    Created on : Feb 4, 2018, 9:39:28 PM
    Author     : Altysh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <body>
       <form method="POST" action="Item_Add" enctype="multipart/form-data">
   item_name:<br>
  <input type="text" name="item_name"><br>
  catagory:<br>
  <input type="text" name="catagory" ><br>
  qutity<br>
   <input type="number" name="qutity" ><br>
   price:<br>
    <input type="number" name="price" ><br>
    pic:<br>
      <input type="file" name="pic" accept="image/*"><br>
  <br>
  <input type="submit" value="Submit">
</form> 
    </body>
</html>
