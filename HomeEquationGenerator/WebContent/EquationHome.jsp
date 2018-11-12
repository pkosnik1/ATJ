<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home page</title>
</head>
<body>
	<h3>Choice number of question:</h3>
	<form method="get">
		<br> <input type="checkbox" name="level" value="easy">easy
		<input type="checkbox" name="level" value="medium">medium <input
			type="checkbox" name="level" value="difficult">difficult <input
			type="submit" value="Query">
	</form>

	<%
		String[] levels = request.getParameterValues("level");
		if (levels != null) {
	%>
	<h3>You have selected level(s):</h3>
	<ul>
		<%
			for (int i = 0; i < levels.length; ++i) {
		%>
		<li><%=levels[i]%></li>
		<%
			}
		%>
		<form method="get" action="EquationGen.jsp">
			<br> <label>Question number</label> <input type="text"
				name="count" value="3"> <input type="submit" value="DoTest">
		</form>
	</ul>
	<a href="<%=request.getRequestURI()%>">BACK</a>
	<br>	
	<%
		}
	%>
</body>
</html>