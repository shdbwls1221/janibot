package study.janibot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = {"study.janibot"})
public class JanibotApplication {

    public static void main(String[] args) {
        SpringApplication.run(JanibotApplication.class, args);
    }
}