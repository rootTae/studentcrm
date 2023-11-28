
var getChart=(function(chartData) {

  var data = {
  	labels: ["국어", "영어", "수학", "평균"],
    datasets: [{
      label: '# of Votes',
      data: [chartData.korScore, chartData.engScore, chartData.mathScore, chartData.avgScore],
      backgroundColor: [
        'rgba(255, 99, 132, 0.2)',
        'rgba(54, 162, 235, 0.2)',
        'rgba(75, 192, 192, 0.2)',
        'rgba(255, 159, 64, 0.2)'
      ],
      borderColor: [
        'rgba(255,99,132,1)',
        'rgba(54, 162, 235, 1)',
        'rgba(75, 192, 192, 1)',
        'rgba(255, 159, 64, 1)'
      ],
      borderWidth: 1,
      fill: false
    }]
  };
  
  var multiLineData = {
    labels: ["평균(국어)", "평균(영어)", "평균(수학)", "평균(전체)"],
    datasets: [{
        label: '학생 성적',
        data: [chartData.korScore, chartData.engScore, chartData.mathScore, chartData.avgScore],
        borderColor: [
          '#0090E7'
        ],
        borderWidth: 2,
        fill: false
      },
      {
        label: '전체 평균',
        data: [chartData.korAvg, chartData.engAvg, chartData.mathAvg, chartData.totalAvgScore],
        borderColor: [
          '#007f5f'
        ],
        borderWidth: 2,
        fill: false
      }
         
    ]
  };

var options = {
    scales: {
        yAxes: [{
            ticks: {
                beginAtZero: true,
                min: 0, 
                max: 100  
            },
            gridLines: {
                color: "rgba(204, 204, 204,0.1)"
            }
        }],
        xAxes: [{
            gridLines: {
                color: "rgba(204, 204, 204,0.1)"
            }
        }]
    },
    legend: {
        display: false
    },
    elements: {
        point: {
            radius: 0
        }
    }
};

  if (($("#barChart").length)) {
    var barChartCanvas = $("#barChart").get(0).getContext("2d");
    var barChart = new Chart(barChartCanvas, {
      type: 'bar',
      data: data,
      options: options
    });
  }  

  if ($("#linechart-multi").length) {
    var multiLineCanvas = $("#linechart-multi").get(0).getContext("2d");
    var lineChart = new Chart(multiLineCanvas, {
      type: 'line',
      data: multiLineData,
      options: options
    });
  }
  
  
})
