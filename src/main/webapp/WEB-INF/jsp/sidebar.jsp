<div id="sidebar-wrapper" class="bg-theme bg-theme4" data-simplebar="" data-simplebar-auto-hide="true">
    <%--<div class="brand-logo">--%>
        <%--<a href="/admnistrator/dashboard">--%>
            <%--<img src="/resources/images/jlogo.jpg" class="logo-icon" alt="logo icon">--%>
            <%--<h5 class="logo-text">JBank</h5>--%>
        <%--</a>--%>
    <%--</div>--%>
    <div class="user-details">
        <div class="media align-items-center user-pointer collapsed" data-toggle="collapse" data-target="#user-dropdown">
            <div class="avatar">
                <img class="mr-3 side-user-img" src="/resources/images/jlogo.jpg" alt="user avatar">
            </div>
            <div class="media-body">
                <h6 class="side-user-name">

                   ${user.user_name}

                </h6>
            </div>
        </div>
        <div id="user-dropdown" class="collapse">
            <ul class="user-setting-menu">
                <li><a href="">
                    <i class="icon-user"></i>  My Profile</a></li>
                <li><a href=""><i class="icon-user"></i>  My Activity Log</a></li>
                <li><a href=""><i class="icon-power"></i> Change Password</a></li>
                <li><a href="/logout"><i class="icon-power"></i> Logout</a></li>
            </ul>
        </div>
    </div>
    <ul class="sidebar-menu do-nicescrol">
        <li class="sidebar-header">MAIN NAVIGATION</li>
        <li><a href="/administrator/dashboard/" class="waves-effect"><i class="fa fa-database text-danger"></i> <span>Dashboard</span></a></li>
        <li><a href="/administrator/users/" class="waves-effect"><i class="fa fa-users text-danger"></i> <span>Users</span></a></li>
        <li><a href="/administrator/account_category/" class="waves-effect"><i class="fa fa-cogs text-danger"></i> <span>Account Categories</span></a></li>
        <li><a href="/administrator/currencies/" class="waves-effect"><i class="fa fa-money text-danger"></i> <span>Currencies</span></a></li>
        <li><a href="/administrator/sectors/" class="waves-effect"><i class="fa fa-sitemap text-danger"></i> <span>Sectors</span></a></li>
        <li><a href="/administrator/customers/" class="waves-effect"><i class="fa fa-briefcase text-danger"></i> <span>Customers</span></a></li>
        <li><a href="/administrator/account_officers/" class="waves-effect"><i class="fa fa-users text-danger"></i> <span>Account Officers</span></a></li>
        <li><a href="/administrator/accounts/" class="waves-effect"><i class="fa fa-money text-danger"></i> <span>Accounts</span></a></li>
        <li><a href="/administrator/transactions/" class="waves-effect"><i class="fa fa-bank text-danger"></i> <span>Transactions</span></a></li>
        <li><a href="/administrator/deposite/" class="waves-effect"><i class="fa fa-money text-danger"></i> <span>Deposite</span></a></li>
        <li><a href="/administrator/withdrawer/" class="waves-effect"><i class="fa fa-money text-danger"></i> <span>Withdrawer</span></a></li>
        <li><a href="" class="waves-effect"><i class="fa fa-money text-danger"></i> <span>Statements</span></a></li>


    </ul>
</div>

<header class="topbar-nav">
    <nav class="navbar navbar-expand fixed-top">
        <ul class="navbar-nav mr-auto align-items-center">
            <li class="nav-item">
                <a class="nav-link toggle-menu" href="">
                    <i class="icon-menu menu-icon"></i>
                </a>
            </li>
            <li class="nav-item">
                <form class="search-bar">
                    <input type="text" class="form-control" placeholder="Enter keywords">
                    <a href=""><i class="icon-magnifier"></i></a>
                </form>
            </li>
        </ul>

        <ul class="navbar-nav align-items-center right-nav-link">

            <li class="nav-item">
                <a class="nav-link dropdown-toggle dropdown-toggle-nocaret" data-toggle="dropdown" href="#">
                    <span class="user-profile"><img src="/resources/images/jlogo.jpg" class="img-circle" alt="user avatar"></span>
                </a>
                <ul class="dropdown-menu dropdown-menu-right">
                    <li class="dropdown-item user-details">
                        <a href="">
                            <div class="media">
                                <div class="avatar"><img class="align-self-start mr-3" src="/resources/images/jlogo.jpg" alt="user avatar"></div>
                                <div class="media-body">
                                    <h6 class="mt-2 user-title">Taiwo</h6>
                                    <p class="user-subtitle">Olajide</p>
                                </div>
                            </div>
                        </a>
                    </li>

                    <li class="dropdown-item"><i class="icon-power mr-2"></i> Logout</li>
                </ul>
            </li>
        </ul>
    </nav>
</header>