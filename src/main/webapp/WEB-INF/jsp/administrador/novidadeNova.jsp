<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<head>
	<c:import url="head.jsp"/>
</head>

<html>
	<body class="padTop53 " >
	    <!-- MAIN WRAPPER -->
	    <div id="wrap" >
	    	<!-- HEADER SECTION -->
	        <div id="top">
				<c:import url="nav.jsp"/>
        	</div>
        	<!-- END HEADER SECTION -->
       		<!-- MENU SECTION -->
       			<c:import url="menuEsquerdo.jsp"/>
        <!--END MENU SECTION -->

        <!--PAGE CONTENT -->
        <div id="content">
             
        	<div class="inner" style="min-height: 700px;">
            	<div class="row">
                	<div class="col-lg-12">
                		</br>
                    	<h4> Adicionar novidade</h4>
                    </div>
                </div>
                <hr />
                
                <form class="form-horizontal" action="<c:url value="/novaNovidade"/>" method="post" id="formularioMensagem" role="form">
							<fieldset>
							
												
								<!-- Name input-->
								<div class="form-group">
									<label class="col-md-3 control-label" for="name">Título da mensagem</label>
									<div class="col-md-9">
									<input name="novidade.titulo" value="${novidade.titulo}" type="text" class="form-control">
									</div>
								</div>
							
								<!-- Message body -->
								<div class="form-group">
									<label class="col-md-3 control-label" for="message">Texto</label>
									<div class="col-md-9">
										<textarea name="novidade.conteudo" value="${novidade.conteudo}" class="form-control" rows="5">${novidade.conteudo}</textarea>
									</div>
								</div>
								
													
								
								<div class="form-group">
									<div class="col-md-12 widget-right">
										<button type="submit" class="btn btn-default btn-md pull-right">Enviar</button>
									</div>
								</div>
								
							</fieldset>
						</form>
                
                 <!-- COMMENT AND NOTIFICATION  SECTION -->
                
                <!-- END COMMENT AND NOTIFICATION  SECTION -->
                

                

                 <!--  STACKING CHART  SECTION   -->
               

                 

                
            </div>

        </div>
        <!--END PAGE CONTENT -->

       
    </div>

    <!--END MAIN WRAPPER -->

    <!-- FOOTER -->
    <c:import url="rodape.jsp"/>
    <!--END FOOTER -->


  	<c:import url="script.jsp"/>



</body>

    <!-- END BODY -->
</html>
