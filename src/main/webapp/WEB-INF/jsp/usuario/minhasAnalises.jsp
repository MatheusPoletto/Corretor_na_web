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
					<legend>Minhas análises</legend>
					
					<!-- CAMPO PARA PROCURAR ARQUIVOS SALVOS DO USUARIO -->
					<!-- ARQUIVOS SALVOS SAO OS PDFs RETORNADOS APOS UMA ANALISE DE ARQUIVO -->
					<!-- O CAMPO PROCURA PELO NOME ORIGINAL DO ARQUIVO ENVIADO PARA A ANALISE -->
					<form action="<c:url value="/procurarDocumento"/>" method="post">
						<div class="input-group">
							<input type="text" class="form-control" name="nomeArquivo" value="${nomeArquivo}" placeholder="Filtrar por nome do documento...">
					    		<span class="input-group-btn">
					    			<button class="btn btn-primary" type="submit">Procurar</button>
							</span>
						</div>
					</form>
					
					</br>
					
					<!-- TABLE QUE MOSTRA OS ARQUIVOS SALVOS -->
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>ID</th>
								<th>Nome do documento</th>
								<th>Análise</th>
							</tr>
						</thead>
						<!-- TODAS AS LINHAS DA TABELA POSSUEM UM LINK QUE ABREM O PDF (CLICAR EM CIMA DA LINHA) -->
						<tbody id="myTable">
							<c:forEach items="${pdfsview}" var="pdf">
								<!-- comErro FICA SALVA NA CLASSE PDF E SUA ATRIBUIACAO ACONTECE DURANTE A ANALISE DE UM NOVO ARQUIVO -->
								<!-- pdf.comErro RETORNA 's' QUANDO FORAM DETECTADOS ERROS NO PROCESSO DE ANALISE -->
								<c:if test="${pdf.comErro == 's'}">
									<tr class="danger">
										<td>
											<a href="<c:url value='/abrirPdf/${pdf.codigo}'/>">${pdf.codigo}</a>
										</td>
										<td>
											<a href="<c:url value='/abrirPdf/${pdf.codigo}'/>">${pdf.nomeArquivo}</a>
										</td>
										<td>
											<a href="<c:url value='/abrirPdf/${pdf.codigo}'/>">Possíveis erros</a>
										</td>
									</tr>
								</c:if>
								<!-- pdf.comErro RETORNA 'n' QUANDO NAO FORAM DETECTADOS ERROS NO PROCESSO DE ANALISE -->
								<c:if test="${pdf.comErro == 'n'}">
									<tr class="success">
										<td>
											<a href="<c:url value='/abrirPdf/${pdf.codigo}'/>">${pdf.codigo}</a>
										</td>
										<td>
											<a href="<c:url value='/abrirPdf/${pdf.codigo}'/>">${pdf.nomeArquivo}</a>
										</td>
										<td>
											<a href="<c:url value='/abrirPdf/${pdf.codigo}'/>">Nenhum erro encontrado</a>
										</td>
									</tr>
								</c:if>
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
							 	<i class="glyphicon glyphicon-refresh" ></i> Recarregar todos
							 </a>
      				</div>
					
				</div> <!-- FIM COL AO LADO DO MENU ESQUERDO -->
			</div> <!-- FIM ROW AO LADO DO MENU ESQUERDO -->
		

	<c:import url="script.jsp" />
	
	
	
</body>

<!-- http://www.bootply.com/lxa0FF9yhw -->
<script type="text/javascript">
$.fn.pageMe = function(opts){
    var $this = this,
        defaults = {
            perPage: 7,
            showPrevNext: false,
            hidePageNumbers: false
        },
        settings = $.extend(defaults, opts);
    
    var listElement = $this;
    var perPage = settings.perPage; 
    var children = listElement.children();
    var pager = $('.pager');
    
    if (typeof settings.childSelector!="undefined") {
        children = listElement.find(settings.childSelector);
    }
    
    if (typeof settings.pagerSelector!="undefined") {
        pager = $(settings.pagerSelector);
    }
    
    var numItems = children.size();
    var numPages = Math.ceil(numItems/perPage);

    pager.data("curr",0);
    
    if (settings.showPrevNext){
        $('<li><a href="#" class="prev_link">«</a></li>').appendTo(pager);
    }
    
    var curr = 0;
    while(numPages > curr && (settings.hidePageNumbers==false)){
        $('<li><a href="#" class="page_link">'+(curr+1)+'</a></li>').appendTo(pager);
        curr++;
    }
    
    if (settings.showPrevNext){
        $('<li><a href="#" class="next_link">»</a></li>').appendTo(pager);
    }
    
    pager.find('.page_link:first').addClass('active');
    pager.find('.prev_link').hide();
    if (numPages<=1) {
        pager.find('.next_link').hide();
    }
  	pager.children().eq(1).addClass("active");
    
    children.hide();
    children.slice(0, perPage).show();
    
    pager.find('li .page_link').click(function(){
        var clickedPage = $(this).html().valueOf()-1;
        goTo(clickedPage,perPage);
        return false;
    });
    pager.find('li .prev_link').click(function(){
        previous();
        return false;
    });
    pager.find('li .next_link').click(function(){
        next();
        return false;
    });
    
    function previous(){
        var goToPage = parseInt(pager.data("curr")) - 1;
        goTo(goToPage);
    }
     
    function next(){
        goToPage = parseInt(pager.data("curr")) + 1;
        goTo(goToPage);
    }
    
    function goTo(page){
        var startAt = page * perPage,
            endOn = startAt + perPage;
        
        children.css('display','none').slice(startAt, endOn).show();
        
        if (page>=1) {
            pager.find('.prev_link').show();
        }
        else {
            pager.find('.prev_link').hide();
        }
        
        if (page<(numPages-1)) {
            pager.find('.next_link').show();
        }
        else {
            pager.find('.next_link').hide();
        }
        
        pager.data("curr",page);
      	pager.children().removeClass("active");
        pager.children().eq(page+1).addClass("active");
    
    }
};

$(document).ready(function(){
    
  $('#myTable').pageMe({pagerSelector:'#myPager',showPrevNext:true,hidePageNumbers:false,perPage:10});
    
});

</script>

</html>
