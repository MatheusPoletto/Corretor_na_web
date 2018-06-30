<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<c:import url="head.jsp" />
</head>

<body>
	<c:import url="menuTopo.jsp" />
		
	<c:import url="menuEsquerdo.jsp" />
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<c:import url="path.jsp" />		
		
		<!-- <div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Dashboard</h1>
			</div>
		</div><!--/.row-->
		
		<div class="row">
				<div class="col-lg-12">
					<!-- AREA DO CORRETOR DO LANGUAGE TOOL NA PAGINA HOME DO USUARIO -->
					<legend>Corrigir trecho de texto ou <a href="<c:url value='/novoEnvio'/>">um arquivo</a> </legend>
					<div class="areaCorretor">
						<form name="checkform" action="http://community.languagetool.org" method="post">
							<p id="checktextpara">
								<textarea id="checktext" name="text" style="width: 100%" rows="6">Cole o texto aqui... ou cheque cheque este texto.</textarea>
							</p>
					
						<!-- SELECT COM OS IDIOMAS DO CORRETOR DO LANGUAGE TOOL NA PAGINA HOME -->
							<select name="lang" id="lang">
								<option value="pt-BR">Português Brasileiro</option> <!-- pt-BR - ON -->
								<!-- PODE TER MAIS DE UM IDIOMA ATIVO PARA CHECAR:
								<option value="en-US">English</option>
		          					<option value="de-DE">German</option> 
		          					<option value="it">Italian</option>
		          					-->
							</select>
							<input type="submit" name="_action_checkText" value="Verificar o texto" onClick="doit();return false;">
							<div id="feedbackErrorMessage" style="color: red;"></div>					
						</form>
						<div>
					</div> <!-- FIM DA AREA DO CORRETOR DO LANGUAGE TOOL -->
				</div> <!-- FIM DA COL DO CONTEUDO AO LADO DO MENU ESQUERDO -->
			</div> <!-- FECHA ROW DO CONTEUDO AO LADO DO MENU ESQUERDO-->
		</div> <!-- ROW PRINCIPAL -->
		
	</div>	<!--/.main-->

	<c:import url="script.jsp" />
	
</body>

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


</html>
