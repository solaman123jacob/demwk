@RestResource(urlMapping='/WebHooker')
global with sharing class WebHookerSub {
    @HttpPost
    global static void WebHookerSub() {
        try {
            RestRequest request=RestContext.request;
            RestResponse response=RestContext.response;
            
        } catch (Exception e) {
            System.debug(e.getMessage());
        }

    }
}