<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Equation generator test3</title>
</head>
<body>
	<%@ page import="java.util.Random"%>
	<%@ page import="javax.servlet.http.HttpServletRequest"%>
	<%!int question = 3;%>
	<%!int questionCount = 10;%>
	<%
		//Random rand = new Random(123456789L);
		Random rand = new Random();
		Boolean openMode = false;
		String[] pAanswers = request.getParameterValues("answer");
		String[] pQuestions = request.getParameterValues("question");
		if (pAanswers != null) {
			openMode = true;
		}
		String pCount = request.getParameter("count");
		if (pCount == null)
			pCount = "0";
		question = Integer.parseInt(pCount);
	%>
	<%
		String questions[] = new String[questionCount];
		int answer[] = new int[questionCount];
		questions[0] = "1 + n = 2";
		answer[0] = 1;
		questions[1] = "2+ n = 4";
		answer[1] = 2;
		questions[2] = "3 + n = 6";
		answer[2] = 3;
		questions[3] = "4 + n = 8";
		answer[3] = 4;
		questions[4] = "5 + n = 10";
		answer[4] = 5;
		questions[5] = "6 + n = 12";
		answer[5] = 6;
		questions[6] = "7+ n = 14";
		answer[6] = 7;
		questions[7] = "8 + n = 16";
		answer[7] = 8;
		questions[8] = "9 + n = 18";
		answer[8] = 9;
		questions[9] = "10 + n = 20";
		answer[9] = 10;
	%>
	<form method="get" action="EquationGen.jsp">
		<input type="hidden" name="count" value="<%=pCount%>">
		<table border=1 cellpadding=5
			style="width: 100%; text-align: center; background-color: Aquamarine; vertical-align: middle; font-size: 12px; font-family: Verdana, Arial, Sans-Serif; border-top-width: thin; border-bottom-style: solid">
			<tr>
				<th>Question</th>
				<th>Answer</th>
				<th>Status</th>
			</tr>
			<%
				for (int i = 0; i < question; ++i) {
			%>
			<tr>
				<%
					int number = rand.nextInt(questionCount);
				%>
				<td><input type="hidden" name="question" value="<%=number%>"
					required> <%
 	if (openMode) {
 %> <%=questions[Integer.parseInt(pQuestions[i])]%> <%
 	} else {
 %> <%=questions[number]%> <%
 	}
 %></td>
				<td>
					<%
						if (openMode) {
					%> <%=pAanswers[i]%> <%
 	} else {
 %> <input type="number" name="answer" required> <%
 	}
 %>
				</td>
				<td>
					<%
						if (openMode) {
								if (answer[Integer.parseInt(pQuestions[i])] == Integer.parseInt(pAanswers[i])) {
					%> Ok <%
						} else {
					%> Not correct <%
						}
							}
					%>
				</td>
			</tr>
			<%
				}
			%>
		</table>
		<br> <input type="submit" value="Check">
	</form>
	<a href="EquationHome.jsp"><h3>Refresh</h3></a>
</body>
</html>