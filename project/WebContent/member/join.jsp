<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css" type="text/css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	
	//아이디 중복체크
	function check() {
		
		if($(".id").val() == "&nbsp;" || $(".id").val() == null || $(".id").val() == ""){
			alert("아이디를 입력하세요");
			$(".id").focus();
	
		}else{
			window.open("joinIdcheck.jsp?id=" + $(".id").val());
		}

	}
	function checkfo() {
	
		//아이디 미 입력 시
		if($(".id").val() == ""){
			alert("아이디를 입력하세요");
			return false;
		}
	
		//이름 미 입력 시
		if($(".name").val() == ""){
			alert("이름를 입력하세요");
			return false;
		}
		
		//비밀번호 미 입력 시
		if($(".pw").val() == ""){
			alert("비밀번호를 입력하세요");
			return false;
		}
		
		//비밀번호 확인 미 입력 시
		if($(".pw2").val()==""){
			alert("비밀번호를 확인해주세요");
			return false;
		}
	
		//휴대폰 번호 미 입력 시
		if($(".hp").val() == ""){
			alert("휴대폰 번호를 입력하세요");
			return false;
		}
		//이메일 미 입력 시
		if($(".email").val() == ""){
			alert("이메일를 입력하세요");
			return false;
		}
		
		//주소 미입력 시
		if($("#sample5_address").val() == ""){
			alert("주소를 입력하세요");
			return false;
		}
		
		//비밀번호 다를시
		if($(".pw").val() != $(".pw2").val()){
			alert("비밀번호를 다르게 입력했습니다");
			return false;
		}
		
	}
</script>

</head>
<body>
		<!-- 헤더들어가는 곳 -->
		<jsp:include page="../inc/top.jsp"></jsp:include>
		<!-- 헤더들어가는 곳 -->
<div id="body">
	<div id="wrap">

		<!-- 본문내용 -->
		<article>
			<h1>회원가입</h1>
			<form action="joinPro.jsp" id="join" method="post" name="fo" onsubmit="return checkfo()">
				<fieldset>
					<legend>회원정보 입력</legend>
				<table style="color: white; text-align: left; margin: 90px"
							class="table">
							<tr>
								<td>아이디</td>
								<td><input type="text" name="id" class="id"/> <input
									type="button" value="아이디중복확인" class="dup" onclick="check()" />
								</td>
							</tr>
						
							<tr>
								<td>이름</td>
								<td><input type="text" name="name" class="name" /></td>
							</tr>
					
							<tr>
								<td>비밀번호</td>
								<td><input type="password" name="pass" class="pw" /></td>
							</tr>
							<tr>
								<td>비밀번호 확인</td>
								<td><input type="password" name="pass2" class="pw2" /></td>
							</tr>
							<tr>
								<td>휴대폰 번호</td>
								<td><input type="text" name="hp" class="hp"
									placeholder="예) 010-1234-5678" /></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><input type="text" name="email" class="email" /></td>
							</tr>
						
						</table>
				</fieldset>
	
				<fieldset>
					<legend>부가정보</legend>
				<input type="text" id="sample5_address" placeholder="주소" name="address">
				<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
				<div id="map" style="width:970px;height:300px;margin-top:10px;display:none"></div>

				</fieldset>
				<div class="clear"></div>
				<div id="buttons">
					<input type="submit" value="회원가입" class="submit"> 
					<input type="reset" value="다시작성" class="cancel">
				</div>
			</form>
		</article>
		<!-- 본문내용 -->
	</div>
</div>	
		<!-- 푸터들어가는 곳 -->
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
		<!-- 푸터들어가는 곳 -->


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f3203a9efe544e2769a7c52719a23470&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
    	
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
	
</body>
</html>