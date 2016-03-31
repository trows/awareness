var flag = 0;
function createForm() {
    flag += 1;
    var div = document.getElementById("test");
    var tr = document.createElement("tr");
    var input1 = document.createElement("input");
    var br = document.createElement("br");
    input1.type = "text";
    input1.id = "input" + flag;
    input1.value = "我被创建出来了";
    var del = document.createElement("input");
    del.type = "button";
    del.value = "点我删除当前文本框";

    tr.appendChild(input1);
    tr.appendChild(del);

    del.setAttribute("onclick", "deleteForm(this)");
    div.appendChild(tr);

}
function deleteForm(obj) {

    var input = obj.parentNode;
    input.parentNode.removeChild(input);
}
