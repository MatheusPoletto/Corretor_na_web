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
				<h1 class="page-title">Regras usadas<span class="title-under"></span></h1>
				<p class="page-description">
					Essas são as regras que estão ativas para o corretor de frases e de arquivos.
				</p>	
			</div>
		</div>

		<div class="main-container">
			<div class="container">
				<div class="row fadeIn animated">
					<div class="col-md-12">
						<!-- <div class="col-md-12"> -->
							<h2 class="title-style-2">Lista de regras:<span class="title-under"></span></h2>
						
						
						<table class="table table-bordered">
						<thead>
							<tr>
								<th>ID</th>
								<th>Nome regra</th>
								
							</tr>
						</thead>
						<tbody id="myTable">
							<c:forEach items="${regraview}" var="regra" varStatus="ct">
	
									<tr class="success">
										<td>
											${ct.count} - ${regra.id}
										</td>
										<td>
											${regra.description}
										</td>
										
									</tr>
							</c:forEach>
						</tbody>
					</table>
							
						
					
						
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
        
        
        <!-- SCRIPT DO LANGUAGE TOOL PARA ANALISE DE TEXTOS ATRAVES DO FORM NA HOME DO USUARIO -->
<script type="text/javascript"
	src="https://www.languagetool.org/js/jquery-1.7.0.min.js"></script>
<script type="text/javascript"
	src="https://www.languagetool.org/online-check/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript"
	src="https://www.languagetool.org/online-check/tiny_mce/plugins/atd-tinymce/editor_plugin2.js"></script>

<script language="javascript" type="text/javascript">
	tinyMCE.init({
		mode : "textareas",
		plugins : "AtD,paste",
		paste_text_sticky : true,
		setup : function(ed) {
			ed.onInit.add(function(ed) {
				ed.pasteAsPlainText = true;
			});
		},
		/* translations: */
		languagetool_i18n_no_errors : {
			// "No errors were found.":
			"de-DE" : "Keine Fehler gefunden."
		},
		languagetool_i18n_explain : {
			// "Explain..." - shown if there is an URL with a detailed description:
			"de-DE" : "Mehr Informationen..."
		},
		languagetool_i18n_ignore_once : {
			// "Ignore this error":
			"de-DE" : "Hier ignorieren"
		},
		languagetool_i18n_ignore_all : {
			// "Ignore this kind of error":
			"de-DE" : "Fehler dieses Typs ignorieren"
		},
		languagetool_i18n_rule_implementation : {
			// "Rule implementation":
			"de-DE" : "Implementierung der Regel"
		},

		languagetool_i18n_current_lang : function() {
			return document.checkform.lang.value;
		},
		/* The URL of your LanguageTool server.
		   If you use your own server here and it's not running on the same domain 
		   as the text form, make sure the server gets started with '--allow-origin ...' 
		   and use 'https://your-server/v2/check' as URL: */
		languagetool_rpc_url : "https://languagetool.org/api/v2/check",
		/* edit this file to customize how LanguageTool shows errors: */
		languagetool_css_url : "https://www.languagetool.org/online-check/"
				+ "tiny_mce/plugins/atd-tinymce/css/content.css",
		/* this stuff is a matter of preference: */
		theme : "advanced",
		theme_advanced_buttons1 : "",
		theme_advanced_buttons2 : "",
		theme_advanced_buttons3 : "",
		theme_advanced_toolbar_location : "none",
		theme_advanced_toolbar_align : "left",
		theme_advanced_statusbar_location : "bottom",
		theme_advanced_path : false,
		theme_advanced_resizing : true,
		theme_advanced_resizing_use_cookie : false,
		gecko_spellcheck : false
	});

	function doit() {
		var langCode = document.checkform.lang.value;
		tinyMCE.activeEditor.execCommand("mceWritingImprovementTool", langCode);
	}
</script>
    </body>
</html>
