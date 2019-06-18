public class SendAccountUsingRESTAPI {
    public Account acc{get; set;}
    public static string acIdValue{ get; set;}
    public static List<Contact> conList{get;set;}
    private final String clientId = '3MVG9YDQS5WtC11rnesS2OWrAbi.Wi_V_PlDxvFiFeLCCXhJh2XfpPuMc0fPst6urtEH4myzKyyqruD7F05Ue';
    private final String clientSecret = '376754151407810698';
    private final String username = 'vk@cloudcertitude.com';
    private final String password = 'cloud1237k6vgIRGEKfjWWGsw5ZGiXi4C';
    public class deserializeResponse{
        public String id;
        public String access_token;
    }
    public SendAccountUsingRESTAPI(){
        acc = new Account();
    }
    public String ReturnAccessToken(SendAccountUsingRESTAPI acount){
        String reqbody = 'grant_type=password&client_id='+clientId+'&client_secret='+clientSecret+'&username='+username+'&password='+password;
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setBody(reqbody);
        req.setMethod('GET');
        req.setEndpoint('https://login.salesforce.com/services/oauth2/token');
        HttpResponse res = h.send(req);
        deserializeResponse resp1 = (deserializeResponse)JSON.deserialize(res.getbody(),deserializeResponse.class);
        system.debug('@@@@access_token@@'+resp1 );
        return resp1.access_token;
    }
    public static void callgetContact(){  
        System.debug('acIdValue @#'+acIdValue);
        SendAccountUsingRESTAPI acount1 = new SendAccountUsingRESTAPI();
        String accessToken;
        accessToken = acount1.ReturnAccessToken(acount1);
        list<Contact> LstContact = new List<Contact>();
        if(accessToken != null){
            String endPoint = 'https://my-dev-org123456-dev-ed.my.salesforce.com/services/apexrest/v1/getContacts/' +acIdValue;
            //String jsonstr = '{"accId" : "' + accId+ '"}';
            Http h2 = new Http();
            HttpRequest req1 = new HttpRequest();
            req1.setHeader('Authorization','Bearer ' + accessToken);
            req1.setHeader('Content-Type','application/json');
            req1.setHeader('accept','application/json');
            //req1.setBody(jsonstr);
            req1.setMethod('GET');
            req1.setEndpoint(endPoint);
            HttpResponse res1 = h2.send(req1);
            String trimmedResponse = res1.getBody().unescapeCsv().remove('\\');
            system.debug('@@@RESPONSE@@'+trimmedResponse);
            JSONParser parser = JSON.createParser(res1.getBody());
            System.debug('parser !!@@ '+parser);
            set<Contact> contList=new set<Contact>();
            
            while (parser.nextToken() != null) {
                //Id
                
                if((parser.getCurrentToken() == JSONToken.FIELD_NAME) ){
                    Contact cont;
                    if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'Id')) {
                        // Get the value.
                        parser.nextToken();
                        // Compute the grand total price for all invoices.
                        string sId= parser.getText();
                        cont=new Contact();
                        cont.Id=sId;
                        system.debug('Id@@@' + sId);
                        
                        parser.nextToken();
                        if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'FirstName')) {
                            // Get the value.
                            parser.nextToken();
                            // Compute the grand total price for all invoices.
                            string fName= parser.getText();
                            cont.FirstName=fName;
                            system.debug('Name@@@' + fName );
                        }
                        parser.nextToken();
                        if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'LastName')) {
                            // Get the value.
                            parser.nextToken();
                            // Compute the grand total price for all invoices.
                            string lName= parser.getText();
                            cont.LastName=lName;
                            system.debug('Name@@@' + lName );
                        }
                        
                        //Email
                        parser.nextToken();
                        if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'Email')) {
                            // Get the value.
                            parser.nextToken();
                            // Compute the grand total price for all invoices.
                            string sEmail= parser.getText();
                            cont.Email=sEmail;
                            system.debug('Email@@@' + sEmail);
                        }
                    }
                    contList.add(cont); 
                } 
                contList.remove(null);
            }
            LstContact.AddAll(contList);
            conList = new List<Contact>();
            conList.addAll(LstContact);
            System.debug('ConLis @#'+conList);
            system.debug('ContList@@@@'+Json.serialize(LstContact));
        }
        // return LstContact;
    }
    public void insertAcc(){
        SendAccountUsingRESTAPI acount1 = new SendAccountUsingRESTAPI();
        String accessToken;
        accessToken = acount1.ReturnAccessToken(acount1);
        if(accessToken != null){
            String endPoint = 'https://my-dev-org123456-dev-ed.my.salesforce.com/services/apexrest/v1/getContacts/';
            System.debug('EndPoint'+endPoint);
            //String jsonstr='{"Name":"'+ acc.Name +'","Phone":"'+ acc.Phone +'","type":"'+ acc.Type +'"}';
            String jsonstr=JSON.serialize(acc);
            //String jsonstr = '{"accId" : "' + accId+ '"}';
            Http h2 = new Http();
            HttpRequest req1 = new HttpRequest();
            req1.setHeader('Authorization','Bearer ' + accessToken);
            req1.setHeader('Content-Type','application/json');
            req1.setHeader('accept','application/json');
            req1.setBody(jsonstr);
            req1.setMethod('POST');
            req1.setEndpoint(endPoint);
            HttpResponse res1 = h2.send(req1);
            String trimmedResponse = res1.getBody().unescapeCsv().remove('\\');
            system.debug('@@@RESPONSE@@'+trimmedResponse);
            JSONParser parser = JSON.createParser(res1.getBody());
            System.debug('parser !!@@ '+parser);
        }
    }
}