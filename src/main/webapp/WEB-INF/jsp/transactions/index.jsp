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
                    <li class="breadcrumb-item"><a href="/administrator/transactions/">View Transactions</a></li>
                    <li class="breadcrumb-item active" aria-current="page">List of Saved Customer Transactions</li>

                </ol>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <h5><p style="color: red" align="center">${error}</p>
                    <p style="color: green" align="center">${success}</p>
                </h5>
                <div class="card">
                    <div class="card-header"><i class="fa fa-table"></i> List of Saved Customer Transactions</div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="default-datatable" class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>S/N</th>
                                    <th>Account Number</th>
                                    <th>Transaction type</th>
                                    <th>Amount</th>
                                    <th>Customer Name</th>


                                </tr>
                                </thead>

                                <tfoot>
                                <tr>
                                    <th>S/N</th>
                                    <th>Account Number</th>
                                    <th>Transaction type</th>
                                    <th>Amount</th>
                                    <th>Customer Name</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <c:forEach var="transaction" items="${transactions}" varStatus="counter">
                                    <tr>
                                        <td>${counter.count}
                                        </td>
                                        <td>${transaction.account.accountnumber}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${transaction.transactiontype == 'DR'}">
                                                   <p style="color: red">DR</p>
                                                </c:when>
                                                <c:when test="${transaction.transactiontype == 'CR'}">
                                                    <p style="color: green">CR</p>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>

                                        </td>
                                        <td><fmt:formatNumber value = "${transaction.amount}" type = "currency" currencySymbol="&#8358;"/>
                                        </td>
                                        <td>${transaction.customer.customername}</td>

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