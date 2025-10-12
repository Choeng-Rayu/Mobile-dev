void main () {
  //for(int num = 1; num <= 5; num++){print("$num \n");}
  int num = 0;
  while(true) {
     num++;
     if(num == 20){
        break; 
     }
     else if(num % 2 == 1) {
        print("$num is odd");
     }else{
        print("$num is even");
     } 
  } 
}
