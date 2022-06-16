<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 19/2/2022
  Time: 10:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form  action="UploadDownLoadFileServlet" method="POST" enctype="multipart/form-data">
    <input type="file" name="fileImg" />
    <input type="text" name="price" value="123">
    <button type="submit">Submit</button>

</form>

</body>
</html>
