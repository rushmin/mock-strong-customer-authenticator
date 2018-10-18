package org.wso2.sample.authenticator;

import org.wso2.carbon.identity.application.authentication.framework.AbstractApplicationAuthenticator;
import org.wso2.carbon.identity.application.authentication.framework.AuthenticatorFlowStatus;
import org.wso2.carbon.identity.application.authentication.framework.LocalApplicationAuthenticator;
import org.wso2.carbon.identity.application.authentication.framework.config.builder.FileBasedConfigurationBuilder;
import org.wso2.carbon.identity.application.authentication.framework.config.model.AuthenticatorConfig;
import org.wso2.carbon.identity.application.authentication.framework.context.AuthenticationContext;
import org.wso2.carbon.identity.application.authentication.framework.exception.AuthenticationFailedException;
import org.wso2.carbon.identity.application.authentication.framework.exception.LogoutFailedException;
import org.wso2.carbon.identity.application.authentication.framework.model.AuthenticatedUser;
import org.wso2.carbon.identity.application.authentication.framework.util.FrameworkConstants;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * This mock authenticator mocks a mobile application based authenticator.
 */
public class MockStrongAuthenticator extends AbstractApplicationAuthenticator implements LocalApplicationAuthenticator {

    public static final String INIT_URL = "initURL";
    public static final String AUTHENTICATOR_NAME = "MockStrongAuthenticator";

    @Override
    public boolean canHandle(HttpServletRequest httpServletRequest) {

        return true;
    }


    @Override
    protected void initiateAuthenticationRequest(HttpServletRequest request,
                                                 HttpServletResponse response, AuthenticationContext context)
            throws AuthenticationFailedException {

        try {
            String initURL = getConfiguration(INIT_URL);
            String redirectionURL = initURL + "?" + context.getContextIdIncludedQueryParams();
            response.sendRedirect(redirectionURL);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void processAuthenticationResponse(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, AuthenticationContext authenticationContext) throws AuthenticationFailedException {
        AuthenticatedUser authenticatedUser = authenticationContext.getLastAuthenticatedUser();
        authenticationContext.setSubject(AuthenticatedUser.createLocalAuthenticatedUserFromSubjectIdentifier(authenticatedUser.getUserName()));
    }

    @Override
    public AuthenticatorFlowStatus process(HttpServletRequest request,
                                           HttpServletResponse response, AuthenticationContext context)
            throws AuthenticationFailedException, LogoutFailedException {

        if (context.isLogoutRequest()) {
            return AuthenticatorFlowStatus.SUCCESS_COMPLETED;
        } else {
            return super.process(request, response, context);
        }
    }

    @Override
    public String getContextIdentifier(HttpServletRequest httpServletRequest) {

        return httpServletRequest.getParameter(FrameworkConstants.SESSION_DATA_KEY);
    }

    @Override
    public String getName() {

        return AUTHENTICATOR_NAME;
    }

    @Override
    public String getFriendlyName() {

        return AUTHENTICATOR_NAME;
    }

    private String getConfiguration(String name) {
        AuthenticatorConfig authConfig = FileBasedConfigurationBuilder.getInstance().getAuthenticatorBean(getName());
        return authConfig.getParameterMap().get(name);
    }
}
