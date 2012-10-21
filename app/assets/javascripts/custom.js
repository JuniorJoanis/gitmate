var map;
function searchDialog(){
	$( "#dialog" ).dialog({ title: "Where are my gitmates?",draggable: true, width:300, modal: true, resizable: false, maxHeight: 300, dialogClass: "pop-new-mission" });	
}
$(document).ready(function(){
	$( ".nav li.search" ).click(function(){
	  searchDialog();
	});
	if ($(".map-content-blur")[0] != undefined) {searchDialog();}
	$("button.btn").click(function(){
		var username = $("#git-username").attr("value");
		var repository = $("#git-repository").attr("value");
		location.href = "/mates/index?username="+username+"&repo="+repository
		// $.getJSON( '/mates/index.json?username=peter-murach&repo=github', function(data) { 
		// 	$.each( data, function(i, marker) {
		// 		if (marker != undefined) {
		// 		  Gmaps.map.addMarkers(data); 	
		// 		}
		// 	});
		// }); 
	});
});
