function Check(){
	if(document.frm.attid.value.length == 0){
		alert("참가번호가 입력되지 않았습니다!");
		document.frm.attid.focus();
		return false;
	}
	if(document.frm.attname.value.length == 0){
		alert("참가지명이 입력되지 않았습니다!");
		document.frm.attname.focus();
		return false;
	}
	if(document.frm.attyear.value.length == 0 || document.frm.attmonth.value.length == 0 || document.frm.attday.value.length == 0){
		alert("생년월일이 입력되지 않았습니다!");
		document.frm.attyear.focus();
		return false;
	}
	if(document.frm.gender.value.length == 0){
		alert("성별이 선택되지 않았습니다!");
		document.frm.gender.focus();
		return false;
	}
	if(document.frm.strong.value.length == 0){
		alert("특지가 선택되지 않았습니다!");
		document.frm.strong.focus();
		return false;
	}
	if(document.frm.enter.value.length == 0){
		alert("소속사가 입력되지 않았습니다!");
		document.frm.enter.focus();
		return false;
	}
	success();
}
function success(){
	alert("참가신청이 정상적으로 등록되었습니다!");
	return true;
}
function Re(){
	alert("정보를 지우고 다시 입력합니다!");
}