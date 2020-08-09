package com.online_movie_booking.ticket_master.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Getter
public class AuthRequest {

    private String username;

    private String password;

}
