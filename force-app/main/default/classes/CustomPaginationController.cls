public class CustomPaginationController {
    public boolean disableNext{get;set;}
    public boolean disablePrev{get;set;}
    public Integer totalRecords = 0;
    public Integer offsetSize = 0;
    public Integer limitSize = 10;
    public List<Account> accList = new List<Account>();
    public CustomPaginationController(){
        totalRecords = [Select count() FROM Account];
        disablePrev = true;
    }
    public List<Account> getAccRecords(){
       return accList = [Select name, type FROM Account LIMIT : limitSize OFFSET : offsetSize ];
    }
    public void next(){
        offsetSize = offsetSize + limitSize;
        disablePrev = false;
        if(offsetSize == (totalRecords - Math.mod(totalRecords,limitSize))){
            disableNext = true;
        }
    }
    public void prev(){
        offsetSize = offsetSize - limitSize;
        if(offsetSize == 0)
            disablePrev = true;
        disableNext = false;
    }
    public void firstPage(){
        offsetSize = 0;
        disablePrev = true;
        disableNext = false;
    }
    public void lastPage(){
        offsetSize = totalRecords - Math.mod(totalRecords,limitSize);
        disableNext = true;
        disablePrev = false;
    }
}