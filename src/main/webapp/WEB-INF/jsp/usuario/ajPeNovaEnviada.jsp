<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<c:import url="head.jsp" />
</head>

<body>
	<c:import url="menuTopo.jsp" />
		
	<c:import url="menuEsquerdo.jsp" />
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<c:import url="path.jsp" />
		
		
		<!-- <div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Dashboard</h1>
			</div>
		</div><!--/.row-->
		
		</br>
		
		<div class="row">
			<div class="col-md-12">
				
					<div class="alert bg-success" role="alert">
						<svg class="glyph stroked checkmark"><use xlink:href="#stroked-checkmark"></use></svg>${mensagem_ao_usuario} <a href="<c:url value='/ajuda'/>" class="pull-right"><span class="glyphicon glyphicon-remove"></span></a>
					</div>
				
				
			</div>
			
			
		</div><!--/.row-->
		
	<c:import url="script.jsp" />
	
</body>

</html>
