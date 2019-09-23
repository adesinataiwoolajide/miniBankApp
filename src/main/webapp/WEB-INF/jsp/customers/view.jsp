<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>

<%@ include file="../sidebar.jsp" %>

<div class="clearfix"></div>

<div class="content-wrapper">
    <div class="container-fluid">
        <div class="row pt-2 pb-2">
            <div class="col-sm-12">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="./">Home</a></li>
                    <li class="breadcrumb-item"><a href="/administrator/customer/view/${customer.customerid}">View Customer </a></li>
                    <li class="breadcrumb-item"><a href="/administrator/customer/edit/${customer.customerid}">Edit Customer</a></li>
                    <li class="breadcrumb-item"><a href="/administrator/customers/">Add Customer</a></li>
                    <li class="breadcrumb-item active" aria-current="page">${customer.customername}</li>
                </ol>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-4">
                <div class="card profile-card-2">
                    <div class="card-img-block">
                        <img class="img-fluid" src="/resources/user1.png" alt="Card image cap" align="center">
                    </div>
                    <div class="card-body pt-5">
                        <img src="/resources/user.png" alt="profile-image" class="profile">
                        <h5 class="card-title">${customer.customername}</h5>
                        <p class="card-text">${customer.mnemonic}.</p>
                        <div class="icon-block">
                            <a href="javascript:void();"><i class="fa fa-facebook bg-facebook text-white"></i></a>
                            <a href="javascript:void();"> <i class="fa fa-twitter bg-twitter text-white"></i></a>
                            <a href="javascript:void();"> <i class="fa fa-google-plus bg-google-plus text-white"></i></a>
                        </div>
                    </div>

                    <div class="card-body border-top border-light">
                        <div class="media align-items-center">
                            <div>
                                <img src="/resources/user.png" class="skill-img" alt="skill img">
                            </div>
                            <div class="media-body text-left ml-3">
                                <div class="progress-wrapper">
                                    <p>CUSTOMER BALANCE <span class="float-right">65%</span></p>
                                    <div class="progress" style="height: 5px;">
                                        <div class="progress-bar gradient-blooker" style="width:65%"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="media align-items-center">
                            <div><img src="/resources/user.png" class="skill-img" alt="skill img"></div>
                            <div class="media-body text-left ml-3">
                                <div class="progress-wrapper">
                                    <p>NOS OF ACCT <span class="float-right">50%</span></p>
                                    <div class="progress" style="height: 5px;">
                                        <div class="progress-bar gradient-purpink" style="width:50%"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="media align-items-center">
                            <div><img src="/resources/user.png" class="skill-img" alt="skill img"></div>
                            <div class="media-body text-left ml-3">
                                <div class="progress-wrapper">
                                    <p>TRANSACTION <span class="float-right">70%</span></p>
                                    <div class="progress" style="height: 5px;">
                                        <div class="progress-bar gradient-ibiza" style="width:70%"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="media align-items-center">
                            <div><img src="/resources/user.png" class="skill-img" alt="skill img"></div>
                            <div class="media-body text-left ml-3">
                                <div class="progress-wrapper">
                                    <p>FUND TRANSFER <span class="float-right">35%</span></p>
                                    <div class="progress" style="height: 5px;">
                                        <div class="progress-bar gradient-scooter" style="width:35%"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </div>

            <div class="col-lg-8">
                <div class="card">
                    <div class="card-body">
                        <ul class="nav nav-tabs nav-tabs-primary top-icon nav-justified">
                            <li class="nav-item">
                                <a href="javascript:void();" data-target="#profile" data-toggle="pill" class="nav-link active">
                                    <i class="icon-user"></i> <span class="hidden-xs">Profile</span></a>
                            </li>
                            <li class="nav-item">
                                <a href="javascript:void();" data-target="#messages" data-toggle="pill" class="nav-link">
                                    <i class="icon-envelope-open"></i> <span class="hidden-xs">ACCOUNT</span></a>
                            </li>
                            <li class="nav-item">
                                <a href="javascript:void();" data-target="#edit" data-toggle="pill" class="nav-link">
                                    <i class="icon-note"></i> <span class="hidden-xs">Edit</span></a>
                            </li>
                        </ul>
                        <div class="tab-content p-3">
                            <div class="tab-pane active" id="profile">
                                <h5 class="mb-3">Customer Profile</h5>
                                <div class="row">


                                    <div class="col-md-6">

                                        <div class="table-responsive">
                                            <table class="table table-hover table-striped">
                                                <tbody>
                                                    <tr>
                                                        <td> Name</td  >
                                                        <td>${customer.customername}</td>
                                                    </tr>
                                                </tbody>
                                                <tbody>
                                                    <tr>
                                                        <td> Mnemonic</td  >
                                                        <td>${customer.mnemonic}</td>
                                                    </tr>
                                                </tbody>
                                                <tbody>
                                                    <tr>
                                                        <td>Phone Number</td  >
                                                        <td>${customer.phonenumber}</td>
                                                    </tr>
                                                </tbody>
                                                <tbody>
                                                    <tr>
                                                        <td>Nationality</td  >
                                                        <td>${customer.nationality}</td>
                                                    </tr>
                                                </tbody>
                                                <tbody>
                                                <tr>
                                                    <td> Gender</td>
                                                    <td>${customer.gender}</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="col-md-6">

                                        <div class="table-responsive">
                                            <table class="table table-hover table-striped">
                                                <tbody>
                                                    <tr>
                                                        <td> Customer ID</td  >
                                                        <td>${customer.customerid}</td>

                                                    </tr>
                                                </tbody>
                                                <tbody>
                                                <tr>
                                                    <td> Sector</td  >
                                                    <td>${customer.sector.sectorname}</td>
                                                </tr>
                                                </tbody>
                                                <tbody>
                                                <tr>
                                                    <td>Address</td  >
                                                    <td>${customer.kinaddress}</td>
                                                </tr>
                                                </tbody>
                                                <tbody>
                                                <tr>
                                                    <td>Kin Name</td  >
                                                    <td>${customer.kinname}</td>
                                                </tr>
                                                </tbody>
                                                <tbody>
                                                <tr>
                                                    <td>Kin Address</td  >
                                                    <td>${customer.kinaddress}</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <!--/row-->
                            </div>
                            <div class="tab-pane" id="messages">
                                <div class="alert alert-info alert-dismissible" role="alert">
                                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                                    <div class="alert-icon">
                                        <i class="icon-info"></i>
                                    </div>
                                    <div class="alert-message">
                                        <span><strong>Info!</strong> List of ${customer.customername} Accounts.</span>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table id="default-datatable" class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>S/N</th>
                                            <th>Account </th>
                                            <th> Name</th>
                                            <th> Category</th>
                                            <th>Currency</th>
                                            <th> Officer</th>
                                        </tr>
                                        </thead>

                                        <tfoot>
                                        <tr>
                                            <th>S/N</th>
                                            <th>Account </th>
                                            <th> Name</th>
                                            <th> Category</th>
                                            <th>Currency</th>
                                            <th> Officer</th>
                                        </tr>
                                        </tfoot>
                                        <tbody>
                                        <c:forEach var="account" items="${accounts}" >
                                            <tr>

                                                <td>
                                                    <a href="/administrator/account/delete/${account.accountid}" class="btn btn-danger"
                                                       onclick="return(confirmToDelete());"><i class="fa fa-trash-o"></i></a>
                                                    <a href="/administrator/account/edit/${account.accountid}" class="btn btn-success"
                                                       onclick="return(confirmToEdit());"><i class="fa fa-pencil"></i></a>
                                                </td>
                                                <td>${account.accountnumber}</td>
                                                <td>${account.customer.customername}</td>
                                                <td>${account.accountCategory.accountcategoryname}</td>
                                                <td>${account.currency.currencyname}</td>
                                                <td>${account.accountOfficer.officername}</td>

                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tab-pane" id="edit">
                                <form action="/administrator/customer/update" method="POST" enctype="multipart/form-data">

                                    <div class="form-group row ">

                                        <div class="col-sm-4">
                                            <label>Customer Name </label>
                                            <input type="text" class="form-control form-control-rounded" name="customername"
                                                   required value="${customer.customername}"
                                                   placeholder="Enter The Currency Name">
                                            <span style="color: red">** This Field is Required **</span>
                                            <span id="customernaname.errors" class="error">${customername.errors}</span>
                                        </div>

                                        <div class="col-sm-4">
                                            <label>Customer Mnemonic </label>
                                            <input type="text" class="form-control form-control-rounded"
                                                   name="mnemonic" required value="${customer.mnemonic}"
                                                   placeholder="Enter The Customer Mnemonic">
                                            <span style="color: red">** This Field is Required **</span>
                                            <span id="mnemonic.errors" class="error">${mnemonic.errors}</span>
                                        </div>

                                        <div class="col-sm-4">
                                            <label>Gender </label>
                                            <select class="form-control form-control-rounded" name="gender"
                                                    required>
                                                <option value="${customer.gender}"> ${customer.gender}</option>
                                                <option value=""></option>
                                                <option value="Male">Male</option>
                                                <option value="Female"> Female</option>
                                            </select>
                                            <span style="color: red">** This Field is Required **</span>
                                            <span id="gebder.errors" class="error">${gender.errors}</span>
                                        </div>

                                        <div class="col-sm-4">
                                            <label>Phone Number </label>
                                            <input type="text" class="form-control form-control-rounded"
                                                   name="phonenumber" required value="${customer.phonenumber}"
                                                   placeholder="Enter The Phone Number">
                                            <span style="color: red">** This Field is Required **</span>
                                            <span id="phonenumber.errors" class="error">${phonenumber.errors}</span>
                                        </div>

                                        <div class="col-sm-4">
                                            <label>Nationality </label>
                                            <select class="form-control form-control-rounded" name="nationality"
                                                    required>
                                                <option value="${customer.nationality}">${customer.nationality} </option>
                                                <option value=""></option>
                                                <option value="Nigerian">Nigerian</option>
                                                <option value="Others"> Others</option>
                                            </select>
                                            <span style="color: red">** This Field is Required **</span>
                                            <span id="nationality.errors" class="error">${nationality.errors}</span>
                                        </div>

                                        <div class="col-sm-4">
                                            <label>Sector </label>
                                            <select class="form-control form-control-rounded" name="sectorid"
                                                    required>
                                                <option value="${customer.sector.sectorid}"> ${customer.sector.sectorname}</option>
                                                <option value=""></option>

                                                <c:forEach var="sectors" items="${secto}">
                                                    <option value="${sectors.sectorid}">${sectors.sectorname}</option>
                                                </c:forEach>

                                            </select>
                                            <span style="color: red">** This Field is Required **</span>
                                            <span id="sectorid.errors" class="error">${sectorid.errors}</span>
                                        </div>

                                        <div class="col-sm-4">
                                            <label>Residential Address </label>
                                            <textarea type="text" class="form-control form-control-rounded"
                                                      name="address" required placeholder="Enter The Address"> ${customer.address} </textarea>
                                            <span style="color: red">** This Field is Required **</span>
                                            <span id="address.errors" class="error">${address.errors}</span>
                                        </div>

                                        <div class="col-sm-4">
                                            <label>Next of Kin Name </label>
                                            <input type="text" class="form-control form-control-rounded"
                                                   name="kinname" required value="${customer.kinname}"
                                                   placeholder="Enter The Kin Name">
                                            <span style="color: red">** This Field is Required **</span>
                                            <span id="kinnane.errors" class="error">${kinname.errors}</span>
                                        </div>

                                        <div class="col-sm-4">

                                            <label>Kin Address </label>
                                            <textarea type="text" class="form-control form-control-rounded"
                                                      name="kinaddress" required placeholder="Enter The Kin Address">
                                                ${customer.kinaddress}
                                            </textarea>
                                            <span style="color: red">** This Field is Required **</span>
                                            <span id="kinaddress.errors" class="error">${kinaddress.errors}</span>
                                        </div>
                                        <input type="hidden" name="customerid" value="${customer.customerid}">

                                        <div class="col-sm-12" align="center">
                                            <button type="submit" class="btn btn-outline-danger btn-lg btn-block">
                                                UPDATE THE CUSTOMER
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header"><i class="fa fa-table"></i> Please Preview ${customer.customername} Details</div>
                    <div class="card-body">

                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- End container-fluid-->

</div><!--End content-wrapper-->

<a href="" class="back-to-top"><i class="fa fa-angle-double-up"></i>Go Up </a>
<%@ include file="../footer.jsp" %>