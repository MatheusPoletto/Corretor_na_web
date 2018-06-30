<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
	<head>
    	<c:import url="head.jsp"/>  		
    </head>
    
    <body>
    <!-- NAVBAR
    ================================================== -->

    <header class="main-header">
    	<c:import url="nav.jsp"/>  		 
    </header> <!-- /. main-header -->

	<div class="page-heading text-center">
		<div class="container zoomIn animated">	
			<h1 class="page-title">CRIE UMA CONTA <span class="title-under"></span></h1>
			<p class="page-description">
				Suas informações estão seguras em um ambiente confidencial
			</p>
		</div>
	</div>

	<div class="main-container fadeIn animated">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-12">
					<c:if test="${precisaMensagem == 'SIM'}">						
						<c:if test="${tipoMensagem == 'SUCESSO'}">
							<div class="alert alert-success">
								<strong>
									Seu usuário foi cadastrado!
								</strong> 
								Faça login para	entrar.
							</div>
						</c:if>
						<c:if test="${tipoMensagem == 'ALERTA_LOGIN_EXISTE'}">
							<div class="alert alert-warning">
								<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
								<strong>
									O login já existe!
								</strong> 
								Tente novamente com outro.
							</div>
						</c:if>
					</c:if>
				</div>
			</div>
		
			<div class="row">
				<div class="col-md-7 col-sm-12 col-form">
					<h2 class="title-style-2">FORMULÁRIO DE CADASTRO <span class="title-under"></span></h2>
					<form action="<c:url value="/cadastrarUsuario"/>" method="post" id="formularioCadastro" role="form" class="contact-form">
					
						<div class="row">
							<div class="form-group col-md-6">
	                            <input type="text" name="pessoa.nome" maxlength="50" class="form-control" placeholder="Nome*" value="${pessoa.nome}" required>
	                        </div>

	                        <div class="form-group col-md-6">
	                            <input type="text" name="pessoa.genero" maxlength="50" class="form-control" placeholder="Genêro" value="${pessoa.genero}" >
	                        </div>	
						</div>
						
						<div class="row">
							<div class="form-group col-md-12">
	                            <input type="text" name="pessoa.endereco" maxlength="50" class="form-control" placeholder="Endereço" value="${pessoa.endereco}" >
	                        </div>
	                        
	                    </div>
	                    
	                   <div class="row">
	                        <div class="form-group col-md-12">
	                            <input type="email" name="pessoa.email" maxlength="50" class="form-control" placeholder="E-mail*" value="${pessoa.email}" required>
	                        </div>	
						</div>
                        
                        <div class="row">
							<div class="form-group col-md-8">
	                            <input type="text" name="usuario.login" maxlength="50" class="form-control" placeholder="Usuário" value="${usuario.login}" required>
	                        </div>

	                        <div class="form-group col-md-4">
	                            <input type="password" name="usuario.senha" maxlength="50" class="form-control" placeholder="Senha*" value="${usuario.senha}" required>
	                        </div>	
						</div>
 
                         <div class="form-group">
                            <button type="submit" class="btn btn-primary pull-right">Registrar conta</button>
                        </div>

                        <div class="clearfix"></div>

					</form>

				</div>

				<div class="col-md-4 col-md-offset-1 col-contact">

					<h2 class="title-style-2"> VANTAGENS <span class="title-under"></span></h2>
					<p>
						Registrando uma conta você pode enviar arquivos completos para análise e consulta-los a qualquer momento através do seu histórico de envios.
					</p>
					<p>
						Você também pode analisar pequenos trechos e enviar sugestões para nosso sistema de análise direto aos administradores do sistema.
					</p>

					<div class="contact-items">

						<ul class="list-unstyled contact-items-list">
							<li class="contact-item"> <span class="contact-icon"> <i class="fa fa-skype"></i></span> CorretorWebBR</li>
							<li class="contact-item"> <span class="contact-icon"> <i class="fa fa-envelope"></i></span> corretorweb@gmail.com</li>
						</ul>
					</div>

					
					
				</div>

			</div> <!-- /.row -->


		</div>
		


	</div>

	


   <footer class="main-footer">
        <div class="footer-bottom">
           	<c:import url="rodapeBot.jsp"/> 
        </div>   
    </footer>


	<c:import url="script.jsp"/> 

    </body>
</html>
