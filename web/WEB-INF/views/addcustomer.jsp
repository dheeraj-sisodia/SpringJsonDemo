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
        <h2>Add customer Data</h2>
        <form:form  method="POST" action="save.html">
            <table>
                <tr>
                    <td><form:label path="mId">customer ID:</form:label></td>
                    <td><form:input path="mId" value="${customer.mId}" readonly="true"/></td>
                </tr>
                <tr>
                    <td><form:label path="mName">customer Name:</form:label></td>
                    <td><form:input path="mName" value="${customer.mName}"/></td>
                </tr>
                <tr>
                    <td><form:label path="mAddress">customer Address:</form:label></td>
                    <td><form:input path="mAddress" value="${customer.mAddress}"/></td>
                </tr>
                <tr>
                    <td><form:label path="mEmailId">customer Email ID:</form:label></td>
                    <td><form:input path="mEmailId" value="${customer.mEmailId}"/></td>
                </tr>

                <tr>
                    <td><form:label path="mMobileNo">customer Mobile No:</form:label></td>
                    <td><form:input path="mMobileNo" value="${customer.mMobileNo}"/></td>
                </tr>
                <tr>
                    <td><form:label path="mPhoneNo">customer Phone No:</form:label></td>
                    <td><form:input path="mPhoneNo" value="${customer.mPhoneNo}"/></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Submit"/></td>
                </tr>
            </table> 
        </form:form>

        <c:if test="${!empty customers}">
            <h2>List customers</h2>
            <table align="left" border="1">
                <tr>
                    <th>customer ID</th>
                    <th>customer Name</th>
                    <th>customer Address</th>
                    <th>customer Email</th>
                    <th>customer Mobile</th>
                    <th>customer Phone</th>
                    <th>Actions on Row</th>
                </tr>

                <c:forEach items="${customers}" var="customer">
                    <tr>
                        <td><c:out value="${customer.mId}"/></td>
                        <td><c:out value="${customer.mName}"/></td>
                        <td><c:out value="${customer.mAddress}"/></td>
                        <td><c:out value="${customer.mEmailId}"/></td>
                        <td><c:out value="${customer.mMobileNo}"/></td>
                        <td><c:out value="${customer.mPhoneNo}"/></td>
                        <td align="center"><a href="edit.html?mId=${customer.mId}">Edit</a> | <a href="delete.html?mId=${customer.mId}">Delete</a></td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </body>
</html>