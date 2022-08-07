package poly.store.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import poly.store.service.UserService;

@Controller
@RequestMapping("oauth2")
public class OAuth2Controller {

    @Autowired
    UserService userService;

    @GetMapping("login/success")
    public String success(OAuth2AuthenticationToken oAuth2) {
        userService.loginOAuth2(oAuth2);
        return "forward:/home/index";
    }
}
