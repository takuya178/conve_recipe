Chartkick.options = {
  width: '250px',
  height: '300px',

  message: {empty: "データがありません"},
  thousands: ",", 
  legend: false,
  library: { # ここからHighchartsのオプション
    title: {
      align: 'center',
      verticalAlign: 'middle',
    },
    xAxis: {
      visible: false
    },
    yAxis: {
      visible: false
    },
    chart: {
      backgroundColor: 'none',
      plotBorderWidth: 0, 
      plotShadow: false
    },
    plotOptions: {
      bar: {
        dataLabels: {
          enabled: true, 
          distance: -40, # ラベルの位置調節
          allowOverlap: false, # ラベルが重なったとき、非表示にする
          style: { #ラベルフォントの設定
            color: '#555', 
            textAlign: 'center', 
            textOutline: 0, #デフォルトではラベルが白枠で囲まれていてダサいので消す
          }
        },
      }
    },
  }
}