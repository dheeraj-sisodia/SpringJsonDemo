<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Spring MVC Form Handling</title>
    </head>
    <body>
        <h2>Add task Data</h2>
        <form:form  method="POST" action="tasksave.html">
            <table>
                <tr>
                    <td><form:label path="mId">task ID:</form:label></td>
                    <td><form:input path="mId" value="${task.mId}" readonly="true"/></td>
                </tr>
                <tr>
                    <td><form:label path="mTaskName">task Name:</form:label></td>
                    <td><form:input path="mTaskName" value="${task.mTaskName}"/></td>
                </tr>
                <tr>
                    <td><form:label path="mDate">task Address:</form:label></td>
                    <td><form:input path="mDate" value="${task.mDate}"/></td>
                </tr>
                <tr>
                    <td><form:label path="mTime">task Email ID:</form:label></td>
                    <td><form:input path="mTime" value="${task.mTime}"/></td>
                </tr>

                <tr>
                    <td><form:label path="mStatus">task Mobile No:</form:label></td>
                    <td><form:input path="mStatus" value="${task.mStatus}"/></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Submit"/></td>
                </tr>
            </table> 
        </form:form>

        <c:if test="${!empty tasks}">
            <h2>List customers</h2>
            <table align="left" border="1">
                <tr>
                    <th>Task ID</th>
                    <th>task Name</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Status</th>
                    <th>Actions on Row</th>
                </tr>

                <c:forEach items="${tasks}" var="task">
                    <tr>
                        <td><c:out value="${task.mId}"/></td>
                        <td><c:out value="${task.mTaskName}"/></td>
                        <td><c:out value="${task.mDate}"/></td>
                        <td><c:out value="${task.mTime}"/></td>
                        <td><c:out value="${task.mStatus}"/></td>
                        <td align="center"><a href="taskedit.html?mId=${task.mId}">Edit</a> | <a href="taskdelete.html?mId=${task.mId}">Delete</a></td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </body>
</html>