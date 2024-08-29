<%@ page import="java.util.List" %>
<%@ page import="com.fitness.app.Model.Activity" %>
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

        .poster {
            z-index: 0;
        }

        .poster:before {
            background-image: url(https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?ixid=MnwyMDkyMnwwfDF8c2VhcmNofDE0fHxjYXJ8ZW58MHx8fHwxNjMxNjQ3NTY0&ixlib=rb-1.2.1q=85&fm=jpg&crop=faces&cs=srgb&w=1200&fit=max) !important;
            background-size: cover;
            background-position: center center;
            background-repeat: no-repeat;
            content: ' ';
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            position: absolute;
        }

        body.poster:before {
            position: fixed;
        }

        @media (min-width: 1440px), (min-width: 992px) and (-webkit-min-device-pixel-ratio: 2), (min-width: 992px) and (min-resolution: 192dpi) {
            .poster:before {
                background-image: url(https://case.edu/onetoone/sites/default/files/styles/hero_one_column/public/2024-01/New%20Year%27s%20Banner%20for%20website%201232%20%C3%97%20450.png?h=f6a84238&itok=NFQ1iSJG) !important;
            }
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
    <section class="bg-secondary-500 poster relative text-gray-300">
        <div class="container mx-auto pb-24 pt-72 px-4">
            <div class="-mx-4 flex flex-wrap items-center space-y-6 lg:space-y-0">
                <div class="px-4 w-full md:w-9/12 xl:w-7/12 2xl:w-6/12">
                    <p class="font-bold font-sans mb-1 text-2xl text-white">
                        FitHub
                    </p>
                    <h1
                            class="font-bold mb-6 text-5xl text-white md:leading-tight lg:leading-tight lg:text-6xl"
                    >
                        HEALTH
                        <span class="text-primary-500">FITNESS</span>
                        <span class="text-primary-500">WELLNESS</span>
                    </h1>
                </div>
            </div>
        </div>
    </section>
    <section class="py-24">
        <div class="container mx-auto px-4 space-y-12">
            <div class="flex flex-wrap items-center">
                <div class="py-4 w-full lg:w-6/12">
                    <img
                            src="https://blog.bonsecours.com/wp-content/uploads/2023/02/Ben-Risks-of-Running-1200x610.jpg"
                            width="1000"
                            alt="..."
                            height="650"
                    />
                </div>
                <div class="py-4 w-full lg:w-6/12">
                    <div class="bg-white lg:-ml-12 lg:pl-12 lg:py-12">
                        <h2 class="mb-2 text-primary-500 text-xl">
                            Health Care &amp; Much More
                        </h2>
                        <h3
                                class="capitalize font-bold mb-4 text-4xl text-gray-900 xl:text-5xl"
                        >
                            Elevate Your Fitness Journey Like Never Before
                        </h3>
                        <div class="bg-primary-500 mb-6 pb-1 w-2/12"></div>
                        <p class="mb-6">
                            Phasellus pulvinar faucibus neque, nec rhoncus nunc ultrices
                            sit amet. Lorem ipsum dolor sit amet, consectetur adipiscing
                            elit. Phasellus pulvinar faucibus neque, nec rhoncus nunc
                            ultrices sit amet. Curabitur ac sagittis neque, vel egestas
                            est.
                        </p>
                        <a
                                href="#"
                                class="bg-primary-500 hover:bg-primary-600 inline-block px-6 py-2 text-white"
                        >Learn More</a
                        >
                    </div>
                </div>
            </div>
            <div class="flex flex-wrap items-center">
                <div class="py-4 w-full lg:w-4/12 xl:mr-auto xl:w-3/12">
                    <h4 class="capitalize font-bold mb-2 text-3xl text-gray-900">
                        Our Service is Built With Trusr
                    </h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                </div>
                <div class="py-4 w-full lg:w-8/12">
                    <div class="-mx-4 flex flex-wrap">
                        <div class="p-4 w-full md:w-4/12">
                            <div>
                                <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        viewBox="0 0 65 65"
                                        xml:space="preserve"
                                        fill-rule="evenodd"
                                        clip-rule="evenodd"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        stroke-miterlimit="2"
                                        stroke="currentColor"
                                        width="5rem"
                                        height="5rem"
                                        class="h-20 mb-3 text-primary-500 w-20"
                                >
                      <path
                              d="M13 50v-1.849a2.73 2.73 0 0 0-.741-1.87l-4.038-4.293A4.499 4.499 0 0 1 7 38.907V21.998A2.998 2.998 0 0 1 9.998 19h.004A2.999 2.999 0 0 1 13 21.998V27m38 23v-1.849c0-.695.265-1.364.741-1.87l4.038-4.293A4.499 4.499 0 0 0 57 38.907V21.998A2.998 2.998 0 0 0 54.002 19h-.004A2.999 2.999 0 0 0 51 21.998V27M29 56.379v-4.933c0-.383-.152-.751-.424-1.022A1.442 1.442 0 0 0 27.554 50H13.446c-.383 0-.751.152-1.022.424A1.442 1.442 0 0 0 12 51.446v4.933m23 0v-4.933c0-.383.152-.751.424-1.022A1.442 1.442 0 0 1 36.446 50h14.108c.383 0 .751.152 1.022.424.272.271.424.639.424 1.022v4.933"
                              fill="none"
                              stroke-width="2"
                      ></path>
                                    <path
                                            d="M28 50v-5.491c0-2.439-1-4.771-2.767-6.453l-7.49-7.13a2.71 2.71 0 0 0-3.785.047l-.002.002a2.767 2.767 0 0 0 0 3.912l4.527 4.527M36 50v-5.491c0-2.439 1-4.771 2.767-6.453l7.49-7.13a2.71 2.71 0 0 1 3.785.047l.002.002a2.767 2.767 0 0 1 0 3.912l-4.527 4.527M22.25 16.464a1.499 1.499 0 0 1 1.5-1.5h3.75a1.5 1.5 0 0 0 1.5-1.5V9.5A1.5 1.5 0 0 1 30.5 8h3A1.5 1.5 0 0 1 35 9.5v3.964a1.5 1.5 0 0 0 1.5 1.5h3.75a1.5 1.5 0 0 1 1.5 1.5V19.5a1.503 1.503 0 0 1-1.5 1.5H36.5a1.503 1.503 0 0 0-1.5 1.5v4a1.5 1.5 0 0 1-1.5 1.5h-3a1.5 1.5 0 0 1-1.5-1.5v-4a1.503 1.503 0 0 0-1.5-1.5h-3.75a1.503 1.503 0 0 1-1.5-1.5v-3.036z"
                                            fill="none"
                                            stroke-width="2"
                                    ></path>
                    </svg>
                                <h4 class="font-bold text-gray-900 text-xl">
                                    Insured &amp; Safe
                                </h4>
                            </div>
                        </div>
                        <div class="p-4 w-full md:w-4/12">
                            <div>
                                <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        viewBox="0 0 65 65"
                                        xml:space="preserve"
                                        fill-rule="evenodd"
                                        clip-rule="evenodd"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        stroke-miterlimit="2"
                                        stroke="currentColor"
                                        width="5rem"
                                        height="5rem"
                                        class="h-20 mb-3 text-primary-500 w-20"
                                >
                      <path
                              d="M49.972 21.334c.003-2.264.011-4.339.028-5.976a2.574 2.574 0 0 0-1.082-2.109 2.596 2.596 0 0 0-2.344-.351m-.249.334-.002.001m-16.987-.534a17.589 17.589 0 0 1-11.907.2l-.003-.001A2.596 2.596 0 0 0 14 15.358v18.717m17.455 18.167 11.83-6.799"
                              fill="none"
                              stroke-width="2"
                      ></path>
                                    <path
                                            d="M54 14.908a6.172 6.172 0 0 0-8.146-5.848l-.002.001a14.905 14.905 0 0 1-9.999-.166l-2.623-.984a3.507 3.507 0 0 0-2.46 0l-2.623.984a14.905 14.905 0 0 1-9.999.166l-.002-.001A6.172 6.172 0 0 0 10 14.908V34.14a17.257 17.257 0 0 0 8.263 14.728l11.35 6.93a3.504 3.504 0 0 0 3.573.048l12.156-6.986A17.256 17.256 0 0 0 54 33.898v-18.99z"
                                            fill="none"
                                            stroke-width="2"
                                            stroke-linecap="butt"
                                    ></path>
                                    <circle
                                            cx="32"
                                            cy="26"
                                            r="5"
                                            fill="none"
                                            stroke-width="2"
                                    ></circle>
                                    <path
                                            d="M21.169 40.5C23.64 36.554 27.574 34 32 34c4.426 0 8.36 2.554 10.831 6.5"
                                            fill="none"
                                            stroke-width="2"
                                    ></path>
                    </svg>
                                <h4 class="font-bold text-gray-900 text-xl">
                                    Certified Chauffeur
                                </h4>
                            </div>
                        </div>
                        <div class="p-4 w-full md:w-4/12">
                            <div>
                                <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        viewBox="0 0 65 65"
                                        xml:space="preserve"
                                        fill-rule="evenodd"
                                        clip-rule="evenodd"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        stroke-miterlimit="2"
                                        stroke="currentColor"
                                        width="5rem"
                                        height="5rem"
                                        class="h-20 mb-3 text-primary-500 w-20"
                                >
                      <path
                              d="M38.028 13.749c8.148 2.342 14.116 9.856 14.116 18.753m-.479 4.315c-1.966 8.695-9.745 15.195-19.03 15.195m-4.854-.61c-8.423-2.159-14.656-9.807-14.656-18.9m.48-4.314c1.966-8.695 9.744-15.195 19.03-15.195m0 33.193v7.316m-13.1-7.9 1.674-1.674m-2.258-11.426h-7.316m7.9-13.099 1.674 1.674m11.426-9.575v7.317m11.425 2.258 1.674-1.674m7.901 13.099h-7.316M44.06 43.928l1.674 1.674"
                              fill="none"
                              stroke-width="2"
                      ></path>
                                    <circle
                                            cx="32.635"
                                            cy="32.502"
                                            r="26"
                                            fill="none"
                                            stroke-width="2"
                                    ></circle>
                                    <path
                                            d="M37.039 34.711a2.369 2.369 0 0 1 1.652 2.01l.214 2a2.177 2.177 0 0 1-2.167 2.412h-.001c-5.92 0-10.727-4.807-10.727-10.728 0-1.799.444-3.495 1.228-4.985a2.779 2.779 0 0 1 2.365-1.44c.457-.051.973-.064 1.467-.077a1.956 1.956 0 0 1 2.004 2.038l-.17 4.093a1.522 1.522 0 0 1-.934 1.34l-1.584.66a6.562 6.562 0 0 0 2.251 3.485l1.456-1.725 2.946.917z"
                                            fill="none"
                                            stroke-width="2"
                                    ></path>
                    </svg>
                                <h4 class="font-bold text-gray-900 text-xl">
                                    24/7 Support
                                </h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="bg-gray-50 py-24">
        <div class="container mx-auto px-4">
            <div class="-mx-4 flex flex-wrap items-center mb-6">
                <div class="px-4 w-full md:w-10/12">
                    <h2 class="font-medium mb-1 text-primary-500 text-xl">
                        Our Top Activities
                    </h2>
                    <h3 class="capitalize font-bold mb-4 text-4xl text-gray-900">
                        Fit for All: Your Ultimate Fitness Companion
                    </h3>
                    <div class="bg-primary-500 mb-6 pb-1 w-2/12"></div>
                </div>
            </div>
            <div class="-mx-3 flex flex-wrap justify-center mb-12">
                <div class="-mx-3 flex flex-wrap justify-center mb-12">
                    <% List<Activity> activities = (List<Activity>) request.getAttribute("activities");
                        if (activities != null) {
                            for (Activity activity : activities) { %>
                    <div class="p-3 w-full md:w-6/12 lg:w-4/12">
                        <div class="bg-white border shadow-md text-gray-500">
                            <%--                        <img src="${pageContext.request.contextPath}/image/<%= car.getImage() %>" alt="Image">--%>
                            <div class="p-6">
                                <h4 class="font-bold mb-2 text-gray-900 text-xl">
                                    <a href="#" class="hover:text-gray-500"
                                    ><%= activity.getName() %>
                                    </a
                                    >
                                </h4>
                                <h4 class="mb-2 text-sm font-bold">
                                    Type: <%= activity.getType() %>
                                </h4>
                                <h4 class="mb-2 text-sm font-bold">
                                    Duration: <%= activity.getDuration() %> min
                                </h4>
                                <p>Achieving optimal health and wellness is a journey, and our fitness app is designed
                                    to be your steadfast companion every step of the way. Whether you're a seasoned
                                    athlete or just beginning your fitness journey, our app offers tailored workout
                                    plans, comprehensive diet guides.</p>
                                <hr class="border-gray-200 my-4"/>
                                <div class="flex items-center justify-between">
                                    <div class="inline-flex items-center py-1 space-x-1">
                                        <a href="/cars/car/<%= activity.getDuration() %>">
                                            <button class="bg-green-700 hover:bg-green-800 text-white font-bold py-2 px-4 rounded">
                                                Add Activity
                                            </button>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% }
                    } %>
                </div>
            </div>
            <div class="text-center ">
                <a
                        href="/activities"
                        class="bg-primary-500 hover:bg-primary-600 inline-block px-6 py-2 text-black"
                >View All Activity</a
                >
            </div>
        </div>
    </section>
    <section class="py-24">
        <div class="container mx-auto px-4">
            <div class="-mx-4 flex flex-wrap items-center mb-6">
                <div class="px-4 w-full md:flex-1">
                    <h2 class="font-medium mb-1 text-primary-500 text-xl">
                        Our Fleet
                    </h2>
                    <h3 class="capitalize font-bold mb-4 text-4xl text-gray-900">
                        Browse by Category
                    </h3>
                    <div class="bg-primary-500 mb-6 pb-1 w-2/12"></div>
                </div>
                <div class="px-4 w-full md:w-auto">
                    <a
                            href="#"
                            class="bg-primary-500 hover:bg-primary-600 inline-block px-6 py-2 text-white"
                    >View All</a
                    >
                </div>
            </div>
            <div class="-mx-3 flex flex-wrap justify-center">
                <div class="p-3 w-full md:w-6/12 lg:w-3/12">
                    <a
                            href="#"
                            class="bg-white block border group hover:text-gray-500 shadow-md text-gray-900"
                    ><img
                            src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThH6dUaFt6WIfrgQrJVe58fkqNa9-HmUt8EmrwLho8DDNBa8i2ByR3UdNntzRz0GZmEvY&usqp=CAU"
                            class="group-hover:opacity-90 w-full"
                            alt="..."
                            width="600"
                            height="450"
                    />
                        <div class="px-6 py-4">
                            <h4 class="font-bold text-xl">Together</h4>
                        </div>
                    </a
                    >
                </div>
                <div class="p-3 w-full md:w-6/12 lg:w-3/12">
                    <a
                            href="#"
                            class="bg-white block border group hover:text-gray-500 shadow-md text-gray-900"
                    ><img
                            src="https://img.freepik.com/fotos-premium/um-grupo-de-pessoas-fazendo-ioga-no-parque_180601-6964.jpg"
                            class="group-hover:opacity-90 w-full"
                            alt="..."
                            width="600"
                            height="450"
                    />
                        <div class="px-6 py-4">
                            <h4 class="font-bold text-xl">Yoga</h4>
                        </div>
                    </a
                    >
                </div>
                <div class="p-3 w-full md:w-6/12 lg:w-3/12">
                    <a
                            href="#"
                            class="bg-white block border group hover:text-gray-500 shadow-md text-gray-900"
                    ><img
                            src="https://media.istockphoto.com/id/1259984250/photo/calories-counting-diet-food-control-and-weight-loss-concept-calorie-counter-application-on.jpg?s=612x612&w=0&k=20&c=j7fE9RwdkjWNQWDG9Y_yNAz_rLkDbvrz0Pmn5yp1mww="
                            class="group-hover:opacity-90 w-full"
                            alt="..."
                            width="600"
                            height="450"
                    />
                        <div class="px-6 py-4">
                            <h4 class="font-bold text-xl">Diet Plan</h4>
                        </div>
                    </a
                    >
                </div>
                <div class="p-3 w-full md:w-6/12 lg:w-3/12">
                    <a
                            href="#"
                            class="bg-white block border group hover:text-gray-500 shadow-md text-gray-900"
                    ><img
                            src="https://t3.ftcdn.net/jpg/04/74/75/76/360_F_474757688_vy7NPrr6Q0pzkAomTxaldl5GW5jxTw7L.jpg"
                            class="group-hover:opacity-90 w-full"
                            alt="..."
                            width="600"
                            height="450"
                    />
                        <div class="px-6 py-4">
                            <h4 class="font-bold text-xl">Dancing</h4>
                        </div>
                    </a
                    >
                </div>
            </div>
        </div>
    </section>
    <section class="bg-gray-900 bg-opacity-95 py-24 text-gray-400">
        <div class="container mx-auto px-4">
            <div class="-mx-4 flex flex-wrap items-center mb-6">
                <div class="px-4 w-full md:w-10/12">
                    <h2 class="font-medium mb-1 text-primary-500 text-xl">
                        Testimonials
                    </h2>
                    <h3 class="capitalize font-bold mb-4 text-4xl text-white">
                        What Our Customers Say About Us
                    </h3>
                    <div class="bg-primary-500 mb-6 pb-1 w-2/12"></div>
                </div>
            </div>
            <div class="flex flex-wrap -mx-4 items-center">
                <div class="p-4 w-full lg:w-4/12">
                    <img
                            src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFePh5tCLrtMxM4q-Dy6rmHWvXgNSG0vrMpJF7B-ooFuRoybPVg2QEga1dEE1vRZQ8aSU&usqp=CAU"
                            alt="..."
                            width="360"
                            height="360"
                    />
                </div>
                <div class="p-4 w-full lg:w-8/12">
                    <svg
                            viewBox="0 0 24 24"
                            fill="currentColor"
                            class="h-16 inline-block mb-4 text-primary-500 w-16"
                    >
                        <path
                                d="M23 1V5.06504C21.9136 5.67931 21.0807 6.43812 20.5012 7.34146C19.958 8.24481 19.5416 9.20235 19.2519 10.2141C18.9621 11.2258 18.8173 12.346 18.8173 13.5745H23V22.4634H14.0914V16.935C14.0914 13.6107 14.3992 11.0813 15.0148 9.34688C15.6667 7.61246 16.6444 6.02258 17.9481 4.57723C19.2519 3.09575 20.9358 1.90334 23 1ZM9.90864 1V5.06504C8.82222 5.67931 7.9893 6.43812 7.40988 7.34146C6.83045 8.24481 6.39588 9.20235 6.10617 10.2141C5.81646 11.2258 5.67161 12.346 5.67161 13.5745H9.90864V22.4634H1V16.935C1 13.6107 1.30782 11.0813 1.92346 9.34688C2.57531 7.61246 3.55309 6.02258 4.85679 4.57723C6.16049 3.09575 7.84444 1.90334 9.90864 1Z"
                        ></path>
                    </svg>
                    <p class="font-light mb-5 text-xl">
                        Aliqua id fugiat nostrud irure ex duis ea quis id quis ad et.
                        Sunt qui esse pariatur duis deserunt mollit dolore cillum minim
                        tempor enim. Elit aute irure tempor cupidatat incididunt sint
                        deserunt ut voluptate aute id deserunt nisi.
                    </p>
                    <h4 class="font-bold mb-1 text-2xl text-primary-500">
                        Kathryn Murphy
                    </h4>
                    <p class="text-white">Chief Technology Officer</p>
                </div>
            </div>
        </div>
    </section>
    <section class="bg-primary-500 py-16 text-center text-gray-300">
        <div class="container mx-auto px-4 relative">
            <h2 class="capitalize font-bold mb-6 text-4xl text-white">
                Download Our App &amp; Get Started
            </h2>
            <div class="flex-wrap inline-flex items-center py-1 space-x-2">
                <a
                        href="#"
                        class="border border-white hover:bg-white hover:inline-flex hover:items-center hover:space-x-2 hover:text-gray-900 inline-flex items-center px-6 py-2 space-x-2 text-white"
                >
                    <svg
                            xmlns="http://www.w3.org/2000/svg"
                            viewBox="0 0 24 24"
                            width="1.5em"
                            height="1.5em"
                            fill="currentColor"
                            class="me-1"
                    >
                        <path
                                d="M11.624 7.222c-.876 0-2.232-.996-3.66-.96-1.884.024-3.612 1.092-4.584 2.784-1.956 3.396-.504 8.412 1.404 11.172.936 1.344 2.04 2.856 3.504 2.808 1.404-.06 1.932-.912 3.636-.912 1.692 0 2.172.912 3.66.876 1.512-.024 2.472-1.368 3.396-2.724 1.068-1.56 1.512-3.072 1.536-3.156-.036-.012-2.94-1.128-2.976-4.488-.024-2.808 2.292-4.152 2.4-4.212-1.32-1.932-3.348-2.148-4.056-2.196-1.848-.144-3.396 1.008-4.26 1.008zm3.12-2.832c.78-.936 1.296-2.244 1.152-3.54-1.116.048-2.46.744-3.264 1.68-.72.828-1.344 2.16-1.176 3.432 1.236.096 2.508-.636 3.288-1.572z"
                        ></path>
                    </svg
                    >
                    <span>App Store</span></a
                >
                <a
                        href="#"
                        class="border border-white hover:bg-white hover:inline-flex hover:items-center hover:space-x-2 hover:text-gray-900 inline-flex items-center px-6 py-2 space-x-2 text-white"
                >
                    <svg
                            xmlns="http://www.w3.org/2000/svg"
                            viewBox="0 0 24 24"
                            width="1.5em"
                            height="1.5em"
                            fill="currentColor"
                            class="me-1"
                    >
                        <path
                                d="M3.609 1.814L13.792 12 3.61 22.186a.996.996 0 0 1-.61-.92V2.734a1 1 0 0 1 .609-.92zm10.89 10.893l2.302 2.302-10.937 6.333 8.635-8.635zm3.199-3.198l2.807 1.626a1 1 0 0 1 0 1.73l-2.808 1.626L15.206 12l2.492-2.491zM5.864 2.658L16.802 8.99l-2.303 2.303-8.635-8.635z"
                        ></path>
                    </svg
                    >
                    <span>Google Play</span></a
                >
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
                            d="M38.333 80a11.571 11.571 0 0 1-7.646-2.883A11.724 11.724 0 0 1 26.834 70H10V46.667L43.333 40l20-20H90v26.667H43.995l-27.328 5.465v11.2h11.166a11.787 11.787 0 0 1 4.212-4.807 11.563 11.563 0 0 1 12.577 0 11.789 11.789 0 0 1 4.213 4.807h7.833V70h-6.837a11.719 11.719 0 0 1-3.853 7.117A11.571 11.571 0 0 1 38.333 80Zm0-16.667a5 5 0 1 0 5 5 5.006 5.006 0 0 0-5.001-5Zm27.761-36.666L52.762 40h30.571V26.667Z"
                    ></path>
                    <path
                            d="M56.667 63.333h-7.833a11.6 11.6 0 0 0-21 0H16.667v-11.2l27.328-5.465h12.672Z"
                            opacity="0.2"
                    ></path>
                    <path
                            d="M90 63.333H80v-10h-6.667v10h-10V70h10v10H80V70h10Z"
                    ></path>
                    <path
                            d="M52.762 40h30.571V26.667H66.094Z"
                            opacity="0.2"
                    ></path>
                    </svg
                            >
                    <span>FitHub</span>
                </a>
                <ul class="mb-4 space-y-1">
                    <li>9056 Fairground Ave., New York, USA</li>
                    <li>
                        <a href="#" class="hover:text-gray-400 text-white"
                        >+0 123 456 7890</a
                        >
                    </li>
                    <li>
                        <a
                                href="mailto:hello@fafo.com"
                                class="hover:text-gray-400 text-white"
                        >info@FitHub.com</a
                        >
                    </li>
                </ul>
                <div class="flex-wrap inline-flex space-x-3">
                    <a href="#" aria-label="facebook" class="hover:text-gray-400">
                        <svg viewBox="0 0 24 24" fill="currentColor" class="h-5 w-5">
                            <path
                                    d="M14 13.5h2.5l1-4H14v-2c0-1.03 0-2 2-2h1.5V2.14c-.326-.043-1.557-.14-2.857-.14C11.928 2 10 3.657 10 6.7v2.8H7v4h3V22h4v-8.5z"
                            />
                        </svg
                        >
                    </a>
                    <a href="#" aria-label="twitter" class="hover:text-gray-400">
                        <svg viewBox="0 0 24 24" fill="currentColor" class="h-5 w-5">
                            <path
                                    d="M22.162 5.656a8.384 8.384 0 0 1-2.402.658A4.196 4.196 0 0 0 21.6 4c-.82.488-1.719.83-2.656 1.015a4.182 4.182 0 0 0-7.126 3.814 11.874 11.874 0 0 1-8.62-4.37 4.168 4.168 0 0 0-.566 2.103c0 1.45.738 2.731 1.86 3.481a4.168 4.168 0 0 1-1.894-.523v.052a4.185 4.185 0 0 0 3.355 4.101 4.21 4.21 0 0 1-1.89.072A4.185 4.185 0 0 0 7.97 16.65a8.394 8.394 0 0 1-6.191 1.732 11.83 11.83 0 0 0 6.41 1.88c7.693 0 11.9-6.373 11.9-11.9 0-.18-.005-.362-.013-.54a8.496 8.496 0 0 0 2.087-2.165z"
                            />
                        </svg
                        >
                    </a>
                    <a href="#" aria-label="instagram" class="hover:text-gray-400">
                        <svg viewBox="0 0 24 24" fill="currentColor" class="h-5 w-5">
                            <path
                                    d="M12 2c2.717 0 3.056.01 4.122.06 1.065.05 1.79.217 2.428.465.66.254 1.216.598 1.772 1.153a4.908 4.908 0 0 1 1.153 1.772c.247.637.415 1.363.465 2.428.047 1.066.06 1.405.06 4.122 0 2.717-.01 3.056-.06 4.122-.05 1.065-.218 1.79-.465 2.428a4.883 4.883 0 0 1-1.153 1.772 4.915 4.915 0 0 1-1.772 1.153c-.637.247-1.363.415-2.428.465-1.066.047-1.405.06-4.122.06-2.717 0-3.056-.01-4.122-.06-1.065-.05-1.79-.218-2.428-.465a4.89 4.89 0 0 1-1.772-1.153 4.904 4.904 0 0 1-1.153-1.772c-.248-.637-.415-1.363-.465-2.428C2.013 15.056 2 14.717 2 12c0-2.717.01-3.056.06-4.122.05-1.066.217-1.79.465-2.428a4.88 4.88 0 0 1 1.153-1.772A4.897 4.897 0 0 1 5.45 2.525c.638-.248 1.362-.415 2.428-.465C8.944 2.013 9.283 2 12 2zm0 5a5 5 0 1 0 0 10 5 5 0 0 0 0-10zm6.5-.25a1.25 1.25 0 0 0-2.5 0 1.25 1.25 0 0 0 2.5 0zM12 9a3 3 0 1 1 0 6 3 3 0 0 1 0-6z"
                            />
                        </svg
                        >
                    </a>
                    <a href="#" aria-label="linkedin" class="hover:text-gray-400">
                        <svg viewBox="0 0 24 24" fill="currentColor" class="h-5 w-5">
                            <path
                                    d="M6.94 5a2 2 0 1 1-4-.002 2 2 0 0 1 4 .002zM7 8.48H3V21h4V8.48zm6.32 0H9.34V21h3.94v-6.57c0-3.66 4.77-4 4.77 0V21H22v-7.93c0-6.17-7.06-5.94-8.72-2.91l.04-1.68z"
                            />
                        </svg
                        >
                    </a>
                    <a href="#" aria-label="youtube" class="hover:text-gray-400">
                        <svg viewBox="0 0 24 24" fill="currentColor" class="h-5 w-5">
                            <path
                                    d="M21.543 6.498C22 8.28 22 12 22 12s0 3.72-.457 5.502c-.254.985-.997 1.76-1.938 2.022C17.896 20 12 20 12 20s-5.893 0-7.605-.476c-.945-.266-1.687-1.04-1.938-2.022C2 15.72 2 12 2 12s0-3.72.457-5.502c.254-.985.997-1.76 1.938-2.022C6.107 4 12 4 12 4s5.896 0 7.605.476c.945.266 1.687 1.04 1.938 2.022zM10 15.5l6-3.5-6-3.5v7z"
                            />
                        </svg
                        >
                    </a>
                </div>
            </div>
            <div class="p-4 w-full sm:w-6/12 md:flex-1 lg:w-3/12">
                <h2 class="font-bold text-color3-500 text-xl">FitHub</h2>
                <hr class="border-gray-600 inline-block mb-6 mt-4 w-3/12"/>
                <ul>
                    <li class="mb-4">
                        <a href="#" class="hover:text-gray-400">FAQ</a>
                    </li>
                    <li class="mb-4">
                        <a href="#" class="hover:text-gray-400">News</a>
                    </li>
                    <li class="mb-4">
                        <a href="#" class="hover:text-gray-400">Careers</a>
                    </li>
                    <li class="mb-4">
                        <a href="#" class="hover:text-gray-400">About Us</a>
                    </li>
                    <li class="mb-4">
                        <a href="#" class="hover:text-gray-400">Contact Us</a>
                    </li>
                </ul>
            </div>
            <div class="p-4 w-full sm:w-6/12 md:flex-1 lg:w-3/12">
                <h2 class="font-bold text-color3-500 text-xl">Health</h2>
                <hr class="border-gray-600 inline-block mb-6 mt-4 w-3/12"/>
                <ul>
                    <li class="mb-4">
                        <a href="#" class="hover:text-gray-400">Yoga</a>
                    </li>
                    <li class="mb-4">
                        <a href="#" class="hover:text-gray-400">Sports</a>
                    </li>
                    <li class="mb-4">
                        <a href="#" class="hover:text-gray-400">Running</a>
                    </li>
                    <li class="mb-4">
                        <a href="#" class="hover:text-gray-400">Dancing</a>
                    </li>
                    <li class="mb-4">
                        <a href="#" class="hover:text-gray-400">Diet</a>
                    </li>
                </ul>
            </div>
            <div class="p-4 w-full md:w-5/12 lg:w-4/12">
                <h2 class="font-bold text-color3-500 text-xl">Top Cities</h2>
                <hr class="border-gray-600 inline-block mb-6 mt-4 w-3/12"/>
                <div class="-mx-4 flex flex-wrap">
                    <div class="pb-4 px-4 w-full sm:w-6/12">
                        <ul>
                            <li class="mb-4">
                                <a href="#" class="hover:text-gray-400">Taxes</a>
                            </li>
                            <li class="mb-4">
                                <a href="#" class="hover:text-gray-400">Boston</a>
                            </li>
                            <li class="mb-4">
                                <a href="#" class="hover:text-gray-400">Colorado</a>
                            </li>
                            <li class="mb-4">
                                <a href="#" class="hover:text-gray-400">California</a>
                            </li>
                            <li class="mb-4">
                                <a href="#" class="hover:text-gray-400">Manhattan</a>
                            </li>
                        </ul>
                    </div>
                    <div class="pb-4 px-4 w-full sm:w-6/12">
                        <ul>
                            <li class="mb-4">
                                <a href="#" class="hover:text-gray-400">Dallas</a>
                            </li>
                            <li class="mb-4">
                                <a href="#" class="hover:text-gray-400">Huston</a>
                            </li>
                            <li class="mb-4">
                                <a href="#" class="hover:text-gray-400">Seattle</a>
                            </li>
                            <li class="mb-4">
                                <a href="#" class="hover:text-gray-400">Denver</a>
                            </li>
                            <li class="mb-4">
                                <a href="#" class="hover:text-gray-400">Phoenix</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="py-4">
            <hr class="mb-4 opacity-25"/>
            <div class="flex flex-wrap -mx-4 items-center">
                <div class="px-4 py-2 w-full md:flex-1">
                    <p>&copy; 2024. All Rights Reserved - FitHub
                    </p>
                </div>
                <div class="px-4 py-2 w-full md:w-auto">
                    <a href="#" class="hover:text-gray-400">Privacy Policy</a> |
                    <a href="#" class="hover:text-gray-400">Terms of Use</a>
                </div>
            </div>
        </div>
    </div>
</footer>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"
></script>
<script src="https://cdn.tailwindcss.com"></script>
</body>
</html>

