public class TemperatureConverter {
    
    public static Decimal FahrenHeitToCelcious(Decimal fh){
        Decimal cs = (fh - 32) * 5/9;
        return cs.setScale(2);
    }

}