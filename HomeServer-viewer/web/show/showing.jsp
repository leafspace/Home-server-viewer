<%--
  Created by IntelliJ IDEA.
  User: 18852
  Date: 2017/1/31
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.io.File" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(request.getParameter("location") == null){
        response.sendRedirect("../login/index.html");
    }
    File root = new File(request.getParameter("location").toString());
    File files[] = root.listFiles();
%>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <title>服务器文件</title>
    </head>
    <body>
        <div class="body">
            <div id="topbar">
            </div>
            <div id="showBox">

                <%
                    for(int i = 0; i < files.length; ++i){
                        String tempFileName = files[i].getName();
                        String type = "";
                        if(!files[i].isDirectory()) {
                            type = tempFileName.substring(tempFileName.lastIndexOf('.'));
                        }
                        String path = files[i].getAbsolutePath();
                        //1.更换'\'to '/'
                        path = path.replaceAll("\\\\", "/");
                        //2.更换'C:'to'upload'
                        path = path.replaceFirst("G:/AV", "/upload");
                %>
                <div class="block">
                    <div class="pic">
                        <%
                            if(files[i].isDirectory()){
                        %>
                                <img src="img/folders.png" onclick="window.location.href='showing.jsp?location=<%=files[i].getAbsolutePath().replaceAll("\\\\", "/")%>'"/>
                        <%
                            }else if(type.equals(".doc") | type.equals(".txt") | type.equals(".docx")){
                        %>
                                    <img src="img/doc.png" />
                        <%
                            }else if(type.equals(".mp3") | type.equals(".wav")){
                        %>
                                    <img src="img/music.png" />
                        <%
                            }else if(type.equals(".jpg") | type.equals(".jpeg") | type.equals(".png") | type.equals(".bmp") | type.equals(".gif")){
                        %>
                                    <a href="<%=path%>"><img src="<%=path%>" width="512px" height="512px"/></a>
                        <%
                            }else if(type.equals(".mp4") | type.equals(".avi") | type.equals(".rmvb") | type.equals(".mov") | type.equals(".wmv") | type.equals(".mkv")){
                        %>
                                    <a href="../play/playing.jsp?location=<%=path%>"><img src="img/video.png" /></a>
                        <%
                            }else {
                        %>
                                    <img src="img/help.png" />
                        <%
                            }
                        %>
                    </div>
                    <div class="filename">
                        <%=tempFileName%>
                    </div>
                </div>
                <%
                    }
                %>

            </div>
        </div>
    </body>
</html>
