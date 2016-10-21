<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>Users</title></head>
<body>
<table>
<tr><th>ID</th></tr>
<c:forEach items="${dept}" var="dept1">
<tr>
  <%-- <td>${user.id}</td>
  <td>${user.username}</td> --%>
  <td>${dept1.dept_name}</td>
</tr>
</c:forEach>
</table>
</body>
</html>