package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
public class HealthCheckController {

    @Value("${server.env}")
    public String env;

    @Value("${server.port}")
    public String serverPort;

    @Value("${server.address}")
    public String serverAddress;

    @Value("${serverName}")
    public String serverName;

    @GetMapping("/hc")
    public ResponseEntity<?> healthCheck(){
        Map<String,String> responseData = new HashMap<>();
        responseData.put("serverName",serverName);
        responseData.put("serverAdress",serverAddress);
        responseData.put("serverPort",serverPort);
        responseData.put("env",env);


        return ResponseEntity.ok(responseData);
    }

    @GetMapping("/env")
    public ResponseEntity<?> getEnv(){
        return ResponseEntity.ok(env);
    }
}
