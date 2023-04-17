/**
 * 
 */
var currentStyle = {"fontFamily":"","fontWeight":"","fontStyle":"","color":"","background":"","textAlign":""};

function setCursor(node){
		var cursor = document.createElement("span");
		cursor.id = "cursor";
		if(document.querySelector(".whiteSpace").childNodes.length>0){
			document.querySelector(".whiteSpace").lastChild.append(cursor);
		}else{
			document.querySelector(".whiteSpace").append(cursor);
		}
		
		var range = document.createRange();
		range.selectNode(cursor);
		var selection = window.getSelection();
		selection.removeAllRanges();
		selection.addRange(range);
		
		node.blur();
	}

function getCursor(node){
		var range = window.getSelection().getRangeAt(0).deleteContents();
		$("#cursor").focus();
		$("#cursor").remove();
}

function documentKeypress(targetTag){
	document.onkeypress = function(event){
		setCursor(targetTag);
		
		if(event.keyCode==13){
			event.preventDefault();
			let br = document.createElement("br");
			targetTag.append(br);
			fn_styleChange(targetTag);
		}else if(event.keyCode==32){
			event.preventDefault();
			let space = document.createElement("span");
			space.innerHTML="&nbsp;";
			targetTag.append(space);
		}else{
			event.preventDefault();
			targetTag.append(event.key);
			fn_styleChange(targetTag);
		}
		
		getCursor(targetTag);
	}
}

function fn_styleChange(tag){
	tag.style.fontWeight = currentStyle["fontWeight"];
	tag.style.fontFamily = currentStyle["fontFamily"];
	tag.style.fontStyle = currentStyle["fontStyle"];
	tag.style.textDecoration = currentStyle["textDecoration"];
	tag.style.color=currentStyle["color"];
	tag.style.background=currentStyle["background"]
	tag.style.textAlign=currentStyle["textAlign"];
}