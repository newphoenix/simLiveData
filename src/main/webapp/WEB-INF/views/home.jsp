<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/sockjs-1.1.2.min.js"></script>
<script type="text/javascript" src="/resources/stomp.js"></script>
<script type="text/javascript" src="/resources/home.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js"></script>
<title>Crypto price data</title>
</head>
<body>



<div class="container">
<div class="col-12 col-md-10 center">

<div class="row">
<div class="col-sm-3 d-flex align-items-center justify-content-center">
<img src="/resources/images/bitcoin.jpg" class="img-fluid" width="150px">
</div>
<div class="col-sm-8">
<canvas id="bitChart" width="150" height="40"></canvas>
</div>
</div>
<hr>
<div class="row">
<div class="col-sm-3 d-flex align-items-center justify-content-center">
<img src="/resources/images/doge.png" class="img-fluid" width="150px">
</div>
<div class="col-sm-8">
<canvas id="dogeChart" width="150" height="40"></canvas>
</div>
</div>
<hr>
<div class="row">
<div class="col-sm-3 d-flex align-items-center justify-content-center">
<img src="/resources/images/litecoin.png" class="img-fluid" width="150px">
</div>
<div class="col-sm-8">
<canvas id="liteChart" width="150" height="40"></canvas>
</div>
</div>


</div>
</div>

<script>

var ctx = [];

ctx[0] = document.getElementById('bitChart').getContext('2d');
ctx[1] = document.getElementById('dogeChart').getContext('2d');
ctx[2] = document.getElementById('liteChart').getContext('2d');

var colors = ['rgba(255, 99, 132, 1)','rgba(54, 162, 235, 1)']
var charts = [];

for(let i=0;i<data.length; i++){
	 
	 charts[i] = new Chart(ctx[i], {
		    type: 'line',
		    data: {
		        labels: Array.from(Array(60).keys()),
		        datasets: [{
		            label: 'Prices',
		            data: data[i],
		            borderColor: colors,
		            borderWidth: 1
		        }]
		    },
		    options: {
		        scales: {
		            y: {
		                beginAtZero: true
		            }
		        }
		    }
		});
	 
}

window.setInterval(function(){
	charts.forEach(chart => chart.update())
}, 1000);
</script>

</body>
</html>