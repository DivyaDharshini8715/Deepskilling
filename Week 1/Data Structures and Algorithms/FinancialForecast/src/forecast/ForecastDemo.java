package forecast;

public class ForecastDemo {

    public static double futureValue(double currentValue, double growthRate, int years) {
        
        if (years == 0) {
            return currentValue;
        }

        return futureValue(currentValue, growthRate, years - 1) * (1 + growthRate);
    }

    public static void main(String[] args) {
        double currentValue = 10000;   
        double growthRate = 0.10;     
        int years = 3;

        double result = futureValue(currentValue, growthRate, years);

        System.out.println("Current Value: " + currentValue);
        System.out.println("Growth Rate: " + (growthRate * 100) + "%");
        System.out.println("Years: " + years);
        System.out.println("Predicted Future Value: " + result);
    }
}