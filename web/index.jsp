
<%@page import="com.kitabghar.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Home </title>
        <link  rel="stylesheet" href="css/mystyle.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
        <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">

        <style>

            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Josefin Sans', sans-serif;
            }
            body{
                background-color: black;
               

            }
            .text_font{
                font-family: 'Montserrat', sans-serif;
                color:whitesmoke

            }
            .banner-background{
                clip-path: polygon(30% 0%, 77% 0, 100% 0, 100% 93%, 62% 100%, 24% 91%, 0 100%, 0 0);
            }
            /*
                        .about-part1, .about-part2{
                            opacity: 0;
                        }
                        .about-part1.animate_animated ,.about-part2.animate_animated{
                            opacity: 1;
                        }*/



            .footer_style{
                background: #2c2c54; color: white;
            }

            a{
                text-decoration: none;
                color: white;
            }

            a:hover{ text-decoration: none; color: #4bcffa; }



        </style>

    </head>

    <body >
        <%@include file="navbar.jsp" %>




        <!--            <div class="container-fluid p-0 m-0">
                            <div class="jumbotron  primary_background text-white">
                                <div class="container">
                                    <h3 class="display-3">Welcome To KitabGhar</h3>
                                    <p>A programming language is a formal language comprising a set of instructions that produce various kinds of output. Programming languages are used in computer programming to implement algorithms.</p>
                                    <p>Most programming languages consist of instructions for computers. There are programmable machines that use a set of specific instructions, rather than general programming languages.</p>
                                    <a href="Login.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle-o fa-spin "></span> Login</a>
                                </div>
                
                            </div>
                        </div>-->
        <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel" data-interval="4000" data-aos="zoom-in">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
                <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="pics/amay.jpg" class="d-block w-100" style="height: 92vh" alt="...">
                    <div class="carousel-caption d-none d-md-block text_font" style="margin-bottom: 150px">
                        <h2 class="display-1 ">Welcome</h2>
                        <p class="display-3">To</p>
                        <h2 class="display-1">KitabGhar</h2>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="img/books.jpg" class="d-block w-100" style="height: 92vh" alt="...">
                    <div class="carousel-caption d-none d-md-block" style="margin-bottom: 90px">
                        <h5 class="display-2">Here You Can </h5>
                        <ul>
                            <li class="display-4" style="list-style-type: none;">Snap up</li>
                            <br>
                            <li class="display-4" style="list-style-type: none;">Sell</li>
                            <br>
                            <li class="display-4" style="list-style-type: none;">Share</li>
                        </ul> 
                        <h5 class="display-2">Books</h5>

                    </div>
                </div>
                <div class="carousel-item">
                    <img src="img/books2.jpg" class="d-block w-100" style="height: 92vh" alt="...">
                    <div class="carousel-caption d-none d-md-block" style="margin-bottom: 150px">
                        <h5 class="display-2">Our Motive is to : </h5>
                        <br>
                        <p class="display-3">"Reuse The Old Books"</p>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>




        <section class="my-5">
            <div class="py-5">
                <h2 class="text-center text-white" style="font-family: 'Josefin Sans', sans-serif">Books Available</h2>
            </div>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-12" data-aos="zoom-in">
                        <div class="card ml-5" style="width:350px " >
                            <img class="card-img-top" src="pics/letusc.jpg" alt="Card image">
                            <div class="card-body bg-dark text-white">
                                <h4 class="card-title"><b>Let Us C</b></h4>
                                <p class="card-text"><i>Author Name : </i>Yashavant Kanetkar</p>
                                <a href="Register.jsp" class="btn btn-primary">Know More..</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-4 col-12" data-aos="zoom-in">
                        <div class="card ml-5" style="width:350px" >
                            <img class="card-img-top" src="pics/rsagarwal.jpg" alt="Card image">
                            <div class="card-body bg-dark text-white">
                                <h4 class="card-title"><b>Quantitive Aplitude</b></h4>
                                <p class="card-text"><i>Author Name : </i>RS Agarwal</p>
                                <a href="Register.jsp" class="btn btn-primary">Know More..</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-4 col-12" data-aos="zoom-in">
                        <div class="card ml-5" style="width:350px" >
                            <img class="card-img-top" src="pics/devotional.jpg" alt="Card image">
                            <div class="card-body bg-dark text-white">
                                <h4 class="card-title"><b>7 Secrets Of Shiva</b></h4>
                                <p class="card-text"><i>Author Name : </i>Devdutt Pattanaik</p>
                                <a href="Register.jsp" class="btn btn-primary">Know More..</a>
                            </div>
                        </div>
                    </div>



                    <div class="col-lg-4 col-md-4 col-12 " data-aos="zoom-in">
                        <div class="card ml-5 mt-5" style="width:350px" >
                            <img class="card-img-top" src="pics/schoolrdshama.jpg" alt="Card image">
                            <div class="card-body bg-dark text-white">
                                <h4 class="card-title"><b>Mathematics By RD Sharma</b></h4>
                                <p class="card-text"><i>Author Name : </i> RD Sharma</p>
                                <a href="Register.jsp" class="btn btn-primary">Know More..</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-12 " data-aos="zoom-in">
                        <div class="card ml-5 mt-5" style="width:350px" >
                            <img class="card-img-top" src="pics/thegirlinroom105.jpg" alt="Card image">
                            <div class="card-body bg-dark text-white">
                                <h4 class="card-title"><b>The Girl In Room 105</b></h4>
                                <p class="card-text"><i>Author Name : </i>Chetan Bhagat</p>
                                <a href="Register.jsp" class="btn btn-primary">Know More..</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-12 " data-aos="zoom-in">
                        <div class="card ml-5 mt-5" style="width:350px " >
                            <img class="card-img-top" src="pics/btechbooks.jpg" alt="Card image">
                            <div class="card-body bg-dark text-white">
                                <h4 class="card-title"><b>Collections Of Btech Books</b></h4>
                                <br>
                                <a href="Register.jsp" class="btn btn-primary">Know More..</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </section>




        <section class="my-5" >
            <div class="py-5" id="about">
                <h2 class="text-center text-white" style="font-family: 'Josefin Sans', sans-serif">About Us</h2>
            </div>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6 col-mg-6 col-12 about-part1" data-aos="fade-right">
                        <div  style="margin-left:  230px;">
                            <img src="img/amay.png" class="img-fluid " style="height: 350px">
                        </div>
                    </div>
                    <div class="col-lg-6 col-mg-6 col-12 about-part2" data-aos="fade-left">
                        <h2 class="display-4 text-white">Amay Saxena</h2>
                        <p class="py-3 mr-5 text-white">Hey ! I am Amay Saxena , a simple and hard working person pursuing Btech from LNCT College , always hungry for knowledge & ideas and always want to have knowledge in all technical fields. I have skills of Java Programming Language and Web Development . I always want to be a part of good team and I love to work on projects.
                            Apart from this , I am always searching for some good ideas and to implement them 
                        </p>
                        <a href="https://www.linkedin.com/in/amay-saxena-84b148197/"" class="btn btn-primary">Know More..</a>
                    </div>
                </div>
            </div>   


        </section>


        <footer>
            <footer class="footer_style">
                <main class="container-fluid">
                    <div class="row p-3">
                        <div class="col-md-6 col-12 offset-md-1"> 
                            <p class="mt-5 text-justify">KitabGhar is a Web Application and its motive is to <b>Reuse The Old Books</b>
                                Here you can <i>Sell Snap up or Share</i> your books.In the current time , everyone in their houses
                                contain some unused books , novels which are not in used for them but they can be used by others .
                                So we have the platform where the person who want to sell or  share or replace their books can add 
                                the details of that material to the web application and the other person who want to purchase 
                                old books or want to take or  share the book , can easily do it.
                            </p>
                            <p class="text-capitalize"> &#169 2020 KitabGhar All right reserved. </p>
                        </div>



                        <div class="col-md-4 col-12 ml-5">
                            <h4>Contacts</h4>
                            <dl>
                                <dt>Address:</dt>
                                <dd>Gwalior , Madhya Pradesh </dd>
                            </dl>
                            <dl>
                                <dt>Email:</dt>
                                <dd><a href="mailto:saxenaamay00147@gmail.com" >saxenaamay00147@gmail.com</a></dd>
                            </dl>
                            <dl>
                                <dt>Phone:</dt>
                                <dd><a href="tel:#">+91 6264676924</a> 
                                </dd>
                            </dl>
                        </div>
                    </div>

                    <div class="d-flex justify-content-around align-items-center ">
                        <div class="p-md-5 p-2 ">
                            <a href="https://github.com/amay1612">  <i class="fa fa-github" aria-hidden="true"></i>
                                <span> Github</span></a>
                        </div>
                        <div class="p-md-5 p-2">
                            <a href="https://www.linkedin.com/in/amay-saxena-84b148197/"><i class="fa fa-linkedin-square" aria-hidden="true"></i><span> Linkedin</span></a>
                        </div>
                        <div class="p-md-5 p-2 ">
                            <a href="https://www.instagram.com/"><i class="fa fa-instagram" aria-hidden="true"></i><span> Instagram</span>
                            </a>
                        </div>
                        <div class="p-md-5 p-2 " >
                            <a href="https://mail.google.com/mail/u/0/#inbox"><i class="fa fa-envelope" aria-hidden="true"></i><span> Mail</span></a>

                        </div>


                    </div>
                </main>
            </footer>



















            <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
            <script src="js/myjs.js" type="text/javascript"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/jquery.waypoints.min.js" integrity="sha512-CEiA+78TpP9KAIPzqBvxUv8hy41jyI3f2uHi7DGp/Y/Ka973qgSdybNegWFciqh6GrN2UePx2KkflnQUbUhNIA==" crossorigin="anonymous"></script>
           
            <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
            <script>
                AOS.init({
                    offset: 250,
                    duration: 1000
                });
            </script>



    </body>
</html>
