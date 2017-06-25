<%--
  Created by IntelliJ IDEA.
  User: 18852
  Date: 2017/1/31
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(request.getParameter("location") == null){
        response.sendRedirect("../login/index.html");
    }
    String path = request.getParameter("location").toString();
%>
<html>
    <head>
        <script src="video.js"></script>
        <link href="video-js.css" rel="stylesheet" type="text/css">
        <title>播放视频</title>
    </head>
    <body>
        <video id="example_video_1" class="video-js vjs-default-skin" controls preload="none" width="640" height="264"
           poster="http://video-js.zencoder.com/oceans-clip.png"
           data-setup="{}">
        <source src="<%=path%>" type='video/mp4' />
        <source src="<%=path%>" type='video/webm' />
        <source src="<%=path%>" type='video/ogg' />
        <track kind="captions" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
        <track kind="subtitles" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
    </video>
    </body>
</html>
