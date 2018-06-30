<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-static-top">
	<div class="navbar-main">
    	<div class="container">
    		<div class="navbar-header">
            	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
	            	<span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
                 </button>
                 <a class="navbar-brand" href="<c:url value="/"/>"><img src="imgIndex/logo.png" alt=""></a>
             </div>
             <div id="navbar" class="navbar-collapse collapse pull-right">
             	<c:import url="menuTopo.jsp"/>  
			 </div> <!-- /#navbar -->
         </div> <!-- /.container -->
     </div> <!-- /.navbar-main -->
</nav> 