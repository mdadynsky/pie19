<#import "/spring.ftl" as spring/>
<#import "../../theme/layout.ftl" as layout/>

<@layout.layout>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = new google.visualization.DataTable();
            data.addColumn('number', 'x');
            data.addColumn('number', 'values');
            data.addColumn({id:'i0', type:'number', role:'interval'});
            data.addColumn({id:'i1', type:'number', role:'interval'});
            data.addColumn({id:'i2', type:'number', role:'interval'});
            data.addColumn({id:'i2', type:'number', role:'interval'});
            data.addColumn({id:'i2', type:'number', role:'interval'});
            data.addColumn({id:'i2', type:'number', role:'interval'});

            data.addRows([
                [1, 100, 90, 110, 85, 96, 104, 120],
                [2, 120, 95, 130, 90, 113, 124, 140],
                [3, 130, 105, 140, 100, 117, 133, 139],
                [4, 90, 85, 95, 85, 88, 92, 95],
                [5, 70, 74, 63, 67, 69, 70, 72],
                [6, 30, 39, 22, 21, 28, 34, 40],
                [7, 80, 77, 83, 70, 77, 85, 90],
                [8, 100, 90, 110, 85, 95, 102, 110]]);

            // The intervals data as narrow lines (useful for showing raw source data)
            var options_lines = {
                title: 'Line intervals, default',
                curveType: 'function',
                lineWidth: 4,
                intervals: { 'style':'line' },
                legend: 'none'
            };

            var chart_lines = new google.visualization.LineChart(document.getElementById('chart_lines'));
            chart_lines.draw(data, options_lines);
        }
    </script>
    <div class="row p-3">
        <div class="col">
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="/admin/report/geoChat">Карта</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="#">График интевалов</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/admin/report/donut">Круговая</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="row">
        <div class="col-9">
            <div id="chart_lines"></div>
        </div>
    </div>



</@layout.layout>