@isTest
public class TestTaskUtil {
    @isTest static void TestTaskPriority(){
        String pri=TaskUtil.getTaskPriority('NY');
        System.assertEquals('Normal', pri);
    }
    @isTest static void TestHighTaskPriority(){
        String pri=TaskUtil.getTaskPriority('CA');
        System.assertEquals('High', pri);
    }
    @isTest static void TestTaskPriorityInvalid(){
        String pri=TaskUtil.getTaskPriority('abcd');
        System.assertEquals(null, pri);
    }
}