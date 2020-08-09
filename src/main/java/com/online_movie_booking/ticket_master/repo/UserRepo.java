package com.online_movie_booking.ticket_master.repo;

import com.online_movie_booking.ticket_master.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepo extends JpaRepository<User, Long> {

    User findByUserName(String userName);

    User findByUserNameAndPassword(String userName, String password);
}
