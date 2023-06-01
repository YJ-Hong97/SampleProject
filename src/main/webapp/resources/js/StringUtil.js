/**
 * 
 */
function blindNick(nick){
	let first = "";
	let second = "";
	console.log(nick.length)
	if(nick.length>3){
		first = nick.substring(0,3);
		console.log(first)
		second = nick.substring(3,nick.length).replaceAll(/[a-z|A-Z|ㄱ-ㅎ|가-힣|0-9|\@|\.]/g,"*");
	}else{
		second = nick.replaceAll(/[a-z|A-Z|ㄱ-ㅎ|가-힣|0-9|\@|\.]/g,"*");
	}
	
	return first+second;
}