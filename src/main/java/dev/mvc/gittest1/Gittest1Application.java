package dev.mvc.gittest1;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"dev.mvc"})
public class Gittest1Application {

	public static void main(String[] args) {
		SpringApplication.run(Gittest1Application.class, args);
	}

}
