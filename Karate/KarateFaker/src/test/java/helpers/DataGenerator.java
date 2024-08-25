package helpers;


import com.github.javafaker.Faker;

import java.util.Locale;

public class DataGenerator {
    public static Faker faker = new Faker(new Locale("es", "CO"));

    public static String getRandomEmail() {
        String email = faker.internet().emailAddress().toLowerCase();
        return email;
    }

    public static String getRandomPassword() {
        String password = faker.internet().password();
        return password;
    }
    public static String getUserName(){
        String userName = faker.name().username();
        return userName;
    }
}
