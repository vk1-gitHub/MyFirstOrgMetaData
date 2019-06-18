public class TestList {
    public List<String> l=new List<String>{'A','B','C'};
    public void show()
    {
       List<String> st=new List<String>{'Ram','Shyam','Pankaj'};
           
           System.debug('All Elements of List are :');
          for(String s : st)
          {
              System.debug(s);
          }
        st.add('Arun');
        System.debug(' After Adding one Element All Elements of List are :');
          for(String s : st)
          {
              System.debug(s);
          }
        st.addAll(l);
         
        st.add(0, 'Vijay');
        
        
        st.set(2, 'Manoj');
        st.sort();
           System.debug('All Elements of List are :');
          for(String s : st)
          {
              
              System.debug(s);    
              
              
          }
        System.debug('4th Index Value = '+st.get(4));
        System.debug('List is Empty = '+st.isEmpty());
        System.debug('List is Empty = '+st.size());
       
        
        
        
    }
    
        
}