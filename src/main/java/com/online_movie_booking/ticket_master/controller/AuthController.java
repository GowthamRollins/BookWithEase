package com.online_movie_booking.ticket_master.controller;

import com.online_movie_booking.ticket_master.dto.AuthRequest;
import com.online_movie_booking.ticket_master.repo.UserRepo;
import com.online_movie_booking.ticket_master.utils.JwtUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AuthController {

    private final UserRepo userRepo;

    public AuthController(UserRepo userRepo) {
        this.userRepo = userRepo;
    }

    @PostMapping("/authenticate")
    public ResponseEntity authenticate(@RequestBody AuthRequest authRequest) {
        if (userRepo.findByUserNameAndPassword(authRequest.getUsername(), authRequest.getPassword()) != null) {
            return ResponseEntity.ok(JwtUtils.generateToken(authRequest));
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }
    }

    @GetMapping("/welcome")
    public ResponseEntity endPointToTestAuth() {
        return ResponseEntity.ok("You are Authenticated");
    }
}
