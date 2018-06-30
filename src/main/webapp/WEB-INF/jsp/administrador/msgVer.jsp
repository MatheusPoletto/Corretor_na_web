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
                    	<h4> Responder mensagem | ${mensagem.titulo}</h4>
                    </div>
                </div>
                <hr />
                
                <form class="form-horizontal" action="<c:url value="/responderMsgAdm"/>" method="post" id="formularioMensagem" role="form">
							<fieldset>
							
								<div class="form-group">
									<label class="col-md-3 control-label" for="name">Código</label>
									<div class="col-md-9">
									<input name="mensagem.codigo" value="${mensagem.codigo}" type="text" class="form-control" readOnly="true"/>
									</div>
								</div>
							
								<!-- Name input-->
								<div class="form-group">
									<label class="col-md-3 control-label" for="name">Data de criação</label>
									<div class="col-md-9">
									<input name="mensagem.titulo" value="${mensagem.dataCriacao}" type="text" class="form-control" readOnly="true">
									</div>
								</div>
							
								<!-- Message body -->
								<div class="form-group">
									<label class="col-md-3 control-label" for="message">Mensagem</label>
									<div class="col-md-9">
										<textarea name="mensagem.texto" value="${mensagem.texto}" class="form-control" rows="5">${mensagem.texto}</textarea>
									</div>
								</div>
								
																
								
								
								<!-- Message body -->
								<div class="form-group">
									<label class="col-md-3 control-label" for="message">Resposta</label>
									<div class="col-md-9">
										<textarea name="mensagem.resposta" class="form-control" value="${mensagem.texto} rows="6">${mensagem.resposta}</textarea>
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
