public class YellowMarker extends Marker {
    public override void write() {
        System.debug('This is child class Method which is overriding parent class write Method');
        Marker obj1, obj2;
        obj1 = new Marker();
        obj1.write();
        obj2 = new YellowMarker();
        obj2.write();
        
        Double d = obj2.discount();
        System.debug('!!@@ '+d);
    } 
    
}