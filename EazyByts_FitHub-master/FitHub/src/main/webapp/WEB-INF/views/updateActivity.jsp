<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FitHub</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .alert {
            margin-top: 20px;
        }

        .container {
            margin-top: 50px;
        }

        @media (min-width: 576px) {
            .form-group textarea {
                resize: vertical;
            }
        }

        .blog-form {
            background-color: white;
            border: 1px solid #ced4da;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease;
            margin-bottom: 30px;
        }

        .blog-form:hover {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .blog-heading {
            text-align: center;
            color: #000000;
            font-size: 28px;
            margin-bottom: 30px;
        }

        body {
            background-color: #e5e0e0;
        }
    </style>
</head>
<body>
<%
    String message = (String) request.getAttribute("message");
    if (message != null && !message.isEmpty()) {
%>
<div class="alert alert-success"><%= message %>
</div>
<%
    }
%>
<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #0b172d">
    <a class="navbar-brand" href="#">FitHub</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/dashboard/users">Users</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="/dashboard/activity">Activity</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="/dashboard/useractivity">User Activity</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="/logout">logout</a>
            </li>
        </ul>
    </div>
</nav>
<div class="container">
    <h2 class="blog-heading">Update a Activity</h2>
            <div class="blog-form p-5">
                <%--@elvariable id="activity" type=""--%>
                <form:form modelAttribute="activity" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label>name:</label>
                        <form:input path="name" class="form-control" required="true"/>
                    </div>
                    <div class="form-group">
                        <label>Type:</label>
                        <form:input path="type" class="form-control" required="true"/>
                    </div>
                    <div class="form-group">
                        <label>Duration:</label>
                        <form:input path="duration" class="form-control" rows="5" required="true"></form:input>
                    </div>
                    <button type="submit" class="btn btn-success">Submit</button>
                </form:form>
            </div>
</div>
<!-- Bootstrap JS dependencies -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
