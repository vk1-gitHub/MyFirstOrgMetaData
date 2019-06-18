trigger AccountTestClassTrigger on Account (before Insert) {

  for(Account a: Trigger.new){
  
     if(a.industry =='Technology')
       a.description ='Technology Account';
   
  }

}