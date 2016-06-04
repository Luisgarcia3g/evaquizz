class Maestro::DashboardController < ApplicationController
  def index
    @saludo = "Hola maestro"
  end


  def grupo
  @saludo = "Hola maestro"
  end

def especificacion

end

  def grafica
    @chart = LazyHighCharts::HighChart.new('graph' , :style=>"width: 600px") do |f|
  f.title(text: "Resultados Luis")
  f.xAxis(categories: ["Quizz 1", "Quizz 2", "Quizz 3", "Quizz 4", "Quizz 5"])
  f.series(name: "Calificación", yAxis: 0, data: [100, 90, 80, 70, 70])
  #f.series(name: "Population in Millions", yAxis: 1, data: [310, 127, 1340, 81, 65])

  f.yAxis [
    {title: {text: "Calificación", margin: 70} }
    #{title: {text: "Population in Millions"}, opposite: true},
  ]

  f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
  f.chart({defaultSeriesType: "column"})
end

@chart_globals = LazyHighCharts::HighChartGlobals.new do |f|
  f.global(useUTC: false)
  f.chart(
    backgroundColor: {
      linearGradient: [0, 0, 500, 500],
      stops: [
        [0, "rgb(255, 255, 255)"],
        [1, "rgb(240, 240, 255)"]
      ]
    },
    borderWidth: 2,
    plotBackgroundColor: "rgba(255, 255, 255, .9)",
    plotShadow: true,
    plotBorderWidth: 1
  )
  f.lang(thousandsSep: ",,")
  f.colors(["#90ed7d", "#f7a35c", "#8085e9", "#f15c80", "#e4d354"])
end

  end

def gestion
  @chart2 = LazyHighCharts::HighChart.new('graph' ) do |f|
f.title(text: "¿Cuál es el resultado de la sumatoria de las fuerzas?")
  f.xAxis(categories: ["Respuesta:"])


f.series(name: "Correcta (120N) ", yAxis: 0, data: [8])
f.series(name: "Incorrecta  (100N)", yAxis: 0, data: [3])
f.series(name: "Incorrecta  (200N)", yAxis: 0, data: [4])
f.series(name: "Incorrecta  (240N) ", yAxis: 0, data: [3])


f.yAxis [
  {title: {text: "Alumnos", margin: 70} }
  #{title: {text: "Population in Millions"}, opposite: true},
]

f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
f.chart({defaultSeriesType: "column"})
end

@chart_globals = LazyHighCharts::HighChartGlobals.new do |f|
f.global(useUTC: false)
f.chart(

  backgroundColor: {
    linearGradient: [0, 0, 500, 500],
    stops: [
      [0, "rgb(255, 255, 255)"],
      [1, "rgb(240, 240, 255)"]
    ]
  },
  borderWidth: 10,
  plotBackgroundColor: "rgba(255, 255, 255, .9)",
  plotShadow: true,
  plotBorderWidth: 1
)
f.lang(thousandsSep: ",,")
f.colors(["#24B00B", "#ff0000", "#FF0000", "#FF0000"])
end

@chart3 = LazyHighCharts::HighChart.new('graph') do |f|
f.title(text: "Pregunta 2")
f.xAxis(categories: ["Respuesta:"])


f.series(name: "Correcta (120N) ", yAxis: 0, data: [8])
f.series(name: "Incorrecta  (100N)", yAxis: 0, data: [3])
f.series(name: "Incorrecta  (200N)", yAxis: 0, data: [4])
f.series(name: "Incorrecta  (240N) ", yAxis: 0, data: [3])


f.yAxis [
{title: {text: "Alumnos", margin: 70} }
#{title: {text: "Population in Millions"}, opposite: true},
]

f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
f.chart({defaultSeriesType: "column"})
end

@chart_globals3 = LazyHighCharts::HighChartGlobals.new do |f|
f.global(useUTC: false)
f.chart(

backgroundColor: {
  linearGradient: [0, 0, 500, 500],
  stops: [
    [0, "rgb(255, 255, 255)"],
    [1, "rgb(240, 240, 255)"]
  ]
},
borderWidth: 10,
plotBackgroundColor: "rgba(255, 255, 255, .9)",
plotShadow: true,
plotBorderWidth: 1
)
f.lang(thousandsSep: ",,")
f.colors(["#ff0000", "#ff0000", "#FF0000", "#FF0000"])
end
@chart4 = LazyHighCharts::HighChart.new('graph' ) do |f|
f.title(text: "P3")
f.xAxis(categories: ["Respuesta:"])


f.series(name: "Correcta (120N) ", yAxis: 0, data: [8])
f.series(name: "Incorrecta  (100N)", yAxis: 0, data: [3])
f.series(name: "Incorrecta  (200N)", yAxis: 0, data: [4])
f.series(name: "Incorrecta  (240N) ", yAxis: 0, data: [3])


f.yAxis [
{title: {text: "Alumnos", margin: 70} }
#{title: {text: "Population in Millions"}, opposite: true},
]

f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
f.chart({defaultSeriesType: "column"})
end

@chart_globals = LazyHighCharts::HighChartGlobals.new do |f|
f.global(useUTC: false)
f.chart(

backgroundColor: {
  linearGradient: [0, 0, 500, 500],
  stops: [
    [0, "rgb(255, 255, 255)"],
    [1, "rgb(240, 240, 255)"]
  ]
},
borderWidth: 10,
plotBackgroundColor: "rgba(255, 255, 255, .9)",
plotShadow: true,
plotBorderWidth: 1
)
f.lang(thousandsSep: ",,")
f.colors(["#24B00B", "#ff0000", "#FF0000", "#FF0000"])
end



end

end
