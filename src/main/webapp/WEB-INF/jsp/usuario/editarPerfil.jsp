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
		
		</br >
		
		<div class="row">
			<div class="col-lg-12">
				<!-- PAINES DE TABS -->
				<ul class="nav nav-tabs">
					<li class="active">
						<a data-toggle="tab" href="#basico">Informações pessoais</a>
					</li>
					<li>
						<a data-toggle="tab" href="#foto">Foto</a>
					</li>
					<li>
						<a data-toggle="tab" href="#conta">Conta</a>
					</li>
				</ul>
				
				<!-- DIV DE TODOS OS PAINEIS -->
				<div class="tab-content">
					<!-- PAINEL BASICO - INFORMACOES DA PESSOA -->
					<div id="basico" class="tab-pane fade in active">
						<form action="<c:url value='/alterarBasico'/>" method="post">
							<legend>Alteração das informações pessoais:</legend>
							<div class="form-group col-md-10">
								<label for="nome">Nome:</label>
								<input type="text" id="nome" name="pessoa.nome" value="${pessoa.nome}" class="form-control" required />
							</div>
							<div class="form-group col-md-2">
								<label for="genero">Gênero:</label>
								<input type="text" id="genero" name="pessoa.genero" value="${pessoa.genero}" class="form-control" required />
							</div>
							<div class="form-group col-md-12">
									<label for="endereco">Endereço:</label>
									<input type="endereco" name="pessoa.endereco" id="endereco" value="${pessoa.endereco}" class="form-control" required />
							</div>
							<div class="form-group col-md-12">
									<label for="email">Email:</label>
									<input type="text" id="email" name="pessoa.email" value="${pessoa.email}" class="form-control" required />
							</div>							
							
							<div class="form-group col-md-6">
								<button type="submit" class="btn btn-success btn-md"><span class="glyphicon glyphicon-floppy-saved" aria-hidden="true"></span> Salvar </button>
							</div>
						</form>
					</div> <!-- FECHA TAB BASICO -->
					<!-- PAINEL FOTO - PARA ALTERAR A FOTO DO USUARIO -->
					<div id="foto" class="tab-pane fade">
						<form action="<c:url value="/alterarFoto/imagem"/>" method="post" enctype="multipart/form-data">
							<fieldset>
								<legend>Alteração da foto do perfil</legend>
								
								<div class="form-group col-md-12">
									<input type="file" name="imagem" />
								</div>
								
								<div class="form-group col-md-12">
																<button type="submit" class="btn btn-success btn-md"><span class="glyphicon glyphicon-floppy-saved" aria-hidden="true"></span> Salvar </button>
								
								</div>
								
							</fieldset>
						</form>						
					</div> <!-- FECHA TAB FOTO -->
					<!-- PAINEL CONTA - PARA ALTERAR A SENHA DA CONTA (O LOGIN JA VEM CARREGADO E DESABILITADO)-->
					<div id="conta" class="tab-pane fade">
						<form action="<c:url value='/alterarConta'/>" method="post">
							<legend>Alteração de senha</legend>
							<div class="form-group col-md-6">
								<label for="usuario">Usuário:</label>
								<input type="text" id="usuario" name="usuario.login" value="${usuario.login}" class="form-control" required disabled />
								<input type="hidden" name="usuario.login" value="${usuario.login}" />
							</div>
							<div class="form-group col-md-6">
								<label for="senha">Senha atual:</label>
								<input type="password" id="senhaAtual" name="senhaAtual" value="${senhaAtual}"	class="form-control" required />
							</div>
							<div class="form-group col-md-6">
								<label for="novaSenha">Nova senha:</label>
								<input type="password" name="novaSenha" id="novaSenha" value="${novaSenha}" class="form-control" required />
							</div>
							<div class="form-group col-md-6">
								<label for="repetirNovaSenha">Repetir nova senha:</label>
								<input type="password" id="repetirNovaSenha" name="repetirNovaSenha" value="${repetirNovaSenha}" class="form-control" required />
							</div>
							
							<div class="form-group col-md-12">
								<button type="submit" class="btn btn-success btn-md"><span class="glyphicon glyphicon-floppy-saved" aria-hidden="true"></span> Salvar </button>
							</div>
						</form>
					</div> <!-- FECHA TAB CONTA -->
				</div> <!-- FECHA TAB CONTENT -->
			</div> <!-- FECHA COL SIZING -->
		</div> <!-- FECHA ROW DAS TAB -->
		
	</div>	<!--/.main-->

	<c:import url="script.jsp" />
	
</body>

</html>
