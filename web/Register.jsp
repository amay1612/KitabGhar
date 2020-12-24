
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
        <style>

            main{
               background: linear-gradient(135deg, rgba(22,14,152,1) 3%, rgba(234,11,215,0.7570378493194152) 51%, rgba(0,212,255,1) 99%);

            }


            /*             body{
                            background: url(pics/register2.jpg);
                            background-size: cover;
                            background-attachment: fixed;
                        }*/

        </style>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <main class=" " style="padding-bottom:80px; padding-top: 80px;" >
            <div class="container">
                <div class="col-md-6 offset-md-3 " data-aos="zoom-in">
                    <div class="card">
                        <div class="card-header  bg-dark text-center  text-white ">
                            <span class="	fa fa-user-circle fa-3x"></span>
                            <br>
                            Register
                        </div>
                        <div class="card-body">
                            <form id="reg-form" action="RegisterServlet" method="POST">
                                <div class="form-group">
                                    <label for="user_name">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter Name">

                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>


                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputCollege">School/College</label>
                                    <input name="user_college" type="text" class="form-control" id="exampleInputCollege" placeholder="Enter Full Name of School/College">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Select Gender</label>
                                    <br>
                                    <input type="radio"  id="gender"name="gender" value="Male" > Male
                                    <input type="radio"  id="gender" name="gender" value="Female" > Female
                                </div>

                                <div class="form-group">
                                    <textarea name="about" class="form-control" rows="5" placeholder="Enter something about yourself"></textarea>
                                </div>



                                <div class="form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree terms and conditions</label>
                                </div>
                                <br>


                                <button  type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>


                    </div>
                </div>
            </div>
        </main>




        <script src="https://code.jquery.com/jquery-3.4.1.min.js"integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

        <script src="js/myjs.js" type="text/javascript"></script>
                <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
                    <script>
                      AOS.init({
                          offset: 250,
                          duration: 1000
                      });
                    </script>

        <script>
                    $(document).ready(function () {
            console.log("loaded........")

                    $('#reg-form').on('submit', function (event) {
            event.preventDefault();
                    let form = new FormData(this);
                    //send register servlet:
                    $.ajax({
                    url: "RegisterServlet",
                            type: 'POST',
                            data: form,
                            success: function (data, textStatus, jqXHR) {
                            console.log(data)

                                    if (data.trim() === 'done')
                            {

                            swal("Register Successfully !!", "Redirecting to Login Page... ", "success")

                                    .then((value) => {
                                    window.location = "Login.jsp"
                                    });
                            } else
                            {
                            console.log("hmmm")

                                    swal(data);
                            }

                            },
                            error: function (jqXHR, textStatus, errorThrown) {

                            swal("Something went wrong!! Try Again Later");
                            },
                            processData: false,
                            contentType: false

                    });
            });
            });



        </script>

    </body>
</html>
