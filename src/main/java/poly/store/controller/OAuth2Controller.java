package poly.store.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import poly.store.entity.Account;
import poly.store.service.AccountService;
import poly.store.service.UserService;

@Controller
@RequestMapping("oauth2")
public class OAuth2Controller {

    @Autowired
    UserService userService;

    @Autowired
    AccountService accountService;

    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    @GetMapping("login/success")
    public String success(OAuth2AuthenticationToken oAuth2, Account account) {
        userService.loginOAuth2(oAuth2);
        String username=oAuth2.getPrincipal().getAttribute("name");
        boolean check_any = accountService.findAll().stream()
                .anyMatch(n -> n.getUsername().equals(username));
        if (!check_any){
            String password=Long.toHexString(System.currentTimeMillis());
            account.setUsername(username);
            account.setPassword(passwordEncoder.encode(password));
            account.setEmail(oAuth2.getPrincipal().getAttribute("email"));
            account.setFullname(oAuth2.getAuthorizedClientRegistrationId());
            account.setPhoto("default.jpg");
            accountService.create(account);
        }
        return "forward:/home/index";
    }
}
