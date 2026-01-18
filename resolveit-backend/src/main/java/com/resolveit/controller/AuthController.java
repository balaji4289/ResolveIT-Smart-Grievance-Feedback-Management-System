package com.resolveit.controller;

import com.resolveit.dto.LoginRequest;
import com.resolveit.dto.LoginResponse;
import com.resolveit.dto.RegisterRequest;
import com.resolveit.model.User;
import com.resolveit.repository.UserRepository;
import com.resolveit.security.JwtUtil;

import jakarta.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private JwtUtil jwtUtil;

    // ✅ THESE TWO WERE MISSING / MISWIRED EARLIER
    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private UserDetailsService userDetailsService;

    // ========= REGISTER =========
    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody @Valid RegisterRequest request) {

        if (userRepository.existsByUsername(request.getUsername())) {
            return ResponseEntity.badRequest().body("Username already exists");
        }

        if (userRepository.existsByEmail(request.getEmail())) {
            return ResponseEntity.badRequest().body("Email already exists");
        }

        User user = new User();
        user.setUsername(request.getUsername());
        user.setFullName(request.getFullName());
        user.setEmail(request.getEmail());
        user.setPasswordHash(passwordEncoder.encode(request.getPassword()));
        user.setIsActive(true);

        userRepository.save(user);

        return ResponseEntity.ok("User registered successfully");
    }

    // ========= LOGIN (EMAIL BASED) =========
    @PostMapping("/login")
    public LoginResponse login(@RequestBody LoginRequest request) {

        // 1️⃣ Authenticate credentials
        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        request.getEmail(),
                        request.getPassword()
                )
        );

        // 2️⃣ Load UserDetails (includes ROLES)
        UserDetails userDetails =
                userDetailsService.loadUserByUsername(request.getEmail());

        // 3️⃣ Generate JWT WITH ROLES
        String token = jwtUtil.generateToken(userDetails);

        return new LoginResponse(token);
    }
}
