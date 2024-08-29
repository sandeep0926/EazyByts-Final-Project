<%@ page import="java.util.List" %>
<%@ page import="com.fitness.app.Model.UserActivity" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- DataTables CSS -->
    <link href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <style>
        .card {
            border: none;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
        }

        body {
            background-color: #e5e0e0;
        }
    </style>
</head>
<body>

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

<!-- Main content -->
<div class="container mt-4 mb-4">
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <h2 class="py-3">Users Activity</h2>
                    <div class="table-responsive">
                        <table id="categoryTable" class="table table-striped table-bordered" style="width:100%">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Username</th>
                                <th>Activity</th>
                                <th>Type</th>
                                <th>Duration</th>
                                <th>Status</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                List<UserActivity> activities = (List<UserActivity>) request.getAttribute("userActivity");
                                if (activities != null) {
                                    for (UserActivity activity : activities) { %>
                            <tr>
                                <td><%= activity.getId() %>
                                </td>
                                <td><%= activity.getUser().getUsername() %>
                                </td>
                                <td><%= activity.getActivity().getName() %>
                                </td>
                                <td><%= activity.getActivity().getType() %>
                                </td>
                                <td><%= activity.getActivity().getDuration() %>
                                </td>
                                <td>
                                    <button class="btn btn-success btn-sm"><%= activity.getStatus() %>
                                    </button>
                                </td>
                            </tr>

                            <% }
                            } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- DataTables JS -->
<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>

<script>
    $(document).ready(function () {
        $('#categoryTable').DataTable();
        $('#newCategoryBtn').click(function () {
            console.log("New Category button clicked");
        });
    });

    function confirmDelete(rentalId) {
        return confirm("Are you sure you want to delete the rental " + rentalId + "?");
    }
</script>
</body>
</html>