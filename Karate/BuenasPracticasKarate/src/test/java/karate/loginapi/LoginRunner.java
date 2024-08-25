package karate.loginapi;

import com.intuit.karate.junit5.Karate;

public class LoginRunner {
    public static final String LOGIN_API = "login_api";

    @Karate.Test
    Karate loginApi() {
        return Karate.run(LOGIN_API).relativeTo(getClass());
    }
}
