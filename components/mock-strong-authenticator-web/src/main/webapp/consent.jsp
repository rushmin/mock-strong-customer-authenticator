<%@ page import="org.owasp.encoder.Encode" %>

<!DOCTYPE html>
<html class="gr__localhost"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>WSO2 Open Banking</title>

<link rel="icon" href="https://localhost:9446/authenticationendpoint/images/favicon.png" type="image/x-icon">
<link href="resources-consent/bootstrap.css" rel="stylesheet">
<link href="resources-consent/font-wso2.css" rel="stylesheet">
<link href="resources-consent/Roboto.css" rel="stylesheet">
<link href="resources-consent/custom-common.css" rel="stylesheet">

<!--[if lt IE 9]>
<script src="js/html5shiv.min.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->
    <script src="resources-consent/jquery-3.js"></script>

</head>

<body data-gr-c-s-loaded="true">

<script type="text/javascript">
    function approved() {
        document.getElementById('consent').value = "approve";
		validateFrm();
    }

    function approvedBerlin() {
        document.getElementById('consent').value = "approve";
        validateFrmBerlin();
    }


    function approvedAlways() {
        document.getElementById('consent').value = "approveAlways";
		validateFrm();
    }

    function deny() {
        document.getElementById('consent').value = "deny";
        document.getElementById("oauth2_authz_confirm").submit();
    }

	function updateAcc(obj) {
		document.getElementById('account').value = obj.value;
	}

	function updatePaymentAcc(obj) {
		document.getElementById('paymentAccount').value = obj.value;
	}

	function validateFrmBerlin() {
        if(document.getElementById('type').value === "payments") {
            document.getElementById("oauth2_authz_confirm").submit();
        }
        if(document.getElementById('type').value === "accounts") {
            document.getElementById("oauth2_authz_confirm").submit();
        }
    }

    function validateFrm() {
        if(document.getElementById('type').value == "accounts") {
            if (document.getElementById('account').value === "" || document.getElementById('account').value === "default") {
                $(".acc-err").show();
                return false;
            } else {
                document.getElementById("oauth2_authz_confirm").submit();
            }
        }

        if(document.getElementById('type').value == "payments") {
            if (document.getElementById('paymentAccount').value === "" || document.getElementById('paymentAccount').value === "default") {
                $(".acc-err").show();
                return false;
            } else {
                document.getElementById("oauth2_authz_confirm").submit();
            }
        }
    }

    function getDataFromServer() {
        $.ajax({
            method: "GET",
            url: "https://localhost:9443/open-banking-berlin/services/accounts/accounts",
            headers:{
                'X-Request-ID' : '3469799e-470b-11e8-842f-0ed5f89f731e',
                'Consent-ID' : '6a1fa30d-5137-4437-82f2-a3a8950df59e'
            },
            success: function (data) {

                $.each(data["accounts"], function(key, value) {
                    $('#accountselectberlin').append($("<li></li>").attr("name", "iban").text(data["accounts"][key]["iban"]));
                });
            }
        });
    }
</script>


<div class="page-content-wrapper">
    <div class="container-fluid ">
        <div class="container">
            <div class="login-form-wrapper">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                        <div class="brand-container add-margin-bottom-5x">
                            <div class="row">
                                <div class="col-xs-6 col-sm-3 col-md-9 col-lg-9 center-block float-remove-sm float-remove-xs pull-right-md pull-right-lg">
                                    <h3>Mobile Device</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 data-container">
						<div class="alert alert-danger acc-err" style="display:none">Please select an Account.</div>



                        <div class="clearfix"></div>
                        <form action="authenticate.jsp" method="post" id="oauth2_authz_confirm" name="oauth2_authz_confirm" class="form-horizontal">
                            <div class="login-form">
                                <div class="form-group">
                                    <div class="col-md-12">

                                        <h3><strong>admin-AT-wso2.com_ertMEP_PRODUCTION
                                        </strong> requests account details on your account/s.</h3>

                                        <div style="color: rgba(54,249,16,0.57)">Required permissions :</div>
                                        <li> Read Account Information. </li>
                                        <li> Read Account Balance Information </li>
                                        <div style="color: rgba(59,254,18,0.57)">On following accounts</div>

                                        <li>DE40100100103307118608</li>

                                        <li>DE02100100109307118603</li>

                                        <li>DE67100100101306118605</li>

                                        <br>
                                        <div style="color: rgba(58,255,15,0.57)">Required permissions :</div>
                                        <li> Read Account Information. </li>
                                        <li> Read Account Transaction Information </li>
                                        <div style="color: rgba(59,255,18,0.57)">On following accounts</div>

                                        <li>DE40100100103307118608</li>


                                    </div>
                                </div>

                            </div>
                            <div class="form-group">
                                <div class="col-md-12" id="accountConsentDetails">
                                    <input class="btn btn-primary" id="approveAcc" name="approve" onclick="javascript: approvedBerlin(); return false;" value="Approve" type="button">
                                    <input class="btn btn-secondary" value="Deny" onclick="javascript: deny(); return false;" type="reset">

                                    <input name="sessionDataKeyConsent" value='<%=Encode.forHtmlAttribute(request.getParameter("sessionDataKey"))%>' type="hidden">
                                    <input name="consent" id="consent" value="allow" type="hidden">
                                    <input name="app" id="app" value="admin-AT-wso2.com_ertMEP_PRODUCTION" type="hidden">
                                    <input name="id" id="id" value="61572158-5181-4a5c-941b-da0de7c0e3e4" type="hidden">
                                    <input name="tppUniqueId" id="tppUniqueId" value="KxTT8T6VuSdMHZwjxKUDzfk9VnYa" type="hidden">
                                    <input name="user" id="user" value="admin@wso2.com@carbon.super" type="hidden">
                                    <input name="type" id="type" value="accounts" type="hidden">
                                    <input name="permission" id="permission" value="Default" type="hidden">
                                    <input name="transactionsList" id="transactionsList" value="[DE40100100103307118608, null]" type="hidden">
                                    <input name="balancesList" id="balancesList" value="[DE40100100103307118608, DE02100100109307118603, DE67100100101306118605]" type="hidden">
                                    <input name="accountsList" id="accountsList" value="[]" type="hidden">
                                    <input name="allaccountsList" id="allaccountsList" value="[DE40100100103307118608, null, DE40100100103307118608, DE02100100109307118603, DE67100100101306118605]" type="hidden">
                                    <input type="hidden" name="sessionDataKey" value='<%=Encode.forHtmlAttribute(request.getParameter("sessionDataKey"))%>'/>
                                </div>
                            </div>
                        </form>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>


<!-- footer -->
<footer class="footer">
  <div class="container-fluid">

  </div>
</footer>

<script src="resources-consent/jquery-1.js"></script>
<script src="resources-consent/bootstrap.js"></script>
<script>
    $(document).ready(function() {
          if ($('.auto-submit').length) {
              $('.auto-submit').submit();
          }
    });
</script>


</body></html>
