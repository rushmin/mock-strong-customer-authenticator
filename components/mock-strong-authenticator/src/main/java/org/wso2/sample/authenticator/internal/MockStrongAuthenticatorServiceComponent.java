package org.wso2.sample.authenticator.internal;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.osgi.service.component.ComponentContext;
import org.wso2.carbon.identity.application.authentication.framework.ApplicationAuthenticator;
import org.wso2.carbon.user.core.service.RealmService;
import org.wso2.sample.authenticator.MockStrongAuthenticator;

/**
 * @scr.component name="identity.application.authenticator.mock.component" immediate="true"
 */
public class MockStrongAuthenticatorServiceComponent {


    private static Log log = LogFactory.getLog(MockStrongAuthenticatorServiceComponent.class);

    protected void activate(ComponentContext ctxt) {
        try {
            MockStrongAuthenticator mockStrongAuthenticator = new MockStrongAuthenticator();
            ctxt.getBundleContext().registerService(ApplicationAuthenticator.class.getName(), mockStrongAuthenticator, null);
            if (log.isDebugEnabled()) {
                log.debug("MockStrongAuthenticator has been registered.");
            }
        } catch (Throwable e) {
            log.error("An error occurred while registering MockStrongAuthenticator.", e);
        }
    }

    protected void deactivate(ComponentContext ctxt) {

    }

}
