﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default3.aspx.cs" Inherits="CanvasPlay.Default3" %>

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
            width: 1280px;
            height: 720px;
        }
    </style>
    <script>
        //var imgFileName = ['ZOE_0068_1.jpg', 'ZOE_0068_2.jpg', 'ZOE_0068_3.jpg', 'ZOE_0068_4.jpg', 'ZOE_0068_5.jpg', 'ZOE_0068_6.jpg', 'ZOE_0068_7.jpg', 'ZOE_0068_8.jpg', 'ZOE_0068_9.jpg', 'ZOE_0068_10.jpg', 'ZOE_0068_11.jpg', 'ZOE_0068_12.jpg', 'ZOE_0068_13.jpg', 'ZOE_0068_14.jpg', 'ZOE_0068_15.jpg', 'ZOE_0068_16.jpg', 'ZOE_0068_17.jpg', 'ZOE_0068_18.jpg', 'ZOE_0068_19.jpg', 'ZOE_0068_20.jpg', 'ZOE_0068_21.jpg', 'ZOE_0068_22.jpg'];
        var frameIndex = 1;
        var ctx;
        var fps = 1000/24;
        var rootPath = "HD 24fps";

        function init() {
            ctx = document.getElementById('canvas').getContext('2d');

            draw(ctx, "/"+ rootPath +"/image" + frameIndex + ".jpg");
        }

        function draw(container, sourcePath) {
            var img = new Image();
            img.onload = function () {
                //document.getElementById("log").innerHTML += " draw " + img.src + " " + new Date() + "</br>";

                container.drawImage(img, 0, 0, 1280, 720);

                if (frameIndex < 817) {
                    frameIndex = frameIndex +1;
                    //setTimeout('draw(ctx, "/VIDEO0047Sample/image"+ frameIndex +".jpg")', 20);
                }
                else {
                    frameIndex = 1;
                }
                    
                //setTimeout('draw(ctx, "/HD 24fps/image" + frameIndex + ".jpg")', 41);
                draw(ctx, "/" + rootPath + "/image" + frameIndex + ".jpg");
            }



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
            <canvas id="canvas" width="1280" height="720"></canvas>
            <div id="log"></div>
            <button>play</button><button>pause</button><button>stop</button>
            <textarea>content</textarea>
        </div>
    </form>
</body>
</html>
