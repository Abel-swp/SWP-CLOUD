/**
 * script.js
 */
	
	var isCheck = false;
	var use;
	var regex1 = /^[a-z0-9]{3,8}$/;
	var regex2 = /^\d{4}\/\d{2}\/\d{2}$/;
	var regex3 = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+$/;
	
	// 중복체크버튼
	function duplicate(){
		
		isCheck = true;
		
		if($('input[placeholder="신규 아이디 입력"]').val() == "") {
			alert('(중복체크버튼)아이디를 입력하세요.');
			return;
		}
		
		$.ajax({
			url: "B2_validation.jsp",
			data:({
				id : $('input[placeholder="신규 아이디 입력"]').val()
			}),
			success:function(data){
				if($.trim(data) == 'YES'){
					$('#idmessage').html("<font color=red>사용 가능합니다.</font>");
					$('#idmessage').css('display','inline');
					use = "possible";
				}
				else{
					$('#idmessage').html("<font color=red>이미 사용중인 아이디입니다.</font>");
					$('#idmessage').show();
					use = "impossible";
				}
			}
		});
		
	}
	
	// ready()
	$(document).ready(function(){
		
		$('input[placeholder="신규 아이디 입력"]').keydown(function(){
			$('#idmessage').css('display','none');
			isCheck = false;
		});
		
	});
	
	// 가입하기버튼
	function writeSave(){

		if($('input[placeholder="신규 아이디 입력"]').val() == ""){
			alert("(가입하기버튼)아이디를 입력하세요.");
			$('input[placeholder="신규 아이디 입력"]').focus();
			return false;
		}
		
		if(isCheck == false){
			alert("(가입하기버튼)중복체크를 하세요.");
			return false;
		}
		
		if(use == "impossible"){
			alert("(가입하기버튼)이미 사용중인 아이디입니다.");
			return false;
		}
		
		// ──────────────────────────────────────────────────────────────────────────────
		
		if($('input[placeholder="신규 비밀번호 입력"]').val() == '') {
			alert('비밀번호를 입력하세요.');
			$('input[placeholder="신규 비밀번호 입력"]').focus();
			return false;
		} else if($('input[placeholder="신규 비밀번호 입력"]').val().search(regex1) == -1) {
			alert('잘못된 형식의 비밀번호입니다.');
			$('input[placeholder="신규 비밀번호 입력"]').focus();
			return false;
		}
		
		if($('input[placeholder="신규 비밀번호 확인 입력"]').val() == '') {
			alert('비밀번호 확인을 입력하세요.');
			$('input[placeholder="신규 비밀번호 확인 입력"]').focus();
			return false;
		}
		
		if($('input[placeholder="신규 비밀번호 입력"]').val() != $('input[placeholder="신규 비밀번호 확인 입력"]').val()) {
			alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
			$('input[placeholder="신규 비밀번호 확인 입력"]').val('');
			$('input[placeholder="신규 비밀번호 확인 입력"]').select();
			return false;
		}
		
		if($('input[placeholder="신규 이메일 입력"]').val() == '') {
			alert('이메일을 입력하세요.');
			$('input[placeholder="신규 이메일 입력"]').focus();
			return false;
		} else if($('input[placeholder="신규 이메일 입력"]').val().search(regex3) == -1) {
			alert('올바른 이메일 형식이 아닙니다.');
			$('input[placeholder="신규 이메일 입력"]').focus();
			return false;
		}
		
		if($('input[placeholder="신규 이름 입력"]').val() == '') {
			alert('이름을 입력하세요.');
			$('input[placeholder="신규 이름 입력"]').focus();
			return false;
		}
		
		if($('input[placeholder="주민등록번호 앞 6자리"]').val() == '' || $('input[placeholder="주민등록번호 뒤 7자리"]').val() == '') {
			alert('주민등록번호를 입력하세요.');
			$('input[placeholder="주민등록번호 앞 6자리"]').focus();
			return false;
		} else if( isNaN($('input[placeholder="주민등록번호 앞 6자리"]').val()) || isNaN($('input[placeholder="주민등록번호 뒤 7자리"]').val()) ) {
			alert('주민등록번호를 숫자로 입력하세요.');
			$('input[placeholder="주민등록번호 앞 6자리"]').focus();
			return false;
		}
		
		if($('input[placeholder="1234"]').val() == '' || $('input[placeholder="5678"]').val() == '') {
			alert('전화번호를 입력하세요.');
			$('input[placeholder="5678"]').focus();
			return false;
		} else if( isNaN($('input[placeholder="1234"]').val()) || isNaN($('input[placeholder="5678"]').val()) ) {
			alert('전화번호를 숫자로 입력하세요.');
			$('input[placeholder="5678"]').focus();
			return false;
		}
		
		if($('input[placeholder="1357"]').val() == '' || $('input[placeholder="2468"]').val() == '') {
			alert('휴대 전화 번호를 입력하세요.');
			$('input[placeholder="1357"]').focus();
			return false;
		} else if( isNaN($('input[placeholder="1357"]').val()) || isNaN($('input[placeholder="2468"]').val()) ) {
			alert('휴대 전화 번호를 숫자로 입력하세요.');
			$('input[placeholder="1357"]').focus();
			return false;
		}
		
		if($('input[placeholder="2020/01/01"]').val() == '') {
			alert('가입일자를 입력하세요.');
			$('input[placeholder="2020/01/01"]').focus();
			return false;
		} else if($('input[placeholder="2020/01/01"]').val().search(regex2) == -1) {
			alert('잘못된 형식의 가입일자입니다.');
			$('input[placeholder="2020/01/01"]').focus();
			return false;
		}
		
	} // writeSave() 가입하기버튼(submit)
	
