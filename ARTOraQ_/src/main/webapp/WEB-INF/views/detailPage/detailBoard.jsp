<%@page import="dto.UploadFile"%>
<%@page import="dto.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%   Board viewBoard = (Board) request.getAttribute("viewBoard"); %>
<% UploadFile uploadFile = (UploadFile) request.getAttribute("uploadFile");%>
 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=viewBoard.getTitle() %></title>



<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="../css/board/detailBoard.css"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>    
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

    
</head>

<script type="text/javascript">


$(document).ready(function() {
   
   //목록 버튼
   $("#btnList").click(function() {
      $(location).attr('href', './infoBoard')
   })

   //수정 버튼
   $("#btnUpdate").click(function() {
      $(location).attr('href', './update?boardno=<%=viewBoard.getBoardno() %>')
   })

   //삭제버튼
   $("#btnDelete").click(function() {
      $(location).attr('href', './delete?boardno=<%=viewBoard.getBoardno() %>')
   })

})
</script>

  
 <body> 
<input type="hidden" name="infoId" id="infoId" value="<%=viewBoard.getBoardno() %>">
    <%@ include file="../layout/header.jsp" %>

            <!--  이미지박스   -->
            <div class="imgbox">
                <img class="innerimgbox" alt="둘이서" src="https://ifh.cc/g/7HVSz2.jpg">
            </div>
            
            <div id="exhibition_wrap">
                <div class="exhibition_box">
                <div>
                        <img class="exhibition_img" src="/upload/<%=uploadFile.getStoredname()%>">
               </div>
                   
         
                    <p class="p1">
                       <%=viewBoard.getTitle() %>
                    </p>


                    <!-- 소개 table 시작 -->
                    <table>


                        <tr>
                            <th>장소</th>
                            <td><%=viewBoard.getLocation() %></td>
                        </tr>

                        <tr>
                            <th>전시 기간</th>
                            <td><%=viewBoard.getPeriod() %></td>
                        </tr>

                        <tr>
                            <th>결제 금액</th>
                            <td><%=viewBoard.getPrice() %>원</td>
                        </tr>
                        
                  
                    </table>
                  
             <i onclick="cart()" class="bi bi-heart"></i>   
             
                    <div class="booking_button">
                        <a href="/reservation/reserve/reserve?board=1" target="_blank" style="color: #27ae60; font-size: 15px; font-weight: bold;">
                            <span class="txt">예매하기
                            </span>
                        </a>
                    </div>
                </div>


                  <div class="textbox" >
                        <p><%=viewBoard.getContent() %></p>
                        </div>
                        
                           
            </div>

       <%@ include file="tab_menu.jsp" %>
        
                     
  <!-- 첨부파일 -->
<div>
<% if ( uploadFile != null )  { %>
<a href="<%=request.getContextPath() %>/upload/<%=uploadFile.getStoredname()%>">
</a>
<% } %>
</div> 

            <br><br><br><br><br><br><br>
            
<input type="hidden" id="memid" value="<%=session.getAttribute("memid") %>">
   
<div id="btnBox" class="pull-right">

<% if( session.getAttribute("memid").equals("admin") ) { %> 
   <button id="btnList" class="btn btn-default">목록</button>
   <button id="btnUpdate" class="btn btn-default">수정</button>
   <button id="btnDelete" class="btn btn-default">삭제</button>
<% } %> 

</div>


<%@ include file="../layout/footer.jsp" %>


<!-- 위시리스트 -->
<script>
    var i = 0;
    $('.bi-heart').on('click',function(){
        if(i==0){
            $(this).removeClass('bi-heart');
            $(this).addClass('bi-heart-fill');
            i++;
        }else if(i==1){
            $(this).removeClass('bi-heart-fill');
            $(this).addClass('bi-heart');
            i--;
        }
        
    });
    
    function cart(){
       /* confirm("위시리스트에 넣으시겠습니까?") */
       
          var boardno = <%=viewBoard.getBoardno() %>  /* 게시물 제목 */
          
          $.ajax({
             type:"post",
             url: "/heart?boardno="+boardno,
              dataType:"html"
          }).done(function(result){
             if(result == 1){
                var msg = confirm("위시리스트에 등록 되었습니다. 마이페이지로 이동하시겠습니까?")
                if( msg == true ){
                $(location).attr('href', '/mypage')
                }else{
                   return false;
                }
                
             } else if( result == 0){   
                alert("위시리스트에서 삭제 되었습니다.")   
             }
          })   
       
    }
    

    
    function good(reid){
       /*  confirm("좋아요 하시겠습니까?") */
       
//          var reid = $("#good").val()
         /* alert(reid) *//* 댓글 번호 */
          
         $.ajax({
             type:"post",
             url: "/good?reid="+reid,
              dataType:"html"
          }).done(function(result){
             if(result == 1){
               /*  confirm("좋아요 하셨습니다") */
                find()
                //$(location).attr('href', '/mapage')
             } else if( result == 0){   
                /* alert("좋아요 안됩니다") */   
             }
          })   
       
    }
    
</script>

<script type="text/javascript">

function commentclear(){
   $("#cmContents").val("");
   
   $('input[name=reviewRating]').eq(4).attr("checked",true);
   $('input[name=reviewRating]').eq(3).attr("checked",false);
    $('input[name=reviewRating]').eq(2).attr("checked",false);
   $('input[name=reviewRating]').eq(1).attr("checked",false);
   $('input[name=reviewRating]').eq(0).attr("checked",false); 
}



function commentSave(){
   var boarno = <%=viewBoard.getBoardno() %>
   
   var data={
         rating:$('input[name=reviewRating]:checked').val(),
         recontent:$("#cmContents").val(),
         boardno:boarno,
         memid:$("#memid").val(), 
            }
   $.ajax({
      type:"post",
      url:"/Comment",
      data:JSON.stringify(data),
      contentType:"application/json; charset=utf-8",
      dataType:"html"
   }).done(function(result){

         console.log('통신성공')
         //$("#result").html( result ) 
         find()
         //$(".text").val("");
       
         $('input[name=reviewRating]').eq(1).attr("checked",false);
         $('input[name=reviewRating]').eq(0).attr("checked",false);
   }); 
}
function find(){
   var infoId = <%=viewBoard.getBoardno() %>;  <%-- //<%=viewBoard.getBoardno() %> --%>
/*    var data={
      infoId:infoId
   } */
   $.ajax({
      type:"post",
      url:"/Search?infoId="+infoId,
      contentType:"application/json; charset=utf-8",
      dataType:"html"
   }).done(function(result){

         console.log(result)
         $("#result").html( result ) 
         $(".text").val("");
         

   }); 
}

function del(reid){
   var a = confirm('정말 삭제 하시겠습니까?');
   /* var reid = $("#reid").val()
   alert(reid) */
   
   $.ajax({
      type:"post",
      url: "/delete/review?reid="+reid,
       dataType:"html"
   }).done(function(result){
      if(result == 1){
         console.log("삭제 성공")
         find();
      } else{}
         console.log("삭제 실패")
   })   
}

window.onload = function(){
   find();
   
}
</script>

</body>
</html>