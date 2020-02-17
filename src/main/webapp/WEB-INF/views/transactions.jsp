<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8" name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0 ,user-scalable=no ,target-densitydpi=medium-dpi" />
<title>개인프로젝트</title>
<link href="resources/css/common.css" rel="stylesheet" type="text/css">
<link href="resources/css/transaction.css?ver=5" rel="stylesheet"
	type="text/css">
<link rel="shortcut icon" href="resources/img/favicon.ico">
<script src="resources/js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script>
$(function(){
	   $("#lnb_btn").click(function(){
		   $("aside").css("display","block");
	   },function(){
		   $("#aside").toggle();
	   });
})
</script>
<style>
</style>
</head>
<body>
	<form>
		<div id="wrap">
			<jsp:include page="header.jsp" />
			<div class="container">
				<section class="transaction">
					<div class="title">
						<span>게시판</span>
					</div>
					<div class="transactionBox">

						<input type="text" value="글번호" class="creditH" /> <input
							type="text" value="제목" class="tableH" /> <input type="text"
							value="날짜" class="creditH" />

						<div class="noneline"></div>

					</div>

					


				</section>
				<!--.profile-->
			</div>
			<!--.container-->
		</div>
		<!--#wrap-->
	</form>

</body>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script>

window.onload = btn();
function btn() {
   
   var page = ${ curPage };
   

   var allData = JSON.stringify({
      page : page
   });

   $
         .ajax(
               {
                  url : "rest_credit_history",
                  type : 'POST',
                  dataType : "json",
                  data : allData,
                  contentType : "application/json; charset=UTF-8",
                  success : function(data) {

                     var innerhtml = "";

                     var res = data.result;
                     var page = data.page;

                     var str = JSON.parse(res);
                     var len = str.length;
         

                     for (var i = 0; i < len; i++) {
                   
                     
                        innerhtml += '<input type="text" style="margin-right:5px;" value="'+str[i].amount+'" readonly/>'
                              + '<input type="text" style="margin-right:5px;" value="'+str[i].remark+'" readonly/>'
                              + '<input type="text" style="margin-right:5px;" value="'+str[i].regist_date+'" readonly/><br>'
                     }
                     
                  
                     $('.noneline').html(innerhtml);
                  }

               }, 'json');

}



   function mybtn(i) {
      
      var page = i;
   

      var allData = JSON.stringify({
         page : page
      });

      $
            .ajax(
                  {
                     url : "rest_credit_history",
                     type : 'POST',
                     dataType : "json",
                     data : allData,
                     contentType : "application/json; charset=UTF-8",
                     success : function(data) {

                        var innerhtml = "";

                        var res = data.result;
                        var page = data.page;

                        var str = JSON.parse(res);
                        var len = str.length;
                
                        for (var i = 0; i < len; i++) {
                      
                           
                           innerhtml += '<input type="text" style="margin-right:5px;" value="'+str[i].amount+'" readonly/>'
                                 + '<input type="text" style="margin-right:5px;" value="'+str[i].remark+'" readonly/>'
                                 + '<input type="text" style="margin-right:5px;" value="'+str[i].regist_date+'" readonly/><br>'
                        }

                        $('.noneline').html(innerhtml);
                     }

                  }, 'json');

   }

//     $('.page').click(function(){
//        var idx = $(this).index('.page');
//       var page = $('.page').eq(idx).text();
      
      
//       console.log('333 : ' + page);
   
//       var allData = JSON.stringify({
//          page : page
//       });

//       console.log('page : ' + page);
//       $
//             .ajax(
//                   {
//                      url : "rest_credit_history",
//                      type : 'POST',
//                      dataType : "json",
//                      data : allData,
//                      contentType : "application/json; charset=UTF-8",
//                      success : function(data) {

//                         var innerhtml = "";
      
//                         var res = data.result;
   
//                         var str = JSON.parse(res);
//                         var len = str.length;

//                         for (var i = 0; i < len; i++) {

//                            innerhtml += '<input type="text" style="margin-right:5px;" value="'+str[i].amount+'"/>'
//                                  + '<input type="text" style="margin-right:5px;" value="'+str[i].remark+'"/>'
//                                  + '<input type="text" style="margin-right:5px;" value="'+str[i].regist_date+'"/><br>'
//                         }
                        
//                         $('.noneline').html(innerhtml);
//                      }

//                   }, 'json');
   
//        });
</script>
</html>