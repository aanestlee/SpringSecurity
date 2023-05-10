package com.example.springsecurity.services;

import com.example.springsecurity.models.User;
import com.example.springsecurity.models.enums.Role;
import com.example.springsecurity.repositories.UserRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.jpa.repository.Query;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    // public void act;

    public boolean createUser(User user) {
        String userName = user.getName();
        if (userRepository.findByName(userName) != null) return false;


        user.setActive(true);
        user.getRoles().add(Role.ROLE_USER);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        log.info("Saving new User with name: {}", userName);
        userRepository.save(user);
        return true;
    }

    public List<User> listAll(){
        return (List<User>) userRepository.findAll();
    }
    public void save(User user){
        user.setActive(true);
        user.getRoles().add(Role.ROLE_USER);
        userRepository.save(user);
    }

    public User get(Integer id) throws UserNotFoundException {
        Optional<User> result = userRepository.findById(Long.valueOf(id));
        if(result.isPresent()){
            return result.get();
        }
        throw new UserNotFoundException("Could not find any user");
    }



    //рабочее
/*    public void delete(Integer id) throws UserNotFoundException {
        Long count =  userRepository.countById(Long.valueOf(id));
        if(count == null || count == 0){
            throw new UserNotFoundException("Could not find any user with ID " + id);
        }
        userRepository.deleteById(Long.valueOf(id));
    }*/


    public void delete(Integer id) throws UserNotFoundException {
       // Long count =  userRepository.countById(Long.valueOf(id));
        userRepository.deleteById(Long.valueOf(id));
    }
    public class UserNotFoundException extends Throwable {
        public UserNotFoundException(String s) {
        }
    }

}

