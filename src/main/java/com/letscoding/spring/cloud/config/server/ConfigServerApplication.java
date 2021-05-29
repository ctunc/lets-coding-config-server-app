package com.letscoding.spring.cloud.config.server;

import com.ulisesbocchio.jasyptspringboot.annotation.EnableEncryptableProperties;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.ApplicationPidFileWriter;
import org.springframework.cloud.config.server.EnableConfigServer;


@SpringBootApplication
@EnableConfigServer
@EnableEncryptableProperties
public class ConfigServerApplication {

    public static void main(String[] args) {
        SpringApplication application=new SpringApplication(ConfigServerApplication.class);
        application.addListeners(new ApplicationPidFileWriter());
        application.run(args);
    }
}
