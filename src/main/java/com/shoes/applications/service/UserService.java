package com.shoes.applications.service;


import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.shoes.applications.entity.User;
import com.shoes.applications.model.dto.UserDTO;
import com.shoes.applications.model.request.ChangePasswordRequest;
import com.shoes.applications.model.request.CreateUserRequest;
import com.shoes.applications.model.request.UpdateProfileRequest;

import java.util.List;

@Service
public interface UserService {
    List<UserDTO> getListUsers();

    Page<User> adminListUserPages(String fullName, String phone, String email, Integer page);

    User createUser(CreateUserRequest createUserRequest);

    void changePassword(User user, ChangePasswordRequest changePasswordRequest);

    User updateProfile(User user, UpdateProfileRequest updateProfileRequest);
}
