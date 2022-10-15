<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
        <title>살바도르 달리전</title>
        



        <style>
            /* 상단 이미지박스  */
            .imgbox {
                width: 100%;
                height: 40%;
                z-index: 10;
                left: -5.5%;
                top: -5%
            }

            .innerimgbox {
                width: 100%;
               /*  height: 85%; */
                margin-top: 50px;
            }

            #exhibition_wrap {
                margin-top: 300px;
                margin-left: 300px
            }

            .exhibition_box {

                position: relative;
                padding-left: 470px;

                margin-right: 300px;
                height: 470px;
                margin-bottom: 60px;




            }

            .exhibition_box .exhibition_img {

                position: absolute;
                width: 380px;
                height: 470px;
                left: 0;
                top: 0;

            }

            table {
                text-align: left;
                margin: 30px 25px;
                margin-bottom: 155px;

                border-collapse: separate;
                text-indent: initial;
                border-spacing: 2px;

            }

            th {

                padding: 3px;
                color: #232729;
                font-size: 16px;
                line-height: 2.7;

                width: 110px;
                vertical-align: top;
            }

            td {
                font-size: 16px;
                line-height: 2.7;
                white-space: pre-wrap;
                vertical-align: top;
                color: #232729;
            }


            p.p1 {

                padding: 30px 25px;
                margin: 0;
                font-size: 30px;
                font-weight: bold;
                border-top: 1px solid #d3d3d3;
                position: relative;

            }

            .exhibition_box .booking_button {

                border: 1px solid #333;
                border-color: #27ae60;

                width: auto;
                height: 55px;
                line-height: 55px;
                text-align: center;
            }
            
        .bi-heart{
            font-size: 30px;
            line-height: 30px;
            color:crimson;
            position:absolute;
            margin-left: 206px;
   			margin-top: -55px;
        }

        .bi-heart-fill{
            font-size: 30px;
            line-height: 30px;
            color:crimson;
            position:absolute;
            margin-left: 206px;
   			margin-top: -55px;
        }
            
        </style>
    </head>



        <body>
    <%@ include file="../layout/header.jsp" %>

            <!--  이미지박스   -->
            <div class="imgbox">
                <img class="innerimgbox" alt="둘이서" src="https://ifh.cc/g/7HVSz2.jpg">
            </div>

				
			
            <div onclick="cart()" id="exhibition_wrap">


                <div class="exhibition_box">
                    <div>
                        <img class="exhibition_img" src="https://ifh.cc/g/Xbab2f.jpg">

                    </div>


                    <p class="p1">살바도르 달리전</p>


                    <!-- 소개 table 시작 -->
                    <table>


                        <tr>
                            <th>장소</th>
                            <td>DDP 동대문</td>
                        </tr>

                        <tr>
                            <th>전시 기간</th>
                            <td>2021년 11월 27일 - 2023년 04월 03일</td>
                        </tr>

                        <tr>
                            <th>결제 금액</th>
                            <td>17000원</td>
                        </tr>




                    </table>
	
					<i class="bi bi-heart"></i>	
				
                    <div class="booking_button">
                        <a href="" target="_blank" style="color: #27ae60; font-size: 15px; font-weight: bold;">
                            <span class="txt">예매하기
                            </span>
                        </a>


                    </div>
                </div>


            </div>

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
    	
    		var title = $(".p1").html()  /* 게시물 제목 */
    		
    		$.ajax({
    			type:"post",
    			url: "/wishlist?title="+title,
    		 	dataType:"html"
    		}).done(function(result){
    			if(result == 1){
    				confirm("위시리스트에 등록 되었습니다. 마이페이지로 이동하시겠습니까?")
    				//$(location).attr('href', '/mapage')
    			} else if( result == 0){	
    				alert("위시리스트에서 삭제 되었습니다.")	
    			}
    		})	
    	
    }
    

</script>
	
        
   			  <%@ include file="./tab_menu.jsp" %> 
                     
                   

            <br><br><br><br><br>

            <footer>
                <%@ include file="../layout/footer.jsp" %>
            </footer>

        </body>

    </html>