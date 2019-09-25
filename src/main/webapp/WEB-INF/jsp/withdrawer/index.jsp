<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>

<%@ include file="../sidebar.jsp" %>

<div class="clearfix"></div>

<div class="content-wrapper">
    <div class="container-fluid">
        <div class="row pt-2 pb-2">
            <div class="col-sm-9">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="./">Home</a></li>
                    <li class="breadcrumb-item"><a href="/administrator/withdrawers/">Customer Withdrawer</a></li>
                    <li class="breadcrumb-item active" aria-current="page">List of Saved Customer Balance</li>
                </ol>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <h5><p style="color: red" align="center">${error}</p>
                    <p style="color: green" align="center">${success}</p>
                </h5>
                <div class="card">
                    <div class="card-header"><i class="fa fa-table"></i> Customer Balance</div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="default-datatable" class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>S/N</th>
                                        <th>Customer Name</th>
                                        <th>Account Number</th>
                                        <th>Balance</th>
                                        <th>Amount</th>
                                        <th>Withdraw</th>
                                    </tr>
                                </thead>

                                <tfoot>
                                    <tr>
                                        <th>S/N</th>
                                        <th>Customer Name</th>
                                        <th>Account Number</th>
                                        <th>Balance</th>
                                        <th>Amount</th>
                                        <th>Withdraw</th>
                                    </tr>
                                </tfoot>
                                <tbody>
                                <c:forEach var="withdrawers" items="${withdrawer}" varStatus="counter">

                                        <tr>
                                            <td>
                                                ${counter.count}
                                            </td>
                                            <td>${withdrawers.account.customer.customername}</td>
                                            <td>${withdrawers.account.accountnumber}</td>
                                            <td><fmt:formatNumber value = "${withdrawers.workingb}" type = "currency" currencySymbol="&#8358;"/>
                                            </td>
                                            <form action="/administrator/withdrawer/save" method="POST" enctype="multipart/form-data">
                                                <td>
                                                    <input type="number" name="amount" class="form-control-rounded">
                                                    <input type="hidden" name="accountid" value="${withdrawers.account.accountid}"
                                                           class="form-control-rounded">
                                                    <input type="hidden" name="customername" value="${withdrawers.account.customer.customername}"
                                                           >
                                                    <input type="hidden" name="customerid" value="${withdrawers.account.customer.customerid}"
                                                           >
                                                    <input type="hidden" name="balance" value="${withdrawers.workingb}"
                                                           >
                                                </td>
                                                <td>
                                                    <button type="submit" class="btn btn-outline-danger btn-lg btn-block">
                                                        <i class="fa fa-bank"></i>  WITHDRAW
                                                    </button>
                                                </td>
                                            </form>
                                        </tr>

                                </c:forEach>
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- End container-fluid-->

</div><!--End content-wrapper-->


<a href="" class="back-to-top"><i class="fa fa-angle-double-up"></i>Go Up </a>
<%@ include file="../footer.jsp" %>