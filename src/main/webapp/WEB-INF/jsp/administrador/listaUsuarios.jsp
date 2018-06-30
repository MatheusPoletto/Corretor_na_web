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
                    	<h1> Painel de administração</h1>
                    </div>
                </div>
                <hr />
                
                
                 <!-- COMMENT AND NOTIFICATION  SECTION -->
                <div class="row">
                    <div class="col-lg-12">
						<form action="<c:url value="/procurarDocumento"/>" method="post">
												<div class="input-group">
													<input type="text" class="form-control" name="nomeArquivo" value="${nomeArquivo}" placeholder="Filtrar por nome do documento...">
											    		<span class="input-group-btn">
											    			<button class="btn btn-default" type="submit">Procurar</button>
													</span>
												</div>
											</form>
											
											<!-- TABLE QUE MOSTRA OS ARQUIVOS SALVOS -->
											<table class="table table-bordered">
												<thead>
													<tr>
														<th>ID</th>
														<th>Login</th>
														
													</tr>
												</thead>
												<tbody id="myTable">
													<c:forEach items="${usuariosview}" var="usuario">
														
															<tr class="success">
																<td>
																	${usuario.codigo}
																</td>
																<td>
																	${usuario.login}
																</td>
																
																
															</tr>
													</c:forEach>
												</tbody>
											</table>
											<!-- PAGINACAO DA TABELA -->
											<div class="col-md-12 text-center">
						     					<ul class="pagination pagination-lg pager" id="myPager"></ul>
						     				</div>
						     				<!-- BOTAO PARA RECARREGAR TODAS AS ANLISES (CASO O USUARIO TENHA FEITO UMA PESQUISA E PRECISO VER TODOS NOVAMENTE) -->
						     				<div class="col-md-12 text-center">
						     					 <a data-original-title="Exibe todas as análises" data-toggle="tooltip"	type="button" class="btn btn-sm btn-primary" href="<c:url value='/minhasAnalises'/>">
													 	<i class="glyphicon glyphicon-refresh" ></i>Recarregar todos
													 </a>
						      				</div>
                       
                    </div>
                    
                </div>
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
