<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
	<head>
		<c:import url="head.jsp"/>  		
    </head>
    
    <body>
    	<header class="main-header">
        	<c:import url="nav.jsp"/>  
   		</header> <!-- /. main-header -->
   		
    <!-- Carousel
    ================================================== -->
    	<div id="homeCarousel" class="carousel slide carousel-home" data-ride="carousel">
         	<!-- Indicators -->
        	<ol class="carousel-indicators">
	            <li data-target="#homeCarousel" data-slide-to="0" class="active"></li>
	            <li data-target="#homeCarousel" data-slide-to="1"></li>
	            <li data-target="#homeCarousel" data-slide-to="2"></li>
          	</ol>

       		<div class="carousel-inner" role="listbox">
         		<div class="item active">
              		<img src="imgIndex/home-slider-1.jpg" alt="">
              			<div class="container">
							<div class="carousel-caption">
								<h2 class="carousel-title bounceInDown animated slow" >Analise gramatical e ortográfica completa</h2>
                  				<h4 class="carousel-subtitle bounceInUp animated slow">Usamos mais de 300 regras para análise gramatical em seus textos</h4>
                  				<a href="<c:url value="/regras"/>" class="btn btn-lg btn-secondary hidden-xs bounceInUp animated slow">SAIBA MAIS</a>
							</div> <!-- /.carousel-caption -->
              			</div>
            	</div> <!-- /.item -->
            	<div class="item ">
            		<img src="imgIndex/home-slider-2.jpg" alt="">
              			<div class="container">
                			<div class="carousel-caption">
								<h2 class="carousel-title bounceInDown animated slow">Corrija trechos de texto</h2>
                  				<h4 class="carousel-subtitle bounceInUp animated slow ">Não é necessário registro</h4>
                  				<a href="<c:url value="/corretor"/>" class="btn btn-lg btn-secondary hidden-xs bounceInUp animated slow">VAMOS LÁ</a>
                			</div> <!-- /.carousel-caption -->
              			</div>
            	</div> <!-- /.item -->
            	<div class="item ">
              		<img src="imgIndex/home-slider-3.jpg" alt="">
              			<div class="container">
                			<div class="carousel-caption">
								<h2 class="carousel-title bounceInDown animated slow">Você também pode analisar arquivos completos</h2>
                  				<h4 class="carousel-subtitle bounceInUp animated slow">Registre uma conta para ter acesso</h4>
                  				<a href="<c:url value="/registro"/>" class="btn btn-lg btn-secondary hidden-xs bounceInUp animated">CRIAR CONTA</a>
                			</div> <!-- /.carousel-caption -->
              			</div>
            	</div> <!-- /.item -->
          	</div>

	        <a class="left carousel-control" href="#homeCarousel" role="button" data-slide="prev">
	        	<span class="fa fa-angle-left" aria-hidden="true"></span>
	            <span class="sr-only">Anterior</span>
	        </a>
	        <a class="right carousel-control" href="#homeCarousel" role="button" data-slide="next">
	            <span class="fa fa-angle-right" aria-hidden="true"></span>
	            <span class="sr-only">Próximo</span>
	        </a>
		</div><!-- /.carousel -->

    	

    	
    	<footer class="main-footer">
        	<div class="footer-top">   
        	
        	</div>
        	<div class="footer-main">
            	<div class="container">
                	<div class="row">
                    	<div class="col-md-12">
							<div class="footer-col">
	                            <h4 class="footer-title">ÚLTIMAS NOVIDADES <span class="title-under"></span></h4>
	                            <div class="footer-content">
    	                            <ul class="tweets list-unstyled">
    	                            	<c:forEach items="${novidadeview}" var="novidade">
    	                            
	        	                            <li class="tweet"> 
												[${novidade.titulo}] ${novidade.conteudo}
		                                    </li>
		                                    
		                                </c:forEach>
	                                     
                                    </ul>
                            	</div>
                        	</div>
                    	</div>   
                	</div>
                </div>            
        	</div>

        	<div class="footer-bottom">
            	<c:import url="rodapeBot.jsp"/>  
        	</div>   
        
    	</footer> <!-- main-footer -->

       	<c:import url="script.jsp"/>  

    </body>
</html>
