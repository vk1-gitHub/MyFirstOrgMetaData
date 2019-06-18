public class TaskUtil {
    
    public static String getTaskPriority(String leadState){
        
        if(String.isBlank(leadState) || leadstate.length() >2){
            return null;
        }
        
        String taskPriority;
        if(leadstate=='CA'){
               taskPriority = 'High';
        }
        else if(leadstate=='NY'){
            taskPriority = 'Normal';
        }        
        else{
         	   taskPriority = 'Low';
            }
         return taskPriority;            
    }

}