$(document).ready(function(){
	connect();
});


var stompClient = null;
var data = 	[[],[],[]];

function connect() {
	 var socket = new SockJS('/msg');
	  stompClient = Stomp.over(socket);
	  stompClient.connect({}, function (frame) {
		
		stompClient.subscribe('/topic/price_data', function (msg) {	
			 var d = JSON.parse(msg.body);		
			 data.forEach((e,i)=> {
				e.push(d[i].price)
				e.length == 60 ? e.shift() : ""
			  });	
		
		});
		});
	  
	 
	}