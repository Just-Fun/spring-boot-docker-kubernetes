package com.serzh.docker.resource;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("docker")
public class HelloResource {

    private static final String VERSION = "2.1";

    @GetMapping("/hello")
    public String hello() {
        log.info("Received docker hello request. version - {}", VERSION);
        return "Hello docker! version - " + VERSION;
    }
}
