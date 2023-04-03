@RestResource(urlMapping='/WebHooker')
global with sharing class WebHookerSub {
    @HttpPost
    global static void WebHookerSub() {
        try {
            RestRequest request=RestContext.request;
            RestResponse response=RestContext.response;
            string hashedval=request.headers.get('X-Hub-Signature-256');
            Blob Bb=request.requestBody;
    JSONParser parser=JSON.createParser(request.requestBody.Tostring());

pusher ps;
//head_commit hc;
string repo;
while(parser.nextToken()!=null)
{
   if( parser.getText()=='pusher')
   {
    parser.nextToken();
    ps=(pusher)parser.readValueAs(pusher.class);

   }
   if( parser.getText()=='full_name')
   {
    parser.nextToken();
    repo=parser.getText();

   }


}
gitpush__c gp=new gitpush__c();
gp.Name = ps!=null?ps.name:'';
     insert gp;       
        } catch (Exception e) {
            System.debug('sadaa'+e.getMessage());
        }

    }
    public class pusher{
        public string name;
    
      public string email;
      public pusher(string name,string email)
      {
        name=name;
        email=email;

      }

    }
}