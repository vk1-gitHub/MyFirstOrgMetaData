global class IterableExample implements iterable<Account>{
   global Iterator<Account> Iterator(){
      return new CustomIterable();
   }
}