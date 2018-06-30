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
		
		</br>
		
		<div class="row">
				<div class="col-lg-12">
					<legend>Perguntas frequentes</legend>
					
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="col-md-10">
									O que é o Corretor na Web?
								</div>
								<div class="col-md-2">
								 	<button data-toggle="collapse" data-target="#p1" class="btn btn-success">Resposta</button>
								</div>
							</div>
							<div id="p1" class="panel-body collapse">
								<p>
								 Aplicação disponível de forma on-line com a capacidade de corrigir erros gramaticais em trechos de textos ou documentos submetidos ao programa. O acesso a interface do sistema é feito a partir de uma página na internet para garantir aos usuários da aplicação uma maior facilidade de acesso e comodidade possibilitando o uso através de computadores, laptops, tablets e smartphones com uma conexão ativa a internet.  Ao submeter um ou mais trechos para análise a aplicação fica encarregada de usar de seus algoritmos pré-programados para tratar e identificar erros tipográficos, semânticos e de ortografia a como falta de acentuação, pontuação, e/ou a mistura e ausência de letras exibindo em tela o resultado da análise junto das devidas correções necessárias e sugestões para alteração. 
								</p>		
							</div>
						</div>
						
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="col-md-10">
									Como funciona o Corretor na Web?
								</div>
								<div class="col-md-2">
								 	<button data-toggle="collapse" data-target="#p2" class="btn btn-success">Resposta</button>
								</div>
							</div>
							<div id="p2" class="panel-body collapse">
								<p>Integrado a ferramenta de código aberto Language Tool fazemos as análises.</p>
							</div>
						</div>
						
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="col-md-10">
									Onde ficam armazenados meus dados?
								</div>
								<div class="col-md-2">
								 	<button data-toggle="collapse" data-target="#p3" class="btn btn-success">Resposta</button>
								</div>
							</div>
							<div id="p3" class="panel-body collapse">
								<p>Todos os dados estão no banco de dados do Corretor Web protegido de invasão.</p>
							</div>
						</div>
						
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="col-md-10">
									Qual o limite de arquivos que posso enviar simultaneamente?
								</div>
								<div class="col-md-2">
								 	<button data-toggle="collapse" data-target="#p4" class="btn btn-success">Resposta</button>
								</div>
							</div>
							<div id="p4" class="panel-body collapse">
								<p>É permitido uma análise por vez.</p>
							</div>
						</div>
						
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="col-md-10">
									Qual o limite de arquivos que posso manter salvos em minha conta?
								</div>
								<div class="col-md-2">
								 	<button data-toggle="collapse" data-target="#p5" class="btn btn-success">Resposta</button>
								</div>
							</div>
							<div id="p5" class="panel-body collapse">
								<p>Não existe um limite e seus arquivos podem ser acessados a qualquer dia e qualquer hora.</p>
							</div>
						</div>
						
						
					</div>
					
					
				</div> <!-- FIM COL AO LADO DO MENU ESQUERDO -->
			</div> <!-- FIM ROW AO LADO DO MENU ESQUERDO -->
		
			
		</div><!--/.row-->
		
	<c:import url="script.jsp" />
	
</body>

</html>
