var rect1 = null; var rect2 = null; var rect3 = null; var rect4 = null; var rect5 = null;
if (document.getElementById("draggable1") != null){ var t1 = document.getElementById("draggable1"); }
if (document.getElementById("draggable2") != null){ var t2 = document.getElementById("draggable2"); }
if (document.getElementById("draggable3") != null){ var t3 = document.getElementById("draggable3"); }
if (document.getElementById("draggable4") != null){ var t4 = document.getElementById("draggable4"); }
if (document.getElementById("draggable5") != null){ var t5 = document.getElementById("draggable5"); }
// set up save layout event
document.getElementById("save_sub").onclick = function(){
        var array = [];
        if (t1 != null){  var location1 = t1.offsetLeft; array.push(location1); }
        if (t2 != null){  var location2 = t2.offsetLeft; array.push(location2); }
        if (t3 != null){  var location3 = t3.offsetLeft; array.push(location3); }
        if (t4 != null){  var location4 = t4.offsetLeft; array.push(location4); }
        if (t5 != null){  var location5 = t5.offsetLeft; array.push(location5); }
        array.sort(function(a, b){return b-a});
        var count = 0; var l1 = 100;var l2 = 100; var l3 = 100; var l4 = 100; var l5 = 100;
        while(array.length > 0 ){
            var out = array.pop(); count ++;
            if (out == location1){ l1 = count; }
            else if (out == location2){ l2 = count;  }
            else if (out == location3){ l3 = count;  }
            else if (out == location4){ l4 = count;  }
            else{ l5 = count;  }        }
        window.open("/apps/getOrder?l1=" + l1 + "&" + "l2=" + l2 + "&" + "l3=" + l3 + "&" + "l4=" + l4 +
            "&" + "l5=" + l5, "_self")    }