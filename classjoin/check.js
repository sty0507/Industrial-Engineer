function golist(){
	window.location = "list.jsp";
	return true;
}

function Check(){
	if(document.frm.classid.value.length == 0){
		alert("교과목 코드가 입력되지 않았습니다.");
		frm.classid.focus();
		return false;
	}
	if(document.frm.classname.value.length == 0){
		alert("교과목명이 입력되지 않았습니다.");
		frm.classname.focus();
		return false;
	}
	if(document.frm.classscore.value.length == 0){
		alert("학점이 입력되지 않았습니다.");
		frm.classscore.focus();
		return false;
	}
	if(document.frm.lecter.value == "0"){
		alert("담당강사가 선택되지 않았습니다.");
		frm.lecter.focus();
		return false;
	}
	if(document.frm.week.value == ""){
		alert("요일이 선택되지 않았습니다.");
		frm.week.focus();
		return false;
	}
	if(document.frm.start.value.length == 0){
		alert("시작 시간이 입력되지 않았습니다.");
		frm.start.focus();
		return false;
	}
	if(document.frm.finish.value.length == 0){
		alert("종료 시간이 입력되지 않았습니다.");
		frm.finish.focus();
		return false;
	}
}
function Insert(){
	if(Check() == true){
		alert("교과목 등록이 완료되었습니다!");
		window.location = "list.jsp";
		return true;
	}
	else{
		return false;
	}
	
	
}
function success(){
	if(Check() == true){
		alert("교과목 수정이 완료되었습니다.");
		window.location = "list.jsp";
	}
	else{
		return false;
	}
	
}
function fail(){
	alert("교과목 수정이 취소되었습니다.");
}