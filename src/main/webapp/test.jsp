<%-- 
    Document   : index.jsp
    Created on : Mar 8, 2015, 12:43:53 PM
    Author     : andycobley
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" language="javascript">

function get_vid(){
     var video = document.getElementById('video');
     var mp4 = document.getElementById('mp4');
     var username = "admin"
     var password = "changeit"
     var floc=""
     var ploc=""
     function make_base_auth(user, password) {
       var tok = user + ':' + password;
       var hash = Base64.encode(tok);
       return "Basic " + hash;
     }
     jQuery.ajax({
      type: 'GET',
      dataType: "json",
      async: false ,
      url: 'http://35.231.180.212/myflix/videos',
      contentType: 'application/json; charset=utf-8',
      beforeSend: function (xhr) {
      xhr.setRequestHeader ("Authorization", "Basic " + btoa(username + ":" + password));}
      ,
      success: function (data) {
        console.log(data);
        console.log(data._embedded);
        console.log(data._embedded[0].video.ip);
        console.log(data._returned)
        floc= data._embedded[0].video.ip +data._embedded[0].video.file;       
      }
    });
  mp4.src = floc
  video.load();
}
function get_num(){
     var username = "admin"
     var password = "changeit"
     var pnum=""
     function make_base_auth(user, password) {
       var tok = user + ':' + password;
       var hash = Base64.encode(tok);
       return "Basic " + hash;
     }
     jQuery.ajax({
      type: 'GET',
      dataType: "json",
      async: false ,
      url: 'http://35.231.180.212/myflix/videos',
      contentType: 'application/json; charset=utf-8',
      beforeSend: function (xhr) {
      xhr.setRequestHeader ("Authorization", "Basic " + btoa(username + ":" + password));}
      ,
      success: function (data) {
        console.log(data);
        console.log(data._returned)
        pnum= data._returned;       
      }
    });
  return(pnum)
}


</script>
</head>
<body onload="get_vid()" >
<<div id="divVideo">
    <video id="video" controls width="560">
        <source id="mp4" type="video/mp4"/>
    </video>
</div>
<% for (int i=1;i<get_num();i++){ %>
<li><a href="Ex<%=i%>.html">Example <%=i %></a></li>
  }%>
<p>
Video courtesy of
<a href="https://www.bigbuckbunny.org/" target="_blank">Big Buck Bunny</a>.
</p>
</body>
</html>
