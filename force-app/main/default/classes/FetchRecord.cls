public class FetchRecord{

  public List<Contact> con;
  
  public List<Contact> getcon()
  {
    con = [select name,title,phone,email,fax FROM contact];
    return con;
  }
}