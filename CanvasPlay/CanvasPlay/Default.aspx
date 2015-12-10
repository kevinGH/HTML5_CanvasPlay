<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CanvasPlay.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        html, body {
            margin: 0px;
            width: 100%;
            height: 100%;
        }

        canvas {
            width: 480px;
            height: 640px;
        }
    </style>
    <script>
        var imgFileName = ['ZOE_0068_1.jpg', 'ZOE_0068_2.jpg', 'ZOE_0068_3.jpg', 'ZOE_0068_4.jpg', 'ZOE_0068_5.jpg', 'ZOE_0068_6.jpg', 'ZOE_0068_7.jpg', 'ZOE_0068_8.jpg', 'ZOE_0068_9.jpg', 'ZOE_0068_10.jpg', 'ZOE_0068_11.jpg', 'ZOE_0068_12.jpg', 'ZOE_0068_13.jpg', 'ZOE_0068_14.jpg', 'ZOE_0068_15.jpg', 'ZOE_0068_16.jpg', 'ZOE_0068_17.jpg', 'ZOE_0068_18.jpg', 'ZOE_0068_19.jpg', 'ZOE_0068_20.jpg', 'ZOE_0068_21.jpg', 'ZOE_0068_22.jpg'];
        var frameIndex = 0;
        var ctx;
        var fps = 4;

        function init() {
            ctx = document.getElementById('canvas').getContext('2d');

            draw(ctx, "/SampleImage/" + imgFileName[frameIndex++]);
        }

        function draw(container, sourcePath) {
            var img = new Image();
            img.onload = function () {
                document.getElementById("log").innerHTML += " draw " + img.src + " " + new Date() + "</br>";

                container.drawImage(img, 0, 0, 480, 640);

                if (frameIndex < imgFileName.length)
                    setTimeout('draw(ctx, "/SampleImage/" + imgFileName[frameIndex++])', 250);
            }
            var tempDate = new Date();

            document.getElementById("log").innerHTML += "load " + sourcePath + " " + tempDate.getFullYear() + '-' + (tempDate.getMonth() + 1) + '-'
+ tempDate.getDate() + ' ' + tempDate.getHours() + ':' + tempDate.getMinutes() + ':'
+ tempDate.getSeconds() + tempDate.getMilliseconds();
            img.src = sourcePath;
        }

        window.onload = function () {
            init();
        };
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <canvas id="canvas" width="480" height="640"></canvas>
            <div id="log"></div>
        </div>
    </form>
</body>
</html>
