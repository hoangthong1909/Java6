package poly.store.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import poly.store.service.UserService;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    @Autowired
    UserService userService;


    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService).passwordEncoder(passwordEncoder);
    }

    @Override
    protected void configure(HttpSecurity httpSecurity) throws Exception {
        httpSecurity.csrf().disable().cors().disable();
        //authorization to use
        httpSecurity.authorizeRequests()
                .antMatchers("/admin/**","/assets/admin/**").hasAnyRole("Staff","Admin")
                .antMatchers("/rest/roles","/rest/accounts/**").hasRole("Admin")
                .antMatchers("/order/**").authenticated()
                .anyRequest().permitAll();
        httpSecurity.exceptionHandling().accessDeniedPage("/auth/unauthorized");
        //login
        httpSecurity
                .formLogin()
                .loginPage("/auth/login/form")
                .loginProcessingUrl("/auth/login") //submit form
                .defaultSuccessUrl("/auth/login/success",false) // co the chuyen huong toi url trc do
                .failureUrl("/auth/login/error") //dang nhap false thi chuyen huong toi day
                .usernameParameter("username")
                .passwordParameter("password");
        //remember
        httpSecurity.rememberMe().rememberMeParameter("remember").tokenValiditySeconds(86400);
        //logout
        httpSecurity
                .logout()
                .logoutUrl("/auth/logout")
                .logoutSuccessUrl("/auth/logout/success");
        // OAuth2 Facebook & Google
        httpSecurity
                .oauth2Login()
                .loginPage("/auth/login/form")
                .defaultSuccessUrl("/oauth2/login/success",true)
                .failureUrl("/auth/login/error")
                .authorizationEndpoint()
                .baseUri("/oauth2/authorization");
    }

}
