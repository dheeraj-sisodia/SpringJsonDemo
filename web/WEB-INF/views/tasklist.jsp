<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>All tasks</title>
    </head>
    <body>
        <h1>List tasks</h1>
        <h3><a href="taskadd.html">Add More task</a></h3>

        <c:if test="${!empty tasks}">
            <table align="left" border="1">
                <tr>
                    <th>task ID</th>
                    <th>task Name</th>
                    <th>task Date</th>
                    <th>task Time</th>
                    <th>task Status</th>
                </tr>

                <c:forEach items="${tasks}" var="task">
                    <tr>
                        <td><c:out value="${task.mId}"/></td>
                        <td><c:out value="${task.mTaskName}"/></td>
                        <td><c:out value="${task.mDate}"/></td>
                        <td><c:out value="${task.mTime}"/></td>
                        <td><c:out value="${task.mStatus}"/></td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </body>
</html>