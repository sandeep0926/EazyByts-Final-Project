<%@ page import="com.fitness.app.Model.UserActivity" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head data-pg-collapsed>
    <meta charset="utf-8"/>
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <title>FitHub</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
    />

    <style>
        .collapse {
            visibility: inherit !important;
        }

        .activity-details h2 {
            text-align: center;
            color: #ff9900;
            font-weight: bold;
            font-size: 20px;
        }

        .activity-details p {
            margin-bottom: 10px;
        }

        .close-button {
            display: block;
            margin: 20px auto;
            background-color: #ff9900;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .close-button:hover {
            background-color: #ffcc66;
        }

        .popup-container {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .popup-content {
            background: white;
            padding: 20px;
            border-radius: 10px;
            max-width: 500px;
            width: 90%;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
    </style>

    <script>
        (function () {
            try {
                if (!document.documentElement.hasAttribute("data-pg-ia-disabled")) {
                    window.pgia_small_mq =
                        typeof pgia_small_mq == "string"
                            ? pgia_small_mq
                            : "(max-width:767px)";
                    window.pgia_large_mq =
                        typeof pgia_large_mq == "string"
                            ? pgia_large_mq
                            : "(min-width:768px)";
                    var style = document.createElement("style");
                    var pgcss =
                        'html:not(.pg-ia-no-preview) [data-pg-ia-hide=""] {opacity:0;visibility:hidden;}html:not(.pg-ia-no-preview) [data-pg-ia-show=""] {opacity:1;visibility:visible;display:block;}';
                    if (
                        document.documentElement.hasAttribute("data-pg-id") &&
                        document.documentElement.hasAttribute("data-pg-mobile")
                    ) {
                        pgia_small_mq = "(min-width:0)";
                        pgia_large_mq = "(min-width:99999px)";
                    }
                    pgcss +=
                        "@media " +
                        pgia_small_mq +
                        '{ html:not(.pg-ia-no-preview) [data-pg-ia-hide="mobile"] {opacity:0;visibility:hidden;}html:not(.pg-ia-no-preview) [data-pg-ia-show="mobile"] {opacity:1;visibility:visible;display:block;}}';
                    pgcss +=
                        "@media " +
                        pgia_large_mq +
                        '{html:not(.pg-ia-no-preview) [data-pg-ia-hide="desktop"] {opacity:0;visibility:hidden;}html:not(.pg-ia-no-preview) [data-pg-ia-show="desktop"] {opacity:1;visibility:visible;display:block;}}';
                    style.innerHTML = pgcss;
                    document.querySelector("head").appendChild(style);
                }
            } catch (e) {
                console && console.log(e);
            }
        })();
    </script>
</head>
<body class="font-serif text-gray-500">
<header class="bg-gray-900 bg-opacity-95">
    <div class="container mx-auto relative">
        <nav class="navbar navbar-expand-lg bg-transparent navbar-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="/">FitHub</a>
                <button
                        class="navbar-toggler"
                        type="button"
                        data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent"
                        aria-expanded="false"
                        aria-label="Toggle navigation"
                >
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" href="/activities">Activity</a>
                        </li>

                        <% String userId = null;
                            HttpSession httpSession = (HttpSession)
                                    request.getSession(false);
                            if (httpSession != null &&
                                    httpSession.getAttribute("userId") != null) {
                                userId = httpSession.getAttribute("userId").toString();
                            }
                            if (userId != null) {
                        %>

                        <li class="nav-item">
                            <a class="nav-link active" href="/userActivity">Your Activity</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="/logout">Logout</a>
                        </li>
                        <% } %>
                        <% String authenticated = null;
                            HttpSession httpSession1 = (HttpSession)
                                    request.getSession(false);
                            if (httpSession1 != null &&
                                    httpSession1.getAttribute("userId") != null) {
                                authenticated = httpSession1.getAttribute("userId").toString();
                            }
                            if
                            (authenticated == null) { %>

                        <li class="nav-item">
                            <a class="nav-link active" href="/login">login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="/register">Register</a>
                        </li>
                        <% } %>
                        <% String role = null;
                            if (httpSession != null &&
                                    httpSession.getAttribute("role") != null) {
                                role = httpSession.getAttribute("role").toString();
                            }
                            if (role != null
                                    && role.equals("admin")) { %>

                        <li class="nav-item">
                            <a class="nav-link active" href="/dashboard/users">Admin DashBoard</a>
                        </li>
                        <% } %>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>
<main>
    <section class="bg-gray-50 py-24">
        <div class="container mx-auto px-4">
            <div class="-mx-4 flex flex-wrap items-center mb-6">
                <div class="px-4 w-full md:w-10/12">
                    <h4 class="capitalize font-bold mb-4 text-4xl text-gray-900">
                        Your Activity
                    </h4>
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped table-hover" id="activityTable">
                            <thead class="bg-gray-700 text-white">
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Duration</th>
                                <th>Status</th>
                                <th>Action</th>
                                <th>Delete</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                List<UserActivity> activities = (List<UserActivity>) request.getAttribute("userActivity");
                                if (activities != null) {
                                    int counter = 1;
                                    for (UserActivity activity : activities) { %>
                            <tr>
                                <td><%= counter++ %>
                                </td>
                                <td><%= activity.getActivity().getName() %>
                                </td>
                                <td><%= activity.getActivity().getDuration() %>
                                </td>
                                <td>
                                    <button class="btn btn-success btn-sm"><%= activity.getStatus() %>
                                    </button>
                                </td>
                                <td><a class="dropdown-item" href="/userActivity/update?id=<%= activity.getId() %>">
                                    <button type="button" class="btn btn-primary btn-sm mr-2">Complete</button>
                                </a>
                                </td>
                                <td><a class="dropdown-item" href="/userActivity/delete/<%= activity.getId() %>"
                                       onclick="return confirmDelete('<%= activity.getId() %>')">
                                    <button type="button" class="btn btn-danger btn-sm mr-2">Delete</button>
                                </a></td>
                            </tr>
                            <% }
                            } %>
                            </tbody>
                        </table>
                        <button type="button" class="btn btn-success btn-sm mr-2"  id="generateReportBtn">Generate Report</button>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
<footer class="bg-black bg-opacity-90 pt-12 text-gray-300">
    <div class="container mx-auto px-4 relative">
        <div class="flex flex-wrap -mx-4">
            <div class="p-4 w-full lg:w-4/12">
                <a
                        href="#"
                        class="font-bold font-sans hover:text-opacity-90 inline-flex items-center leading-none mb-4 space-x-2 text-3xl text-primary-500 uppercase"
                >
                    <path
                            d="M38.333 80a11.571 11.571 0 0 1-7.646-2.883A11.724 11.724 0 0 1 26.834 70H10V46.667L43.333 40l20-20H90v26.667H43.995l-27.328 5.465v11.2h11.166a11.787 11.787 0 0 1 4.212-4.807 11.563 11.563 0 0 1 6.485-2.027A11.574 11.574 0 0 1 58.333 60a11.574 11.574 0 0 1-11.571 11.571Z"
                            clip-rule="evenodd"
                    /></svg
                        ><span>FitHub</span>
                </a>
                <p class="text-gray-400 leading-relaxed mb-5">
                    Welcome to our fitness website! We are dedicated to helping you achieve your health and wellness goals through expert guidance and top-notch resources.
                </p>
                <ul class="font-sans mb-8 space-y-2 text-sm">
                    <li>
                        <a href="#" class="hover:text-primary-500 hover:underline">Privacy Policy</a>
                    </li>
                    <li>
                        <a href="#" class="hover:text-primary-500 hover:underline">Terms of Service</a>
                    </li>
                    <li>
                        <a href="#" class="hover:text-primary-500 hover:underline">Contact Us</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="py-6 text-center text-sm text-gray-500">
            <span class="block">© 2023 fitness.com. All rights reserved.</span>
        </div>
    </div>
</footer>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
<script src="https://cdn.tailwindcss.com"></script>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        document.getElementById('generateReportBtn').addEventListener('click', generateReport);
    });

    function generateReport() {
        var table = document.getElementById("activityTable");
        var rows = table.getElementsByTagName("tr");
        var reportContent = `<div class="activity-details"><h2>Your Activity Report</h2>`;

        for (var i = 1; i < rows.length; i++) {
            var cells = rows[i].getElementsByTagName("td");
            var name = cells[1].innerText;
            var duration = cells[2].innerText;
            var status = cells[3].innerText;

            reportContent += `
                    <p><strong>Name: </strong>` + name + `</p>
                    <p><strong>Duration: </strong>` + duration + `</p>
                    <p><strong>Status: </strong>` + status + `</p>
                    <hr>
                `;
        }

        reportContent += `<button class="close-button" onclick="closePopup()">Close</button></div>`;

        var popupContainer = document.createElement('div');
        popupContainer.className = 'popup-container';
        var popupContent = document.createElement('div');
        popupContent.className = 'popup-content';
        popupContent.innerHTML = reportContent;
        popupContainer.appendChild(popupContent);
        document.body.appendChild(popupContainer);
    }

    function closePopup() {
        var popupContainer = document.querySelector('.popup-container');
        if (popupContainer) {
            document.body.removeChild(popupContainer);
        }
    }
</script>
</body>
</html>