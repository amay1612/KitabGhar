

<%@page import="com.kitabghar.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kitabghar.entities.Category"%>
<%@page import="com.kitabghar.entities.Post"%>
<%@page import="com.kitabghar.dao.PostDao"%>
<%@page import="com.kitabghar.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kitabghar.entities.User"%>
<%@page errorPage="Error_page.jsp" %>
<%
    User user = (User) session.getAttribute("currentuser");
    if (user == null) {
        response.sendRedirect("Login.jsp");
    }


%>


<%    int postId = Integer.parseInt(request.getParameter("postId"));
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    Post p = d.getPostByPostId(postId);


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=p.getBookName()%></title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>

            body{
                background: url(img/books.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
           .back_color{
               background: black
/*                background: rgb(22,14,152);
                background: linear-gradient(135deg, rgba(22,14,152,0.8270658605238971) 11%, rgba(234,11,215,0.8326681014202556) 28%, rgba(223,17,149,0.8242647400757178) 42%, rgba(255,0,130,0.8074580173866421) 58%, rgba(217,0,110,0.5805672610841212) 66%, rgba(59,111,213,0.7346288857339811) 79%);*/

            }

        </style>
    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v9.0" nonce="RsEwFeph"></script>

</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
        <a class="navbar-brand" href="index.jsp"> <span class="fa fa-book"></span> KitabGhar</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="Profile.jsp"><span class="	fa fa-home"></span> Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><span class="fa fa-user-circle"></span> About</a>
                </li>
               
                <li class="nav-item">
                    <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-book" ></span> Add Book</a>
                </li>


            </ul>
            <ul class="navbar-nav mr-right">
                <li class="nav-item">
                    <a class="nav-link " data-toggle="modal" data-target="#profile-modal" href="#!"><span class="fa fa-user-circle"></span> <%= user.getName()%></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="LogoutServlet"><span class="fa fa-user"></span> Logout</a>
                </li>
            </ul>
        </div>
    </nav>

    <!--end of navbar-->

    <!--main body of page-->
    <div class="container">
        <div class="row my-4">
            <div class="col-md-8 offset-md-2">
                <div class="card" >

                    <div class="card-header bg-dark text-center text-white ">
                        <h4><%=p.getBookName()%></h4>
                    </div>

                    <div class="card-body back_color text-center text-white " >

                        <img class="card-img-top rounded " style="width: 300px; height: 300px" src="uploadBookPics/<%=p.getBookPic()%>" alt="Card image cap">






                        <div class="container my-3" style=" font-size: 20px">
                            <b><i>Author Name : </i><%=p.getAuthor()%></b>

                            <br>
                            <br>
                            <b><i>Book Price : </i><%=p.getBookPrice()%></b>
                            <br>
                            <br>
                            <%
                                UserDao ud = new UserDao(ConnectionProvider.getConnection());

                            %>
                            <p><a href="#!"><%=ud.getUserByUserId(p.getUserId()).getName()%></a> has posted</p>



                        </div>

                    </div>




                    <div class="card-footer bg-dark  text-white" >
                        <b><i>User's Contact Name  : </i><%=p.getContact()%></b>
                        <br>
                        <br>
                        <b><i>User's Address : </i><%=p.getAddress()%></b>


                    </div>
                    <div class="card-footer">
                        <div class="fb-comments" data-href="http://localhost:2020/KitabGhar/showBookPost.jsp?postId=<%=p.getPid()%>" data-numposts="5" data-width=""></div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header primary_background text-white">
                    <h5 class="modal-title" id="exampleModalLongTitle">KitabGhar</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container text-center">
                        <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius: 50%;max-width: 150px;">


                        <h5 class="modal-title mt-3" id="exampleModalLongTitle"><%= user.getName()%></h5>

                        <!--details of user-->
                        <div id="profile-details">
                            <table class="table table-striped table-dark">

                                <tbody>

                                    <tr>
                                        <th scope="row">Email</th>
                                        <td><%= user.getEmail()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Gender</th>
                                        <td><%= user.getGender()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">About</th>
                                        <td><%= user.getAbout()%></td>

                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div id="profile-edit" style="display:none;">
                            <h3 class="mt-2">Please Edit Carefully</h3>
                            <form action="EditServlet" method="post" enctype="multipart/form-data">
                                <table class="table">

                                    <tr>
                                        <td>Email :</td>
                                        <td> <input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>" > </td>
                                    </tr>
                                    <tr>
                                        <td>Name :</td>
                                        <td> <input type="text" class="form-control" name="user_name" value="<%= user.getName()%>" > </td>
                                    </tr>
                                    <tr>
                                        <td>Password :</td>
                                        <td> <input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>" > </td>
                                    </tr>
                                    <tr>
                                        <td>Gender :</td>
                                        <td> <%= user.getGender().toUpperCase()%> </td>
                                    </tr>
                                    <tr>
                                        <td>About :</td>
                                        <td>
                                            <textarea rows="3" class="form-control" name="user_about" ><%= user.getAbout()%>
                                            </textarea>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>New Profile:</td>
                                        <td>
                                            <input type="file" name="image" class="form-control" >
                                        </td>
                                    </tr>

                                </table>

                                <div class="container">
                                    <button type="submit" class="btn btn-outline-primary">Save</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                </div>
            </div>
        </div>
    </div>

    <!--start of add post-->


    <!-- Modal -->
    <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Provide the Book Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form  id="add-post-form" action="AddPostServlet" method="post">
                        <div class="form-group">
                            <select class="form-control" name="cid">
                                <option selected disabled>---Select Category---</option>
                                <%
                                    PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                    ArrayList<Category> list = postd.getAllCategories();
                                    for (Category c : list) {
                                %>
                                <option value="<%= c.getCid()%>"><%= c.getName()%></option>
                                <%
                                    }
                                %>
                            </select>

                        </div>




                        <div class="form-group">
                            <input name="bname" type="text" placeholder="Enter Book Name" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <input name="authorname" type="text" placeholder="Enter Author Name" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label>Select Book Photo..</label>
                            <br>
                            <input name="bpic" type="file" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <input name="bprice" type="text" placeholder="Enter Book Price" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <input name="address" type="text" placeholder="Enter Your Address" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <input name="contact" type="text" placeholder="Enter Your Contact Number" class="form-control"/>
                        </div>

                        <div class="container text-center">
                            <button type="submit" class="btn btn-outline-primary">Post </button>
                        </div>

                    </form>




                </div>

            </div>
        </div>
    </div>
    <!--end of post-->








    <script src="https://code.jquery.com/jquery-3.4.1.min.js"integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script src="js/myjs.js" type="text/javascript"></script>


    <script>
                $(document).ready(function () {
        let editStatus = false;
                $('#edit-profile-button').click(function () {
        if (editStatus == false)
        {
        $('#profile-details').hide()
                $('#profile-edit').show();
                editStatus = true;
                $(this).text("Back");
        }
        else
        {
        $('#profile-details').show()
                $('#profile-edit').hide();
                $(this).text("Edit");
                editStatus = false;
        }
        })
        })
    </script>

    <!--now add post js-->
    <script>
                $(document).ready(function (e) {

        $("#add-post-form").on("submit", function (event) {
        //this code gets called when form is submitted....
        event.preventDefault();
                console.log("you have clicked on submit..")
                let form = new FormData(this);
                //now requesting to server
                $.ajax({
                url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR)
                        {
                        //success ..
                        console.log(data);
                                if (data.trim() == 'done')
                        {
                        swal("Good job!", "Your Post is Successfully Saved !!!", "success");
                        }
                        else
                        {
                        swal("Error", "Something Went Wrong !!", "error");
                        }

                        },
                        error: function (jqXHR, textStatus, errorThrown)
                        {
                        //error..
                        swal("Error", "Something Went Wrong !!", "error");
                                console.log(data);
                                console.log("Eroor...")
                        },
                        processData: false,
                        contentType: false
                })
        })
        })
    </script>




</body>
</html>
