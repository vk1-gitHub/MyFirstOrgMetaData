public class PassParam1{
 
 public PageReference PassPrmNow(){
 
  PageReference px = Page.GetParam;
  px.getParameters().put('textValue',textValue);
  px.getParameters().put('NumberValue',String.valueOf(NumberValue));
  px.getParameters().put('email',email);
  px.getParameters().put('autonum',String.valueOf(autonum));
  px.getParameters().put('dateval',dateval);
  px.getParameters().put('dateAndTimeValue',dateAndTimeValue);
  px.setRedirect(true); 
    return px;
 }
 
public String textValue{get;set;}
public Integer NumberValue{get;set;}
public String email{get;set;}
public Integer autonum{get;set;}
public String dateval{get;set;}
public String dateAndTimeValue{get;set;}
  
}