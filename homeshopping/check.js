function joinCheck(){
	if(document.frm.custname.value.length == 0){
		alert("회원성명이 입력되지 않았습니다.");
		frm.custname.foucus();
		return false;
	}
	if(document.frm.phone.value.length == 0){
		alert("회원전화가 입력되지 않았습니다.");
		frm.phone.foucus();
		return false;
	}
	if(document.frm.address.value.length == 0){
		alert("회원주소가 입력되지 않았습니다.");
		frm.address.foucus();
		return false;
	}
	if(document.frm.joindate.value.length == 0){
		alert("가입일자가 입력되지 않았습니다.");
		frm.joindate.foucus();
		return false;
	}
	if(document.frm.grade.value.length == 0){
		alert("고객등급이 입력되지 않았습니다.");
		frm.grade.foucus();
		return false;
	}
	if(document.frm.city.value.length == 0){
		alert("도시가 입력되지 않았습니다.");
		frm.city.foucus();
		return false;
	}
}
function search(){
	window.location = "list.jsp"
}