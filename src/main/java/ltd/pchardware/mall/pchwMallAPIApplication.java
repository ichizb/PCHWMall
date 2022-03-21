package ltd.pchardware.mall;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("ltd.pchardware.mall.dao")
@SpringBootApplication
public class pchwMallAPIApplication {

    public static void main(String[] args) {
        SpringApplication.run(pchwMallAPIApplication.class, args);
    }
}
