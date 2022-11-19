function Check(){
	if(document.frm.no.value.length == 0){
		alert("주민번호가 입력되지 않았습니다!");
		document.frm.no.focus();
		return fasle;
	}
	if(document.frm.name.value.length == 0){
		alert("성명 입력되지 않았습니다!");
		document.frm.name.focus();
		return fasle;
	}
	if(document.frm.vno.value.length == 0){
		alert("후보번호가 선택되지 않았습니다!");
		document.frm.vno.focus();
		return fasle;
	}
	if(document.frm.vtime.value.length == 0){
		alert("투표시간이 입력되지 않았습니다!");
		document.frm.vtime.focus();
		return fasle;
	}
	if(document.frm.vplace.value.length == 0){
		alert("투표장소가 입력되지 않았습니다!");
		document.frm.vplace.focus();
		return fasle;
	}
	if(document.frm.check.value.length == 0){
		alert("유권자확인이 선택되지 않았습니다!");
		document.frm.check.focus();
		return fasle;
	}
	success();
}
function success(){
	alert("투표하기 정보가 정상적으로 등록되었습니다!");
	return true;
}
function Re(){
	alert("정보를 지우고 처음부터 다시 입력합니다!");
}