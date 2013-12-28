<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
        <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
        <link rel="stylesheet" href="/resources/demos/style.css">
    </script>
    <script>
        
        $(function() {
            $( "#tabs" ).tabs();
        });
        $(document).ready(function(){
            $("#cmdListCustomer").click(function(){
                var TableDiv=document.getElementById("divCustomerTable");
                TableDiv.innerHTML='';
                $.ajax({dataType: 'json' ,
                    url:"customers.html",success:function(result){
                        try{
                            console.log(result);
                            var body = document.body,
                            tbl  = document.createElement('table');
                            tbl.style.width='50%';
                            tbl.border = "1";
                            $.each(result, function() {
                                var tr = tbl.insertRow();
                                var td = tr.insertCell();
                                var editlink = document.createElement('a');
                                editlink.textContent = 'Edit';
                                editlink.setAttribute('onclick', 'if(!fetchCustomerDetails(this)) return false;');
                                editlink.id='edit'+this['mId'];
                                editlink.href = 'edit/'+this['mId']+'.html';
                                var deletelink = document.createElement('a');
                                deletelink.textContent = 'Delete';
                                deletelink.setAttribute('onclick', 'if(!deleteCustomerDetails(this)) return false;');
                                deletelink.id='delete'+this['mId'];
                                deletelink.href = 'delete/'+this['mId']+'.html';
                                td.appendChild(editlink);
                                td.appendChild(deletelink);
                                td = tr.insertCell();
                                td.appendChild(document.createTextNode( this['mPhoneNo']))
                                td = tr.insertCell();
                                td.appendChild(document.createTextNode( this['mMobileNo']))
                                td = tr.insertCell();
                                td.appendChild(document.createTextNode( this['mEmailId']))
                                td = tr.insertCell();
                                td.appendChild(document.createTextNode( this['mAddress']))
                                td = tr.insertCell();
                                td.appendChild(document.createTextNode( this['mName']))
                                td = tr.insertCell();
                                td.appendChild(document.createTextNode( this['mId']))
                            });
                            TableDiv.appendChild(tbl);
                        }catch(err){
                            alert(err);
                        }
                    }
                }
            );
            });
            $('#customerForm').submit(function(event) {
                var Id= $( '#mId' ).val();
                var Name = $('#mName').val();
                var Address = $('#mAddress').val();
                var Email = $('#mEmailId').val();
                var Mobile = $('#mMobileNo').val();
                var Phone = $('#mPhoneNo').val();
                var json = { "mId" : Id, "mName" : Name, "mAddress": Address, "mEmailId": Email, "mMobileNo": Mobile, "mPhoneNo": Phone};
    	  
                $.ajax({
                    url: $("#customerForm").attr( "action"),
                    data: JSON.stringify(json),
                    type: "POST",
        	
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader("Accept", "application/json");
                        xhr.setRequestHeader("Content-Type", "application/json");
                    },
                    success: function(respContent) {
                        $("#cmdListCustomer").click();
                    }
                });
                event.preventDefault();
            });
        });
        function fetchCustomerDetails(inLinkId){
            $.ajax({dataType: 'json' ,
                url:$('#'+inLinkId.id).attr( "href"),
                success:function(result){
                    try{
                        $( '#mId' ).val(result['mId']);
                        $('#mName').val(result['mName']);
                        $('#mAddress').val(result['mAddress']);
                        $('#mEmailId').val(result['mEmailId']);
                        $('#mMobileNo').val(result['mMobileNo']);
                        $('#mPhoneNo').val(result['mPhoneNo']);
                    }catch(err){
                        alert(err);
                    }
                }
            }
        );
            return false;
        }
        function deleteCustomerDetails(inLinkId){
            $.ajax({dataType: 'json' ,
                url:$('#'+inLinkId.id).attr( "href"),
                success:function(result){
                    $("#cmdListCustomer").click();
                }
            }
        );
            $("#cmdListCustomer").click();
            return false;
        }
    </script>
    <title>Spring3MVC with Hibernate3 CRUD Example using Annotations</title>
</head>
<body>
    <div id="div1"></div>
    <div id="tabs">
        <ul>
            <li><a  href="#tabs-1">Introduction</a></li>
            <li><a id="cmdListCustomer" href="#tabs-2">Customer</a></li>
        </ul>
        <div id="tabs-1">
            <p>Tool Info</p>
        </div>
        <div id="tabs-2">
            <form:form id="customerForm" action="${pageContext.request.contextPath}/save.html" commandName="customer">  
                <table>  
                    <tbody>  
                        <tr>
                            <td>customer Id:</td>
                            <td><form:input path="mId" readonly="true"/></td>
                        </tr>
                        <tr>
                            <td>customer Name:</td>
                            <td><form:input path="mName"/></td>
                        </tr>
                        <tr>
                            <td>customer Address:</td>
                            <td><form:input path="mAddress"/></td>
                        </tr>
                        <tr>
                            <td>customer Email ID:</td>
                            <td><form:input path="mEmailId"/></td>
                        </tr>

                        <tr>
                            <td>customer Mobile No:</td>
                            <td><form:input path="mMobileNo"/></td>
                        </tr>
                        <tr>
                            <td>customer Phone No:</td>
                            <td><form:input path="mPhoneNo"/></td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type="submit" value="Submit"/><input type="reset" value="Clear"/></td>
                        </tr>
                    </tbody>  
                </table>  
            </form:form>
            <div id="divCustomerTable"></div>
        </div>
    </div>
</body>
</html>