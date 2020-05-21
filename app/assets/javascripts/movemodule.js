// make list (logo with link) draggable
$(function() { $( ".list" ).draggable(); });
$(document).on("mouseup", ".list", function(){
    var elem = $(this),
        id = elem.attr('id'),
        pos = elem.position();
    console.log('Left: '+pos.left+'; Top:'+pos.top);
});

$(document).on("ready", "#save", function(){
    $(".list").each(function(){
        var elem = $(this),
            id = elem.attr('id');
        newleft = elem.attr('data-left'),
            newtop = elem.attr('data-top');
        $.ajax({
            type: 'POST',
            url: 'save-position.php',
            data: {'id':id, 'newleft': newleft, 'newtop':newtop},
            success: function(result){
                $("#message").show(200);
            }            })        })    })
