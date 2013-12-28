<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>All customers</title>
    </head>
    <body>
        <h1>List customers</h1>
        <h3><a href="add.html">Add More customer</a></h3>

        <c:if test="${!empty customers}">
            <table align="left" border="1">
                <tr>
                    <th>customer ID</th>
                    <th>customer Name</th>
                    <th>customer Address</th>
                    <th>customer Email</th>
                    <th>customer Mobile</th>
                    <th>customer Phone</th>
                </tr>

                <c:forEach items="${customers}" var="customer">
                    <tr>
                        <td><c:out value="${customer.mId}"/></td>
                        <td><c:out value="${customer.mName}"/></td>
                        <td><c:out value="${customer.mAddress}"/></td>
                        <td><c:out value="${customer.mEmailId}"/></td>
                        <td><c:out value="${customer.mMobileNo}"/></td>
                        <td><c:out value="${customer.mPhoneNo}"/></td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </body>
</html>