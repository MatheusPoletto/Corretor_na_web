<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
	<head>
		<c:import url="head.jsp"/>
	</head>

	<body class="padTop53 " >
	    <!-- MAIN WRAPPER -->
	    <div id="wrap" >
	    	<!-- HEADER SECTION -->
	        <div id="top">
				<c:import url="nav.jsp"/>
        	</div>
        	<!-- END HEADER SECTION -->
       		<!-- MENU SECTION -->
       		
        <!--END MENU SECTION -->
				<c:import url="menuEsquerdo.jsp"/>
        <!--PAGE CONTENT -->
        <div id="content">
             
        	<div class="inner" style="min-height: 700px;">
            	<div class="row">
                	<div class="col-lg-12">
                    	<h1> Painel de administração</h1>
                    </div>
                </div>
                <hr />
                <!--BLOCK SECTION -->
                <div class="row">
                	<div class="col-lg-12">
                      <div style="text-align: center;">
                           
                            <a class="quick-btn" href="<c:url value="/listaUsuarios"/>">
                                <i class="icon-check icon-2x"></i>
                                <span> Usuários</span>
                                <span class="label label-success">${qtd_usuarios}</span>
                            </a>

                            <a class="quick-btn" href="#">
                                <i class="icon-envelope icon-2x"></i>
                                <span>Mensagens</span>
                                <span class="label label-warning">${qtd_msg_sem_resposta}</span>
                            </a>
                            <a class="quick-btn" href="#">
                                <i class="icon-signal icon-2x"></i>
                                <span>Arquivos</span>
                                <span class="label label-warning">${qtd_pdf}</span>
                            </a>
                           
                            
                            
                        </div>

                    </div>

                </div>
                  <!--END BLOCK SECTION -->
                <hr />
                   <!-- CHART & CHAT  SECTION -->
                 
                 <!--END CHAT & CHAT SECTION -->
                 <!-- COMMENT AND NOTIFICATION  SECTION -->
                <div class="row">
                    <div class="col-lg-12">

                        <div class="chat-panel panel panel-success">
                            <div class="panel-heading">
                                <i class="icon-comments"></i>
                                Últimas mensagens
                            
                            </div>

                            <div class="panel-body">
                                <ul class="chat">
                                	<c:forEach items="${mensagemview}" var="mensagem">
	                                    <li class="left clearfix">
	                                        <div class="clearfix">
	                                            <div class="header">
	                                                <a href="<c:url value='/abrirMsgAdm/${mensagem.codigo}'/>"><strong class="primary-font "> ${mensagem.codigo} - ${mensagem.titulo} </strong></a>
	                                            </div>
	                                            <p>
	                                                ${mensagem.texto}
	                                            </p>
	                                        </div>
	                                    </li>
	                                </c:forEach>
                                    
                                </ul>
                            </div>

                            

                        </div>


                    </div>
                    
                </div>
                <!-- END COMMENT AND NOTIFICATION  SECTION -->
                

                

                 <!--  STACKING CHART  SECTION   -->
               

                 

                
            </div>

        </div>
        <!--END PAGE CONTENT -->

         <!-- RIGHT STRIP  SECTION -->
         <!-- END RIGHT STRIP  SECTION -->
    </div>

    <!--END MAIN WRAPPER -->

    <!-- FOOTER -->
    <c:import url="rodape.jsp"/>
    <!--END FOOTER -->


   	<c:import url="script.jsp"/>



</body>

    <!-- END BODY -->
</html>
