package com.singleton;

public class TestLogger {

	public static void main(String[] args) {
		 Logger logger1 = Logger.getInstance();
	        Logger logger2 = Logger.getInstance();

	        logger1.log("First message");
	        logger2.log("Second message");

	        if (logger1 == logger2) {
	            System.out.println("Only one Logger instance is created.");
	        } else {
	            System.out.println("Different Logger instances are created.");
	        }

	}

}
