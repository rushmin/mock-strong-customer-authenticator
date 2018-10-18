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
                                    <h3>Authorization Code</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 data-container">


                        <div class="clearfix"></div>
                        <form action="authenticate.jsp" method="post" id="oauth2_authz_confirm" name="oauth2_authz_confirm" class="form-horizontal">
                            <div class="login-form">
                                <div class="form-group">
                                    <div class="col-md-12">

                                        <h3 id="authorization-code"/>

                                    </div>
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
    <p>WSO2 Open Banking | © <script>document.write(new Date().getFullYear());</script>2018 Powered by <a title="WSO2" href="http://wso2.com/" target="_blank"><i class="icon fw fw-wso2"></i></a> Financial Solutions</p>
  </div>
</footer>

<script src="resources-consent/jquery-1.js"></script>
<script src="resources-consent/bootstrap.js"></script>
<script>
    $(document).ready(function() {
        var urlParams = new URLSearchParams(window.location.search);
        var authorizationCode = urlParams.get('code');
        $('#authorization-code').text(authorizationCode);
    });
</script>


</body></html>
