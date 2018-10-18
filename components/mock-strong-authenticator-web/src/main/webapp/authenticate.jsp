<%@ page import="org.owasp.encoder.Encode" %>

<!DOCTYPE html>
<html class="gr__localhost"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"><meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>WSO2 Open Banking</title>

<link rel="icon" href="https://localhost:9446/smsotpauthenticationendpoint/images/favicon.png" type="image/x-icon">
<link href="resources-authenticate/bootstrap.css" rel="stylesheet">
<link href="resources-authenticate/font-wso2.html" rel="stylesheet">
<link href="resources-authenticate/Roboto.css" rel="stylesheet">
<link href="resources-authenticate/custom-common.css" rel="stylesheet">

<!--[if lt IE 9]>
<script src="js/html5shiv.min.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->

        <script src="resources-authenticate/scripts.js"></script>
        <script src="resources-authenticate/jquery-1.js"></script>
    </head>

    <body data-gr-c-s-loaded="true">

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
                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 login">
                            <div class="boarder-all data-container">
                                <div class="clearfix"></div>
                                <form id="pin_form" name="pin_form" action="../../commonauth" method="POST" class="form-horizontal">
                                    <div class="login-form">
                                        <div id="loginTable1" class="identity-box">

                                            <div class="form-group">
                                                <div class="col-md-9">
                                                  <input type="hidden" name="sessionDataKey" value='<%=Encode.forHtmlAttribute(request.getParameter("sessionDataKey"))%>'/>
                                                    <input name="authenticate" id="authenticate" value="Complete the trasnaction" class="btn btn-primary" type="button">
                                                </div>
                                            </div>


                                        </div>
                                        <input name="resendCode" id="resendCode" value="false" type="hidden">
                                    </div>
                                </form>
                            </div>
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

<script src="resources-authenticate/jquery-1_002.js"></script>
<script src="resources-authenticate/bootstrap.js"></script>
    <script type="text/javascript">
    $(document).ready(function() {
    	$('#authenticate').click(function() {
            $('#pin_form').submit();
	    });
    });
    $(document).ready(function() {
    	$('#resendCodeLinkDiv').click(function() {
	        document.getElementById("resendCode").value = "true";
	        $('#pin_form').submit();
    	});
    });
    </script>

    </body></html>
