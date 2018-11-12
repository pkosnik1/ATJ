<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<label
		style="background: orange; font-size: 14pt; font-family: monospace;">Convert
		result is equal to:</label>
	<br>	<br>
	<label style="background: red;font-size: 16pt;font-family: sans-serif;"> 
	<%=((Double) request.getSession().getAttribute("outputValue")).doubleValue()%>
	</label>
</body>
</html>