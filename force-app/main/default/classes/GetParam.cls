public class GetParam{
public List<String> listprm{get;set;}
 public GetParam(){
   String textValue=ApexPages.CurrentPage().getParameters().get('textvalue');
   String NumberValue=ApexPages.CurrentPage().getParameters().get('numberValue');
   String email=ApexPages.CurrentPage().getParameters().get('email');
   String autonum=ApexPages.CurrentPage().getParameters().get('Autonum');
   String dateval=ApexPages.CurrentPage().getParameters().get('dateval');
   String dateAndTimeValue=ApexPages.CurrentPage().getParameters().get('dateAndTimeValue');
   
   listprm = new List<String>();
   
   listprm.add(textValue);
   listprm.add(NumberValue);
   listprm.add(email);
   listprm.add(autonum);
   listprm.add(dateVal);
   listprm.add(dateAndTimeValue);
 }
}