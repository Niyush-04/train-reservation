package com.trainreservation.util;

import java.util.Random;

public class PNRGenerator {
    public static String generatePNR() {
        Random random = new Random();
        int randomNumber = 100000 + random.nextInt(900000);
        return "PNR-" + randomNumber;
    }
}
