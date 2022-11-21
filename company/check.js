function Check(){
	if(document.frm.bno.value.length == 0){
		alert("예약번호가 입력되지 않았습니다!");
		document.frm.bno.focus();
		return false;
	}
	if(document.frm.pno.value.length == 0){
		alert("사원번호가 입력되지 않았습니다!");
		document.frm.pno.focus();
		return false;
	}
	if(document.frm.date.value.length == 0){
		alert("근무일자가 입력되지 않았습니다!");
		document.frm.date.focus();
		return false;
	}
	if(document.frm.seatno.value.length == 0){
		alert("좌석번호가 입력되지 않았습니다!");
		document.frm.seatno.focus();
		return false;
	}
	success();
}
function success(){
	alert("참가신청이 정상적으로 등록되었습니다!");
	return true;
}
function Re(){
	alert("정보를 지우고 처음부터 다시 입력합니다!");
}
function Reserve(){
	if(document.frm.question.value.length == 0){
		alert("사원번호가 입력되지 않았습니다");
		document.frm.question.focus();
		return false;
	}
	return true;
}
function Go(){
	window.location.href = "index.jsp";
}
function gofind(){
	window.location.href = "find.jsp"
}