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
			<div class="col-xs-12 col-md-6 col-lg-3 col-lg-offset-1">
				<div class="panel panel-blue panel-widget ">
					<div class="row no-padding">
						<a href="<c:url value='/ajPeFrequente'/>">
							<div class="col-sm-12 col-lg-12 widget-left">
								<svg class="glyph stroked sound on"><use xlink:href="#stroked-sound-on"/></svg>
							</div>
							<div class="col-sm-12 col-lg-12 widget-right">
								<div class="large">PERGUNTAS FREQUENTES</div>
							</div>
						</a>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-md-6 col-lg-3">
				<div class="panel panel-orange panel-widget">
					<div class="row no-padding">
						<a href="<c:url value='/ajPeMinhas'/>">
							<div class="col-sm-12 col-lg-12 widget-left">
								<svg class="glyph stroked two messages"><use xlink:href="#stroked-two-messages"/></svg>
							</div>
							<div class="col-sm-12 col-lg-12 widget-right">
								<div class="large">MINHAS PERGUNTAS</div>
							</div>
						</a>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-md-6 col-lg-3">
				<div class="panel panel-teal panel-widget">
					<div class="row no-padding">
						<a href="<c:url value='/ajPeNova'/>">
							<div class="col-sm-12 col-lg-12 widget-left">
								<svg class="glyph stroked empty message"><use xlink:href="#stroked-empty-message"/></svg>
							</div>
							<div class="col-sm-12 col-lg-12 widget-right">
								<div class="large">NOVA PERGUNTA</div>
							</div>
						</a>
					</div>
				</div>
			</div>
			
		</div><!--/.row-->
		
	<c:import url="script.jsp" />
	
</body>

</html>
