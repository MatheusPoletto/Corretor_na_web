<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<div id="left" >
	<div class="media user-media well-small">
    	<a class="user-link" href="#">
        	<c:choose>
										<c:when test="${imagem == 'AAAAAAAAAAAAAAAAAAAAAAAAAAA='}">
		   									<a href="<c:url value='/editarPerfil'/>"> 
		   										<img class=" img-responsive" src="img/def-user.png" width="250" height="250" alt="..." />
											</a>
										</c:when>
										<c:otherwise>
		     								<a href="<c:url value='/editarPerfil'/>">
		     									<img class=" img-responsive" src="data:image/jpeg;base64,${imagem}" width="250" height="150" alt="..." />
											</a>
										</c:otherwise>
									</c:choose>
        </a>
        <div class="media-body">
	    	<c:if test="${administrador.nivel == 1}"><h5 class="media-heading"> [ADMIN] ${administrador.nome}</h5></c:if>
	        <c:if test="${administrador.nivel == 2}"><h5 class="media-heading"> [PLUS] ${administrador.nome}</h5></c:if>
	        <c:if test="${administrador.nivel == 3}"><h5 class="media-heading"> [MOD] ${administrador.nome}</h5></c:if>
        </div>
        <br />
    </div>
    <ul id="menu" class="collapse">
		<li class="panel"><a href="<c:url value ="/homeAdministrador"/>" ><i class="icon-dashboard"></i> Principal</a></li>
        <li class="panel">
        		<a href="#" data-parent="#menu" data-toggle="collapse" class="accordion-toggle" data-target="#DDL-nav">
            		<i class="icon-folder-open-alt"></i> 
            			Site
            		<span class="pull-right"><i class="icon-angle-down"></i></span>
            	</a>
                <ul class="collapse" id="DDL-nav">
                	<li>
                    	<a href="#" data-parent="#DDL-nav" data-toggle="collapse" class="accordion-toggle" data-target="#DDL1-nav">
                        <i class="icon-sitemap"></i>&nbsp; 
                        	HTML
                       		<span class="pull-right" style="margin-right: 20px;"><i class="icon-angle-left"></i></span>
						</a>
                        <ul class="collapse" id="DDL1-nav">
                        	<li><a href="<c:url value="/HomeIndex"/>"><i class="icon-angle-right"></i> Home  </a></li>
                            <li><a href="<c:url value="/HomeUsuario"/>"><i class="icon-angle-right"></i> Usuário </a></li>
						</ul>
                    </li>
				</ul>	
		</li>
		<li class="panel"><a href="<c:url value ="/novidadeNova"/>" ><i class="icon-edit"></i> Notícias</a></li>
		
</div>