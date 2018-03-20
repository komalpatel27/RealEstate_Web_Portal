<%
  session=request.getSession(false);
  if(session!=null)
      session.invalidate();
  response.setHeader("Cache-Control", "no-cache");
  response.setDateHeader("Expires", 0);
  request.getRequestDispatcher("Login.jsp").forward(request, response);
%>