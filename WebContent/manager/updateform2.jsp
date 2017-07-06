<%@page import="p_memberdto.p_memberDto"%>
<%@page import="p_memberdao.p_memberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int num = Integer.parseInt(request.getParameter("num"));

	p_memberDao dao = p_memberDao.getInstance();
	p_memberDto dto = dao.getDataS(num);
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="menu.jsp"/>
<div class="container">

    <form class="well form-horizontal" action="update.jsp" method="post"  id="contact_form">
<fieldset>

<!-- Form Name -->
<legend>Edit Account Info</legend>

<!-- Text input-->

  
<div class="form-group">
  <input type="hidden" name="num" value="<%=dto.getMem_num()%>"/>
  <label class="col-md-4 control-label">Number</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  
  <input  name="num"  class="form-control"  type="text" value ="<%=dto.getMem_num() %>" disabled/>
    </div>
  </div>
</div>

 <!-- Text input-->
  
<div class="form-group">
  <label class="col-md-4 control-label">Name</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input  name="name"  class="form-control"  type="text" value="<%=dto.getName()%>">
    </div>
  </div>
</div> 
  
 <!-- Text input-->
  

  
<div class="form-group">
  <label class="col-md-4 control-label">ID</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input  name="id" class="form-control"  type="text" value="<%=dto.getId() %>" >
    </div>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label">Password</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input  name="pwd"  class="form-control"  type="text" value="<%=dto.getPwd() %>">
    </div>
  </div>
</div> 


<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label">Phone #</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
  <input name="phone"  class="form-control" type="text" value="<%=dto.getPhone() %>"  >
    </div>
  </div>
</div>

<!-- Text input-->
       <div class="form-group">
  <label class="col-md-4 control-label">E-Mail</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
  <input name="email"  class="form-control"  type="text" value="<%=dto.getEmail() %>"  >
    </div>
  </div>
</div>


<!-- Text input-->
       


<!-- Text input-->
      
<div class="form-group">
  <label class="col-md-4 control-label">Address</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
  <input name="addr"  class="form-control" type="text" value="<%=dto.getAddr() %>" >
    </div>
  </div>
</div>




<!-- Success message -->


<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-4">
    <button type="submit" class="btn btn-warning" >EDIT <span class="glyphicon glyphicon-edit"></span></button>
  </div>
</div>

</fieldset>
</form>
</div>
    </div><!-- /.container -->
</body>
</html>