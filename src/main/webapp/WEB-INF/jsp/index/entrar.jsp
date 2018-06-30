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


	

	<div class="main-container fadeIn animated">

		<div class="container">

			<div class="row">
			

				<div class="col-md-12 col-sm-12 col-form">
				
					<c:if test="${precisaMensagem == 'SIM'}">
					</br>
						<c:if test="${tipoMensagem == 'ERRO_LOGIN_INCORRETO'}">
							<div class="alert alert-warning" id="alert-dismiss-login">
								<strong>Ops, usuário ou senha incorreto!</strong> Tente novamente para continuar.
							</div>			
						</c:if>
						<c:if test="${tipoMensagem == 'ERRO_LOGIN_EXPIROU'}">
							<div class="alert alert-warning">
								<strong>Ops, finalizamos a sessão por segurança!</strong> Faça login novamente para continuar.
							</div>
						</c:if>
					</c:if>

					<div class="card card-container">
						
					
						<!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
						<img id="profile-img" class="profile-img-card" src="imgIndex/user.png" alt="Imagem" />
						<p id="profile-name" class="profile-name-card"></p>
						<form class="form-signin" action="<c:url value="/autenticarUsuario"/>" method="post">
							<span id="reauth-email" class="reauth-email"></span>
							<input type="text" id="inputEmail" name="usuario.login" value="${usuario.login}" class="form-control" placeholder="Usuário" required autofocus>
							<input type="password" id="inputPassword" name="usuario.senha" value="${usuario.senha}" class="form-control" placeholder="Senha" required>
							<a href="#" class="forgot-password">
							Esqueceu a senha?
							</a>
							<div id="remember" class="checkbox">
								<label>
									<input type="checkbox" value="remember-me"> Lembrar meu dados
								</label>
							</div>
							<button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Entrar</button>
						</form><!-- /form -->
							
					   
						<a href="<c:url value="/cadastrar"/>" class="forgot-password">
							Não possui uma conta? Clique aqui
						</a>
					</div><!-- /card-container -->
					

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
