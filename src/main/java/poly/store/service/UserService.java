package poly.store.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.stereotype.Service;
import poly.store.entity.Account;
import poly.store.repository.AccountRepository;

import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService {
    @Autowired
    AccountService accountService;

    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        try{
            Account account= accountService.findById(username);
            String[] roles = account.getAuthorities().stream().
                    map(er -> er.getRole().getName())
                    .collect(Collectors.toList()).toArray(new String[0]);
            return  User.withUsername(username)
                    .password(passwordEncoder.encode(account.getPassword()))
                    .roles(roles).build();
        }catch (Exception e){
           e.printStackTrace();
            throw new UsernameNotFoundException(username+"not found");
        }
    }
    public void loginOAuth2(OAuth2AuthenticationToken oAuth2){
        String name=oAuth2.getPrincipal().getAttribute("name");
        String password=Long.toHexString(System.currentTimeMillis());
        UserDetails user=User.withUsername(name)
                .password(passwordEncoder.encode(password))
                .roles("Admin").build();
        Authentication auth=new UsernamePasswordAuthenticationToken(user,null,user.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(auth);
    }
}
