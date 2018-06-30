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
		
		<div class="row">		
				<div class="col-lg-12">
				
				<!-- MENSAGENS DE RETORNO DO CONTROLLER -->
					<c:if test="${precisaMensagem == 'SIM'}">
						<!-- ARQUIVO ENVIADO PELO USUARIO NAO ERA UM FORMATO VALIDO -->
						<c:if test="${tipoMensagem == 'ERRO_ARQUIVO'}">
							<div class="alert alert-danger">
								<button type="button" class="close" data-dismiss="alert">&times;</button>
								<h4>Não analisado!</h4> 
								Ocorreu um erro durante a análise. </br>
								Esse tipo de erro geralmente ocorre durante a submissão de um formato inválido para análise. </br>
								Verifique se o tipo de arquivo é .docx e tente novamente.
							</div>
						</c:if>			
					</c:if>				
				
					<form action="<c:url value="/salvarDocumento/documento"/>" method="post" enctype="multipart/form-data">
						<fieldset>
							<legend> Analisar arquivo </legend>
							<p> Envie aqui arquivos do tipo .DOCX para análise sem limite de tamanho ou quantidade. </p>
							<div class="form-group">
								<div class="col-md-12">
									<input id="documento" name="documento" class="input-file" type="file">
									<button type="submit" id="singlebutton" name="singlebutton" class="btn btn-success botaoEnviar">Enviar</button>
								</div>
							</div>
						</fieldset>
					</form>

				</div> <!-- FECHA COL AO LADO DO MENU ESQUERDO -->
			</div> <!-- FECHA ROW DO CONTEUDO-->
		
	</div>	<!--/.main-->

	<c:import url="script.jsp" />
	
</body>

</html>
