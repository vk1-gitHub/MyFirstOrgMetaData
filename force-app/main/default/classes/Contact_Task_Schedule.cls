public class Contact_Task_Schedule implements Schedulable{

     public void execute(SchedulableContext sch){
              Database.executeBatch(new Batch_Class_To_AssignTask());
           
     }
     
}