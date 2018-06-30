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
					<!-- POSSIVEIS RETORNOS AO TENTAR APLICAR ALTERACOES NO PERFIL -->
					<c:if test="${precisaMensagem == 'SIM'}">
						</br>
						<!-- ALTERAR SENHA DA CONTA COM SUCESSO -->
						<c:if test="${tipoMensagem == 'SUCESSO_ALTERAR_SENHA'}">
							<div class="alert alert-success">
								<button type="button" class="close" data-dismiss="alert">&times;</button>
							  	<strong>Sucesso!</strong> A senha foi alterada.
							</div>
						</c:if>
						
						<!-- ALTERAR BASICO COM SUCESSO -->
						<c:if test="${tipoMensagem == 'SUCESSO_ALTERAR_BASICO'}">
							<div class="alert alert-success">
								<button type="button" class="close" data-dismiss="alert">&times;</button>
							  	<strong>Sucesso!</strong> Seus dados pessoais foram atualizados.
							</div>
						</c:if>
						
						<!-- ALTERAR FOTO COM SUCESSO -->
						<c:if test="${tipoMensagem == 'SUCESSO_ALTERAR_FOTO'}">
							<div class="alert alert-success">
								<button type="button" class="close" data-dismiss="alert">&times;</button>
							  	<strong>Sucesso!</strong> A foto foi alterada.
							</div>
						</c:if>
					
						<!-- ERRO AO ALTERAR NO BANCO DE DADOS -->
						<c:if test="${tipoMensagem == 'ERRO_SALVAR_BD'}">
							<div class="alert alert-warning">
								<button type="button" class="close" data-dismiss="alert">&times;</button>
							  	<strong>Alterações não foram aplicadas!</strong> Tente fazer login novamente para fazer alterações na conta.
							</div>
						</c:if>
					
						<!-- SENHA INCORRETA ANTES DE ALTERAR PARA UMA NOVA -->
						<c:if test="${tipoMensagem == 'ERRO_SENHA_INCORRETA'}">
							<div class="alert alert-warning">
								<button type="button" class="close" data-dismiss="alert">&times;</button>
							  	<strong>Alterações não foram aplicadas!</strong> Senha atual inserida não é válida.
							</div>
						</c:if>
						
						<!-- CAMPO DE SENHA NOVA E REPETIR SENHA NOVA NAO SAO IGUAIS -->
						<c:if test="${tipoMensagem == 'ERRO_SENHAS_NOVAS_DIFERENTES'}">
							<div class="alert alert-info">
								<button type="button" class="close" data-dismiss="alert">&times;</button>
							  	<strong>Alterações não foram aplicadas!</strong> Os campo da nova senha e repetir nova senha devem ser iguais.
							</div>
						</c:if>
					</c:if>
					<!-- FIM DOS RETORNOS DAS ALTERACOES -->
					
					<legend>Meu perfil</legend>
					<div class="panel panel-info">
						<!-- TITULO COM O NOME DA PESSOA LOGADA-->
						
						<div class="panel-body">
							<div class="row">
								<!-- PAINEL CENTRALIZADO COM A FOTO DO USUARIO -->
								<div class="col-md-12 col-lg-12 fotoUsuario" align="center">
									<c:choose>
										<c:when test="${imagem == 'AAAAAAAAAAAAAAAAAAAAAAAAAAA='}">
		   									<a href="<c:url value='/editarPerfil'/>"> 
		   										<img class="img-circle img-responsive fotoUsuario" src="img/def-user.png" width="150" height="150" alt="..." />
											</a>
										</c:when>
										<c:otherwise>
		     								<a href="<c:url value='/editarPerfil'/>">
		     									<img class="img-circle img-responsive fotoUsuario" src="data:image/jpeg;base64,${imagem}" width="150" height="150" alt="..." />
											</a>
										</c:otherwise>
									</c:choose>
									</br> 
								</div> <!-- FECHA FOTO DO USUARIO -->
							</div><!-- FECHA A ROW DA FOTO -->
							<div class="row">
								<!-- PAINEL COM AS INFORMACOES DA PESSOA -->
								<div class=" col-md-12 col-lg-12">
									<table class="table table-user-information">
										<tbody>
											<tr>
												<td>Nome</td>
												<td>${pessoa.nome}</td>
											</tr>
											<tr>
												<td>Gênero</td>
												<td>${pessoa.genero}</td>
											</tr>
											<tr>
												<td>Endereço</td>
												<td>${pessoa.endereco}</td>
											</tr>
											<tr>
												<td>Email</td>
												<td>${pessoa.email}</td>
											</tr>
											<tr>
												<td>Total de análises armazenadas</td>
												<td>${totalArquivos}</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div> <!-- FECHA ROW DAS INFORMACOES BASICAS-->
						</div><!-- FECHA PANEL BODY (COMPOE FOTO E INFORMACOES BASICA) -->
					</div> <!-- FECHA PANEL INFO -->
					
					<!-- BOTAO PARA EDITAR PERFIL -->	
					
							 <a type="button" class="btn btn-sm btn-primary" href="<c:url value='/editarPerfil'/>">
							 	<i class="glyphicon glyphicon-pencil"></i> Editar perfil
							 </a>	
					
					
				</div> 
			</div> <!-- FECHA ROW -->
		

	<c:import url="script.jsp" />
	
	
	
</body>

</html>
