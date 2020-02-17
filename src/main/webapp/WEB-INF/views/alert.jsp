<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<body>


	<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script src="resources/js/sweetalert2.js"></script>
	<script>
    $(function(){
       swal({
         type:'success',
         title: '${msg}',
         showConfirmButton : false,
         timer:1000
       }).then((result)=>{
          //if(result.value){
          window.location.href='${url}';
          //}
       });
    });

    </script>

</body>
</html>