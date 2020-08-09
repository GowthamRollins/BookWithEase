package com.online_movie_booking.ticket_master.utils;

import com.online_movie_booking.ticket_master.dto.AuthRequest;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import java.util.Date;
import java.util.function.Function;

public class JwtUtils {

    private static final String JWT_KEY = "!@#$%^^&*()_+";

    public static String generateToken(AuthRequest authRequest) {
        return Jwts.builder()
                .setSubject(authRequest.getUsername())
                .setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(System.currentTimeMillis() + (60 * 60 * 1000)))
                .signWith(SignatureAlgorithm.HS384, JWT_KEY.getBytes())
                .compact();
    }

    public static String getSubject(String token) {
        return getClaimsFromToken(token, Claims::getSubject);
    }

    public static boolean checkIfTokenIsValid(String token) {
        Date currentDate = new Date();
        Date expiredAt = getClaimsFromToken(token, Claims::getExpiration);
        return currentDate.before(expiredAt);
    }

    private static <T> T getClaimsFromToken(String token, Function<Claims, T> claimResolver) {
        return claimResolver.apply(getAllClaims(token));
    }

    private static Claims getAllClaims(String token) {
        return Jwts.parser().setSigningKey(JWT_KEY.getBytes()).parseClaimsJws(token).getBody();
    }
}
