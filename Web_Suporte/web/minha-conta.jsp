<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
     
    String nomeCompleto = request.getParameter("nomeCompleto");
    String cpf = request.getParameter("cpf");
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
    String tipoSuporte = request.getParameter("tipoSuporte");
    String textoSolicitacao = request.getParameter("textoSolicitacao");
    
    /*aqui está declarando o objeto da sessão, aquele qual será gravado o valor 
    digitado*/
    session.setAttribute("nomeCompleto", nomeCompleto);
    session.setAttribute("email", email);
    session.setAttribute("cpf", cpf);
    session.setAttribute("senha", senha);
    session.setAttribute("tipoSuporte", tipoSuporte);
    session.setAttribute("textoSolicitacao", textoSolicitacao);
    
    //if(nomeCompleto == null){session.getAttribute("nomeCompleto");};
    //if(cpf == null){session.getAttribute("cpf");};
    /*Sessões anônimas não guarda cookies permanentes, mas ainda os armazena 
    temporariamente enquanto utiliza a sessão da guia anonima*/
   
%>
<html lang="pt-BR">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Web Suporte - Página Principal</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body id="page-top">
        <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="#page-top">Web Suporte</a>
                <button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                        <%if(nomeCompleto == null){%>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="cadastro.jsp">Cadastro</a></li>
                        <%}else{%>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="criar-solicitacao.jsp">Criar Solicitação</a></li>
                        <%}%>
                    </ul>
                </div>
            </div>
        </nav>
        <header class="masthead bg-primary text-white text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Avatar Image-->
                <img class="masthead-avatar mb-5" src="assets/img/web-suporte.png" alt="..." />
                <!-- Masthead Heading-->
                <h1 class="masthead-heading text-uppercase mb-0">Web Suporte</h1>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Masthead Subheading-->
                <p class="masthead-subheading font-weight-light mb-0">Minha Conta</p>
            </div>
        </header>
        <section class="page-section portfolio" id="portfolio">
            <div class="container"> 
                <div class="row justify-content-left">
                    <div class="row">
                    <div class="col-lg-12 text-left">
                        <form action="alterar-cadastro.jsp" method="post">           
                            <%if(nomeCompleto == null){%>
                            <div class="lead">Usuário não encontrado ou cadastrado!</div><br>
                            <a class="btn btn-xl btn-outline-dark" href="cadastro.jsp">Faça seu Cadastro!</a>
                            <%}else{%><div class="lead">Nome Completo: <%=nomeCompleto%></div><br>
                            <div class="lead">CPF: <%=cpf%></div><br>
                            <div class="lead">Email: <%=email%></div><br>
                            <input type="text" name="nomeCompleto" value="<%=nomeCompleto%>" hidden>
                            <input type="text" name="cpf" value="<%=cpf%>" hidden>
                            <input class="btn btn-outline-primary btn-x1" type="submit" value="Alterar Cadastro"><br>
                        </form>
                            <form action="criar-solicitacao.jsp" method="post">
                            <input type="text" name="nomeCompleto" value="<%=nomeCompleto%>" hidden>
                            <input type="text" name="cpf" value="<%=cpf%>" hidden>
                            <input type="text" name="email" value="<%=email%>" hidden>
                            <input type="text" name="senha" value="<%=senha%>" hidden>
                            <%if (tipoSuporte == null){%>
                            <input class="btn btn-outline-primary btn-x1" type="submit" value="Criar Solicitação">
                            <br><br><div class="lead">Nenhuma solicitação encontrada.</div>
                            <%}else{%>
                            Solicitação Aberta:
                            <br><%=tipoSuporte%>
                            <br><br><%=textoSolicitacao%>
                            <%}%>
                            <%}%>
                        </form>
                    </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
    <footer class="footer text-center">
            <div class="container">
                <div class="row">
                    <!-- Footer Location-->
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <h4 class="text-uppercase mb-4">Local</h4>
                        <p class="lead mb-0">
                            Uninove Vila Prudente
                            <br />
                            Av. Professor Luiz Ignácio Anhaia Mello, 1363 - Vila Prudente, São Paulo - SP
                        </p>
                    </div>
                    <!-- Footer Social Icons-->
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <h4 class="text-uppercase mb-4">Pela Web</h4>
                        <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-facebook-f"></i></a>
                        <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-twitter"></i></a>
                        <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-linkedin-in"></i></a>
                        <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-dribbble"></i></a>
                    </div>
                    <!-- Footer About Text-->
                    <div class="col-lg-4">
                        <h4 class="text-uppercase mb-4">About Freelancer</h4>
                        <p class="lead mb-0">
                            Freelance is a free to use, MIT licensed Bootstrap theme created by
                            <a href="http://startbootstrap.com">Start Bootstrap</a>
                            .
                        </p>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Copyright Section-->
        <div class="copyright py-4 text-center text-white">
            <div class="container"><small>Copyright &copy; Your Website 2023</small></div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</html>
