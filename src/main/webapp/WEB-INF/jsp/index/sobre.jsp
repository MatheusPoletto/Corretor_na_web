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
				<h1 class="page-title">SOBRE<span class="title-under"></span></h1>
				<p class="page-description">
					Aqui est� a fundamenta��o do projeto Corretor Web.
				</p>	
			</div>
		</div>

		<div class="main-container">
			<div class="container">
				<div class="row fadeIn animated">
					<div class="col-md-6">
						<img src="imgIndex/about-us.jpg" alt="" class="img-responsive">
					</div>
					<div class="col-md-6">
						<h2 class="title-style-2">CORRETOR WEB <span class="title-under"></span></h2>
						<p>
							� essencial nos dias de hoje desenvolvermos aplica��oes capazes de facilitar a vida das pessoas trazendo-as produtividade em suas tarefas. Saber escrever corretamente textos sem erros gramaticais � fundamental tanto para que outras pessoas possam compreender com mais facilidade a ideia que se tentou passar em um texto que pode ser avaliado por professores, recrutadores, empregadores, etc. 
						<p>
						<p>
							A linguagem portuguesa � uma l�ngua rica em palavras e falantes. Muitas vezes ao construir discursos ficamos em d�vida na grafia usada para redigir uma palavra que pode estar ou n�o errada. � nesse momento que o corretor ortogr�fico come�a a atuar. 
						</p>
						<p>
							Sua fun��o de maneira clara, correta e objetiva � encontrar entre todas as palavras de um texto os poss�veis erros na escrita e de uma forma interativa sugerir corre��es que se adequem corretamente a senten�a. Desenvolver um corretor que possa atuar independentemente da plataforma usada � fundamental na sociedade atual que procura facilidade de acesso e confiabilidade nas ferramentas.
						</p>
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
