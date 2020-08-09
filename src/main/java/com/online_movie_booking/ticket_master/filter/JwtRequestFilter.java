package com.online_movie_booking.ticket_master.filter;

import com.online_movie_booking.ticket_master.repo.UserRepo;
import com.online_movie_booking.ticket_master.utils.JwtUtils;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class JwtRequestFilter extends OncePerRequestFilter {

    private final UserRepo userRepo;

    public JwtRequestFilter(UserRepo userRepo) {
        this.userRepo = userRepo;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws IOException {
        try {
            String authToken = request.getHeader("Authorization");
            if (authToken != null && authToken.startsWith("Bearer ")) {
                String jwt = authToken.substring(7);
                if (JwtUtils.checkIfTokenIsValid(jwt)) {
                    String subject = JwtUtils.getSubject(jwt);
                    if (subject != null && SecurityContextHolder.getContext().getAuthentication() == null) {
                        UserDetails userDetails = userRepo.findByUserName(subject);
                        UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
                        SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);
                    }
                }
            }
            filterChain.doFilter(request, response);
            //Handover the authorization mechanism to spring security . It checks for every subsequent request if context is set.
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "You are unauthorized");
        }
    }
}
