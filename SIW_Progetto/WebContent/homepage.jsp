<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head lang="it">

<title>Calabria E20</title>
<meta charset="utf-8">

<link href="css/common.css?100" rel="stylesheet">
<link href="css/background.css" rel="stylesheet">
<link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
<script src="jquery/jquery-3.2.1.min.js"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<script src="js/creazioneevento.js"></script>
<script src="js/eventiutente.js"></script>
<script src="js/redirect.js"></script>

</head>

<body>
	<header>
<!-- NAVBAR MENU' -->
		<nav class="navbar navbar-inverse navbar-static-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<aside class="pull-left">
						<img src="images/logo.png" height="30">
					</aside>
					<a id="brand" class="navbar-brand">Calabria E20</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
						<li class="active"><a href="">Home</a></li>
						<li><a href="redirect?r=eventi">Eventi </a></li>
						<c:if test="${not loggato}">
							<li><a href="redirect?r=iscriviutente">Diventa uno di
									noi</a></li>
						</c:if>
					</ul>
<c:if test="${loggato}"><!-- ICONA ACCOUNT -->

						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown"><a href="" class="dropdown-toggle"
								data-toggle="dropdown"> <span
									class="glyphicon glyphicon-user"></span> ${nome} <b
									class="caret"></b></a>
								<ul class="dropdown-menu">
									<li><p class="bg-primary">${username}</p></li>
									<li><a href="redirect?r=gestioneProfilo">Profilo</a></li>
									<li><a href="effettualogout">Logout</a></li>
								</ul></li>
						</ul>
</c:if><!-- //ICONA ACCOUNT -->
				</div>
			</div>
		</nav>
<!-- //NAVBAR MENU' -->

		<div class="container" id="info">
			<div class="row">
<!-- RSS -->
<c:if test="${not loggato}">
					<article id="news" class="col-sm-4 col-md-3">
						<div class="panel panel-default" id="panelnews">
							<div class="panel-heading text-center" id="panelh">
								<h4>
									<strong>Notizie ed Eventi in tutta Italia</strong>
								</h4>
							</div>
							<div class="panel-body" id="newspanel">
								<script
									src="//rss.bloople.net/?url=http%3A%2F%2Fstatic.video.corriereobjects.it%2Fwidget%2Fcontent%2Fplaylist%2Fxml%2Fplaylist_e4984304-7de1-11df-a575-00144f02aabe_dateDesc.xml&limit=3&showtitle=false&type=js"></script>
							</div>
						</div>
					</article>
<!-- //RSS -->
<!-- HOMEPAGE VISITATORE -->
					<div class="col-sm-6">
						<div class="jumbotron" id="description">
							<h2>Benvenuti sul sito</h2>
							<h1>Calabria E20</h1>
							<p>
								Il nostro servizio web offre la possibilità di trovare gli
								eventi a te più vicini scegliendo tra un vasto assortimento di
								eventi raggruppati per genere e zona.<br> Calabria E20 ti
								concede la possibilità  di prenotare presso i locali che
								aderiscono al nostro sito per sponsorizzare il loro evento.
								Offriamo inoltre la possibilità  di acquistare il biglietto per
								il concerto del tuo cantante preferito in occasione della sua
								tappa nella nostra splendida terra.
							</p>
						</div>
					</div>
<!-- MODULO LOGIN -->
					<div class="col-sm-3">
						<div class="jumbotron" id="log">
							<h4>
								<strong>Area riservata</strong>
							</h4>
							<h6>Sei un utente registrato? Effettua da qui il login</h6>
							<form method="post" action="effettualogin">
								<div class="form-group">

									<div class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-user"></i></span> <input id="email"
											type="text" class="form-control" name="email"
											placeholder="Email">
									</div>
									<div class="input-group">
										<span class="input-group-addon"> <i
											class="glyphicon glyphicon-lock"></i></span> <input id="password"
											type="password" class="form-control" name="password"
											placeholder="Password">
									</div>
									<br>
									<c:if test="${credenzialiErrate}">
										<div class="container">
											<div class="alert alert-warning">Nome o password
												errati!</div>
										</div>
									</c:if>
									<input type="submit" value="Login" class="btn btn-success">
								</div>
							</form>
						</div>
					</div>
</c:if>
<!-- //MODULO LOGIN -->
<!-- //HOMEPAGE VISITATORE -->
<!-- HOMEPAGE UTENTE -->
<c:if test="${loggato}">
					<div class="col-sm-2">
						<div class="jumbotron" id="log">
							<img src="images/profilo.png" class="img-circle"
								alt="immagine del profilo" style="width: 50%;">
							<h3>${nome}</h3>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="jumbotron" id="description">
<!-- MODULO CREAZIONE EVENTO -->
							<button id="expand_form" type="button"
								class="btn btn-default btn-xs">
								<span class="glyphicon glyphicon-plus"></span>
							</button>
							crea evento<br>
							<div class="jumbotron" id="eventForm">
								<form method="post" action="gestioneeventi">

									<div class="form-group">
										<label for="titolo">Titolo:</label><input name="titolo"
											id="idTitolo" type="text" class="form-control" />
									</div>

									<div class="form-group" id="chooselocation">
									<!-- scelta dinamica dei luoghi in base all'utente -->
									</div>

									<div class="form-group">
										<select id="genere" name="genere" class="btn btn-default">
											<option value="">Genere</option>
											<option value="arte">Arte</option>
											<option value="cultura">Cultura</option>
											<option value="gastronomia">Gastronomia</option>
											<option value="musica">Musica</option>
											<option value="sport">Sport</option>
										</select>
									</div>
									<div class="form-group">
										<textarea rows="3" name="descrizione" id="idDescrizione"
											class="form-control"
											placeholder="inserisci qui una breve descrizione..."></textarea>
									</div>
									<div class="form-inline">
										<label for="data">Data svolgimento:</label> <input name="data"
											type="date" /> <label for="orario">Ora:</label> <input
											name="orario" type="time" />
									</div>
									<br>
									<div class="form-group">
										<label for="payment">Tipo di partecipazione:</label> <select
											id="ticket" name="ticket" class="btn btn-default">
											<option value="free">Free</option>
											<option value="pagamento">Pagamento</option>
										</select>
									</div>
									<div id="hideticketparameters">
									<!-- funzione jQuery per visualizzazione dinamica dei parametri per i ticket -->
									</div>
									<br>
									<div class="form-group">
										<label for="fileupload">allega locandina</label> <input
											type="file" name="fileupload" id="fileupload">
									</div>
									<br>
									<div class="form-group" align="center">
										<input id="pubblicaevento" type="submit" value="Pubblica"
											class="btn btn-success" />
									</div>
								</form>
							</div>
<!-- //MODULO CREAZIONE EVENTO -->
							<div id="loadbacheca" class="container">

								<h2>I tuoi Eventi in Bacheca</h2>
								<hr>
								<div id="mieieventi" class="container"></div>

								<div class="container">								
								<div class="modal fade" id="myModal" role="dialog">
								    <div class="modal-dialog modal-sm">
								      <div class="modal-content">
								        <div class="modal-header">
								          <button type="button" class="close" data-dismiss="modal">&times;</button>
								          <h4 class="modal-title">Modifica Evento</h4>
								        </div>
								        <div class="modal-body" id="xxx">
								        	<div id="eventodamodificare" class="container">
											<form id="mod" method="post" action="modificaeventi">
											</form>
									        </div>
									        <div class="modal-footer">
										        <button type="submit" class="btn btn-success" form="mod">Aggiorna</button>
											</div>
								        </div>
								      </div>
								    </div>
								  </div>
								</div>

							</div>
						</div>
					</div>
</c:if>
<!-- //HOMEPAGE UTENTE -->
			</div>
		</div>
	</header>
	<footer> Sito web sviluppato dagli studenti Garasto Christian
		e Ventura Paolo </footer>

</body>
</html>