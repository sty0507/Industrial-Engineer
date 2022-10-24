/**
 * 
 */
 let 나눌수 = 1;
 function Check(){
     if(document.frm.month.value.length == 0){
         alert("수강월이 입력되지 않았습니다.");
         document.frm.month.focus();
         return false;
     }
     if(document.frm.price.value.length == 0){
         alert("수강월이 입력되지 않았습니다.");
         document.frm.price.focus();
         return false;
     }
     success();
 }
 function success(){
     alert("수강신청이 정상적으로 완료되었습니다.");
 }
 
 function changeNameHandler(){
     changeNum();
     init();
 }
 
 
 function changeNum(){
     var sel = document.getElementById("cname");
     var cno = document.getElementById("cno");
     cno.value = sel.options[sel.selectedIndex].value;
 }
 
 
 function init() {
     saveDivde();
     cost();
 }
 
 function saveDivde() {
     if(document.frm.cname.value >= 20000){
         나눌수 = 2;
     }
     else{
         나눌수 = 1;
     }
 }
 
 function cost() {
     let priceList = [100000, 200000,30000,400000];
     let data = document.frm.className;
     document.frm.price.value = priceList[data.value-1] / 나눌수;
     
     //price.value = calcedPrice;
 }
 function rewrite(){
     alert("정보를 지우고 처음부터 다시 입력합니다!");
     location.reload();
 }
 
 init();