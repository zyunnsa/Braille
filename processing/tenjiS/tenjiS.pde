//This code has been arranged by Yasushi Noguchi. Last updated on July 1, 2009.
//oscP5plug by andreas schlegel
 
//open sound controlのライブラリを追加する（必須）
import oscP5.*;
import netP5.*;
 
OscP5 oscP5;    

 
import processing.serial.*;
import cc.arduino.*;
 
Arduino arduino;

NetAddress myRemoteLocation;


//color
int color1 =255;
int color2 =255;
int color3 =255;
int color4 =255;
int color5 =255;
int color6 =255;


int i =0;
int n =0;
int n1 =0;


char fir;
char sec;
char thi;


String ch2;
char vowel;




  void setup(){	
    background(255);
    size(500,400);
    println(Arduino.list());
    
    //!!arduinonosuruaryporto wasratenaika
    arduino = new Arduino(this, Arduino.list()[4], 57600);
    
    for (int i = 2; i <8; i++){
      arduino.pinMode(i, Arduino.OUTPUT);
      oscP5 = new OscP5(this,6230);
      myRemoteLocation = new NetAddress("127.0.0.1",6230);
    }

 
    //受信用の変数。右の数字はポート番号。送信側のポート番号とあわせる。
    oscP5 = new OscP5(this,12000);
 
    //データを送る先の関数を登録する。ここでは、getDataは相手先の関数。
    //「/pattern」は送信側と受信側で同じである必要がある暗号のようなもの
     oscP5.plug(this,"getData","/pattern");
   }


  public void getData(int nfi,int nse,int nth) {
    colorMode( RGB, 256 ); //デフォルト
    char nfir =(char(nfi));
    char nsec =(char(nse));
    char nthi =(char(nth));
    
      if(n==0){
        char data[] ={nfir};
        sec =nfir;
        ch2 = new String(data);
        char[] cha2 = ch2.toCharArray();
        vowel =cha2[0];
        n++;
    }else{
    
        if(i==0){
        char data[] ={nfir,nsec};
        fir =nsec;
        sec =nfir;
        thi =nthi;
    
        ch2 = new String(data);
        char[] cha2 = ch2.toCharArray();
        vowel =cha2[1];
        i++;
    
    }else if(i==1){
    
      char data[] = {nsec,nthi}; 
      fir =nthi;
      sec =nsec;
      thi =nfir;
  
      ch2 = new String(data);
      char[] cha2 = ch2.toCharArray();
      vowel =cha2[1];
  
      i++;

    }else if(i==2){
  
      char data[] = {nthi,nfir}; 
      fir =nfir;
      sec =nthi;
      thi=nsec;
  
      ch2 = new String(data);
      char[] cha2 = ch2.toCharArray();
  
      vowel =cha2[1];
      i=0;
    }
  }





  switch(vowel) {
    case 'a':
      color1 =100;
      color2 =255;
      color3 =255;
      color4 =255;
      color5 =255;
      color6 =255;
    
    break;
    
    
    case 'i':
      color1 =100;
      color2 =100;
      color3 =255;
      color4 =255;
      color5 =255;
      color6 =255;
    
    break;
    
    
    case 'u':
      color1 =100;
      color2 =255;
      color3 =255;
      color4 =100;
      color5 =255;
      color6 =255;
  
    break;
  
  
    case 'e':
      color1 =100;
      color2 =100;
      color3 =255;
      color4 =100;
      color5 =255;
      color6 =255;
    
    break;
  
  
    case 'o':
      color1 =255;
      color2 =100;
      color3 =255;
      color4 =100;
      color5 =255;
      color6 =255;
    
    break;
    
    case '-':
      color1 =255;
      color2 =100;
      color3 =255;
      color4 =255;
      color5 =100;
      color6 =255;
      
      break;
      
      
     case ',':
      color1 =255;
      color2 =255;
      color3 =255;
      color4 =255;
      color5 =100;
      color6 =100;
        
       break;
      
     case '.':
      color1 =255;
      color2 =100;
      color3 =255;
      color4 =255;
      color5 =100;
      color6 =100;
       
      break;
       
       
     case '0':
      color1 =255;
      color2 =255;
      color3 =100;
      color4 =100;
      color5 =100;
      color6 =100;
         
      delay(500);
         
      color1 =255;
      color2 =100;
      color3 =255;
      color4 =100;
      color5 =100;
      color6 =255;
         
      break;

     case '1':
      color1 =255;
      color2 =255;
      color3 =100;
      color4 =100;
      color5 =100;
      color6 =100;
         
      delay(500);
         
      color1 =100;
      color2 =255;
      color3 =255;
      color4 =255;
      color5 =255;
      color6 =255;
         
      break;
         
         
     case '2':
      color1 =255;
      color2 =255;
      color3 =100;
      color4 =100;
      color5 =100;
      color6 =100;
           
      delay(500);
           
      color1 =100;
      color2 =100;
      color3 =255;
      color4 =255;
      color5 =255;
      color6 =255;
           
      break;
          
           
     case '3':
      color1 =255;
      color2 =255;
      color3 =100;
      color4 =100;
      color5 =100;
      color6 =100;
          
      delay(500);
      color1 =100;
      color2 =255;
      color3 =255;
      color4 =100;
      color5 =255;
      color6 =255;
            
       break;
       
     case '4':
      color1 =255;
      color2 =255;
      color3 =100;
      color4 =100;
      color5 =100;
      color6 =100;
            
      delay(500);
            
      color1 =100;
      color2 =255;
      color3 =255;
      color4 =100;
      color5 =100;
      color6 =255;
            
      break;
            
            
     case '5':
      color1 =255;
      color2 =255;
      color3 =100;
      color4 =100;
      color5 =100;
      color6 =100;
             
      delay(500);
             
       color1 =100;
       color2 =255;
       color3 =255;
       color4 =255;
       color5 =100;
       color6 =255;
             
       break;
            
      case '6':
       color1 =255;
       color2 =255;
       color3 =100;
       color4 =100;
       color5 =100;
       color6 =100;

       delay(500);
             
       color1 =100;
       color2 =100;
       color3 =255;
       color4 =100;
       color5 =255;
       color6 =255;

       break;
       
      case '7':
       color1 =255;
       color2 =255;
       color3 =100;
       color4 =100;
       color5 =100;
       color6 =100;
             
       delay(500);
            
       color1 =100;
       color2 =100;
       color3 =255;
       color4 =100;
       color5 =100;
       color6 =255;
             
       break;
       
       case '8':
      
       color1 =255;
       color2 =255;
       color3 =100;
       color4 =100;
       color5 =100;
       color6 =100;
             
          
       delay(500);
         
       color1 =100;
       color2 =100;
       color3 =255;
       color4 =255;
       color5 =100;
       color6 =255;
            
       break;
            
            
      case '9':
         
       color1 =255;
       color2 =255;
       color3 =100;
       color4 =100;
       color5 =100;
       color6 =100;
              
       delay(500);
              
       color1 =255;
       color2 =100;
       color3 =255;
       color4 =100;
       color5 =255;
       color6 =255;
              
       break;
              
              
      case ' ':
       color1 =255;
       color2 =255;
       color3 =255;
       color4 =255;
       color5 =255;
       color6 =255;
              
       break;
     }
      
     if(sec=='k'){
     
       switch(fir){
          
         case 'a':
          
          color1 =100;
          color2 =255;
          color3 =255;
          color4 =255;
          color5 =255;
          color6 =100;
            
          break;
            
            
         case 'i':
          color1 =100;
          color2 =100;
          color3 =255;
          color4 =255;
          color5 =255;
          color6 =100;
           
          break;
           
         case'u':
          color1 =100;
          color2 =255;
          color3 =255;
          color4 =100;
          color5 =255;
          color6 =100;
          
          break;
          
         case'e':
          color1 =100;
          color2 =100;
          color3 =255;
          color4 =100;
          color5 =255;
          color6 =100;
          
          break;
          
         case'o':
          color1 =255;
          color2 =100;
          color3 =255;
          color4 =100;
          color5 =255;
          color6 =100;
          
          break;
          
         case'k':
         
          color1 =255;
          color2 =100;
          color3 =255;
          color4 =255;
          color5 =255;
          color6 =255;
          
          break;
        }
        
     
      }else if(sec=='s'){
        switch(fir){
          
          case 'a':
            color1 =100;
            color2 =255;
            color3 =255;
            color4 =255;
            color5 =100;
            color6 =100; 
          
            break;
            
          case 'i':
            color1 =100;
            color2 =100;
            color3 =255;
            color4 =255;
            color5 =100;
            color6 =100;
            
            break;
 
         case'u':
            color1 =100;
            color2 =255;
            color3 =255;
            color4 =100;
            color5 =100;
            color6 =100;
           
           break;
 
        case'e':
            color1 =100;
            color2 =100;
            color3 =255;
            color4 =100;
            color5 =100;
            color6 =100;
        
        break;
        
        case'o':
          color1 =255;
          color2 =100;
          color3 =255;
          color4 =100;
          color5 =100;
          color6 =100;
        
        break;
        
       case's':
         color1 =255;
         color2 =100;
         color3 =255;
         color4 =255;
         color5 =255;
         color6 =255;
         break;
       }
     }else if(sec=='t'){
       switch(fir){
          case 'a':
           color1 =100;
           color2 =255;
           color3 =100;
           color4 =255;
           color5 =100;
           color6 =255;
           
           break;
           
          case 'i':
            
           color1 =100;
           color2 =100;
           color3 =100;
           color4 =255;
           color5 =100;
           color6 =255;
           
           break;
           
          case'u':
           color1 =100;
           color2 =255;
           color3 =100;
           color4 =100;
           color5 =100;
           color6 =255;
           
           break;
 
          
         case'e':
          color1 =100;
          color2 =100;
          color3 =100;
          color4 =100;
          color5 =100;
          color6 =255;
          break;
 
         case'o':
          color1 =255;
          color2 =100;
          color3 =100;
          color4 =100;
          color5 =100;
          color6 =255;
          break;
 
        case't':
          color1 =255;
          color2 =100;
          color3 =255;
          color4 =255;
          color5 =255;
          color6 =255;
          
          break; 
        }
      }else if(sec=='n'){
       switch(fir){
        case 'a':
         color1 =100;
         color2 =255;
         color3 =100;
         color4 =255;
         color5 =255;
         color6 =255;
 
          break;
  
        case 'i':
         color1 =100;
         color2 =100;
         color3 =100;
         color4 =255;
         color5 =255;
         color6 =255;
        break;
 
       case'u':
        color1 =100;
        color2 =255;
        color3 =100;
        color4 =100;
        color5 =255;
        color6 =255;
        
        break;
 
      case'e':
        color1 =100;
        color2 =100;
        color3 =100;
        color4 =100;
        color5 =255;
        color6 =255;
        break;
 
      case'o':
        color1 =255;
        color2 =100;
        color3 =100;
        color4 =100;
        color5 =255;
        color6 =255;
        break;
 
       case'n':
        color1 =255;
        color2 =255;
        color3 =100;
        color4 =255;
        color5 =100;
        color6 =100;
        
        break;
      }
    }else if(sec=='h'){
      switch(fir){
        
      case 'a':
        color1 =100;
        color2 =255;
        color3 =100;
        color4 =255;
        color5 =255;
        color6 =100;
          
        break;
  
      case 'i':
        color1 =100;
        color2 =100;
        color3 =100;
        color4 =255;
        color5 =255;
        color6 =100;
        
        break;
 
      case'u':
        color1 =100;
        color2 =255;
        color3 =100;
        color4 =100;
        color5 =255;
        color6 =100;
        break;
 
       case'e':
        color1 =100;
        color2 =100;
        color3 =100;
        color4 =100;
        color5 =255;
        color6 =100;
        break;
 
      case'o':
        color1 =255;
        color2 =100;
        color3 =100;
        color4 =100;
        color5 =255;
        color6 =100;
        break;
 
     case'h':
       color1 =255;
       color2 =100;
       color3 =255;
       color4 =255;
       color5 =255;
       color6 =255;
       break;
     }
   }else if(sec=='m'){

    switch(fir){
     case 'a':
      
       color1 =100;
       color2 =255;
       color3 =100;
       color4 =255;
       color5 =100;
       color6 =100;
 
       break;
  
     case 'i':
       color1 =100;
       color2 =100;
       color3 =100;
       color4 =255;
       color5 =100;
       color6 =100;
       break;
   
     case'u':
       color1 =100;
       color2 =255;
       color3 =100;
       color4 =100;
       color5 =100;
       color6 =100;
       break;
 
     case'e':
       color1 =100;
       color2 =100;
       color3 =100;
       color4 =100;
       color5 =100;
       color6 =100;
       break;
 
     case'o':
       color1 =255;
       color2 =100;
       color3 =100;
       color4 =100;
       color5 =100;
       color6 =100;
       break;
 
     case'm':
       color1 =255;
       color2 =100;
       color3 =255;
       color4 =255;
       color5 =255;
       color6 =255;
       break;
    }
  }else if(sec=='y'){
    switch(fir){
     case 'a':

 
      if(thi=='k'){
  
       color1 =255;
       color2 =255;
       color3 =255;
       color4 =100;
       color5 =255;
       color6 =255;
       
       delay(500);
       
       color1 =100;
       color2 =255;
       color3 =255;
       color4 =255;
       color5 =255;
       color6 =100;
     
   }else if(thi =='g'){
  
       color1 =255;
       color2 =255;
       color3 =255;
       color4 =100;
       color5 =100;
       color6 =255;
 
       delay(500);
       
       color1 =100;
       color2 =255;
       color3 =255;
       color4 =255;
       color5 =255;
       color6 =100;
  
    }else if(thi =='s'){
  
      color1 =255;
      color2 =255;
      color3 =255;color4 =100;
      color5 =255;color6 =255;
 
   delay(500);
 
     color1 =100;
     color2 =255;
     color3 =255;
     color4 =255;
     color5 =100;
     color6 =100;
  }else if(thi =='z'){
  
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =100;
     color5 =100;
     color6 =255;
     
     delay(500);
 
     color1 =100;
     color2 =255;
     color3 =255;
     color4 =255;
     color5 =100;
     color6 =100;
   
   }else if(thi =='t'){
  
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =100;
     color5 =255;
     color6 =255;
 
     delay(500);
 
     color1 =100;
     color2 =255;
     color3 =100;
     color4 =255;
     color5 =100;
     color6 =255;
  
  }else if(thi =='d'){
  
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =100;
     color5 =100;
     color6 =255;
 
     delay(500);
 
     color1 =100;
     color2 =255;
     color3 =100;
     color4 =255;
     color5 =100;
     color6 =255;
  
  }else if(thi =='n'){
  
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =100;
     color5 =255;
     color6 =255;
 
     delay(500);
 
     color1 =100;
     color2 =255;
     color3 =100;
     color4 =255;
     color5 =255;
     color6 =255;
  
  
 }else if(thi =='h'){
  
    color1 =255;
    color2 =255;
    color3 =255;
    color4 =100;
    color5 =255;
    color6 =255;
 
   delay(500);
 
    color1 =100;
    color2 =255;
    color3 =100;
    color4 =255;
    color5 =255;
    color6 =100;
  
  }else if(thi =='b'){
  
    color1 =255;
    color2 =255;
    color3 =255;
    color4 =100;
    color5 =100;
    color6 =255;
 
    delay(500);
 
    color1 =100;
    color2 =255;
    color3 =100;
    color4 =255;
    color5 =255;
    color6 =100;
   
  }else if(thi =='p'){
  
    color1 =255;
    color2 =255;
    color3 =255;
    color4 =100;
    color5 =255;
    color6 =100;
 
    delay(500);
 
    color1 =100;
    color2 =255;
    color3 =100;
    color4 =255;
    color5 =255;
    color6 =100;
  
 
  }else if(thi =='m'){
  
    color1 =255;
    color2 =255;
    color3 =255;
    color4 =100;
    color5 =255;
    color6 =255;
 
    delay(500);
 
    color1 =100;
    color2 =255;
    color3 =100;
    color4 =255;
    color5 =100;
    color6 =100;
  
  }else if(thi =='r'){
   
    color1 =255;
    color2 =255;
    color3 =255;
    color4 =100;
    color5 =255;
    color6 =255;
 
    delay(500);
 
    color1 =100;
    color2 =255;
    color3 =255;
    color4 =255;
    color5 =100;
    color6 =255;
  
  }else{

    color1 =255;
    color2 =255;
    color3 =100;
    color4 =100;
    color5 =255;
    color6 =255;
  }
 
  break;
  
 
  case'u':
   if(thi=='k'){
  
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =100;
     color5 =255;
     color6 =255;
 
     delay(500);
 
     color1 =100;
     color2 =255;
     color3 =255;
     color4 =100;
     color5 =255;
     color6 =100;
   
   }else if(thi =='g'){
     
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =100;
     color5 =100;
     color6 =255;
    
     delay(500);
     
     color1 =100;
     color2 =255;
     color3 =255;
     color4 =100;
     color5 =255;
     color6 =100;
  
  }else if(thi =='s'){
  
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =100;
     color5 =255;
     color6 =255;
 
     delay(500);
 
     color1 =100;
     color2 =255;
     color3 =255;
     color4 =100;
     color5 =100;
     color6 =100;
  
  }else if(thi =='z'){
  
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =100;
     color5 =100;
     color6 =255;
 
     delay(500);
     
     color1 =100;
     color2 =255;
     color3 =255;
     color4 =100;
     color5 =100;
     color6 =100;
  
 }else if(thi =='t'){
  
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =100;
     color5 =255;
     color6 =255;
 
     delay(500);
 
     color1 =100;
     color2 =255;
     color3 =100;
     color4 =100;
     color5 =100;
     color6 =255;
  
  }else if(thi =='d'){
  
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =100;
     color5 =100;
     color6 =255;
 
     delay(500);
 
     color1 =100;
     color2 =255;
     color3 =100;
     color4 =100;
     color5 =100;
     color6 =255;
  
 }else if(thi =='n'){
  
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =100;
     color5 =255;
     color6 =255;
 
     delay(500);
 
     color1 =100;
     color2 =255;
     color3 =100;
     color4 =100;
     color5 =255;
     color6 =255;
   
 }else if(thi =='h'){
  
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =100;
     color5 =255;
     color6 =255;
 
     delay(500);
 
     color1 =100;
     color2 =255;
     color3 =100;
     color4 =100;
     color5 =255;
     color6 =100;
  }else if(thi =='b'){
  
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =100;
     color5 =100;
     color6 =255;
 
     delay(500);
 
     color1 =100;
     color2 =255;
     color3 =100;
     color4 =100;
     color5 =255;
     color6 =100;
  
 }else if(thi =='p'){
  
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =100;
     color5 =255;
     color6 =100;
 
     delay(500);
 
     color1 =100;
     color2 =255;
     color3 =100;
     color4 =100;
     color5 =255;
     color6 =100;
   
 }else if(thi =='m'){
  
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =100;
     color5 =255;
     color6 =255;
 
     delay(500);
 
     color1 =100;
     color2 =255;
     color3 =100;
     color4 =100;
     color5 =100;
     color6 =100;
  
  
 }else if(thi =='r'){
  
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =100;
     color5 =255;
     color6 =255;
 
     delay(500);
 
     color1 =100;
     color2 =255;
     color3 =255;
     color4 =100;
     color5 =100;
     color6 =255;
  
  }else{
  
     color1 =255;
     color2 =255;
     color3 =100;
     color4 =100;
     color5 =255;
     color6 =100;
   
 }
 
   break;
 
 
   case'o':
  
  
   if(thi=='k'){
  
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =100;
     color5 =255;
     color6 =255;
 
     delay(500);
 
     color1 =255;
     color2 =100;
     color3 =255;
     color4 =100;
     color5 =255;
     color6 =100;
  
  }else if(thi =='g'){
  
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =100;
     color5 =100;
     color6 =255;
 
     delay(500);
 
     color1 =255;
     color2 =100;
     color3 =255;
     color4 =100;
     color5 =255;
     color6 =100;
  
 }else if(thi =='s'){
  
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =100;
     color5 =255;
     color6 =255;
 
     delay(500);
 
     color1 =255;
     color2 =100;
     color3 =255;
     color4 =100;
     color5 =100;
     color6 =100;
  
  }else if(thi =='z'){
  
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =100;
     color5 =100;
     color6 =255;
 
     delay(500);

     color1 =255;
     color2 =100;
     color3 =255;
     color4 =100;
     color5 =100;
     color6 =100;
  
 }else if(thi =='t'){
  
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =100;
     color5 =255;
     color6 =255;
 
     delay(500);
 
     color1 =255;
     color2 =100;
     color3 =100;
     color4 =100;
     color5 =100;
     color6 =255;
  }else if(thi =='d'){
  
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =100;
     color5 =100;
     color6 =255;
 
     delay(500);
 
     color1 =255;
     color2 =100;
     color3 =100;
     color4 =100;
     color5 =100;
     color6 =255;
  
   }else if(thi =='n'){
  
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =100;
     color5 =255;
     color6 =255;
 
     delay(500);
 
     color1 =255;
     color2 =100;
     color3 =100;
     color4 =100;
     color5 =255;
     color6 =255;
  
  
 }else if(thi =='h'){
  
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =100;
     color5 =255;
     color6 =255;
 
     delay(500);
 
     color1 =255;
     color2 =100;
     color3 =100;
     color4 =100;
     color5 =255;
     color6 =100;
  
  }else if(thi =='b'){
  
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =100;
     color5 =100;
     color6 =255;
 
     delay(500);
 
     color1 =255;
     color2 =100;
     color3 =100;
     color4 =100;
     color5 =255;
     color6 =100;
  
  }else if(thi =='p'){
  
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =100;
     color5 =255;
     color6 =100;
 
     delay(500);
 
     color1 =255;
     color2 =100;
     color3 =100;
     color4 =100;
     color5 =255;
     color6 =100;
  
 }else if(thi =='m'){
  
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =100;
     color5 =255;
     color6 =255;
 
     delay(500);
 
     color1 =255;
     color2 =100;
     color3 =100;
     color4 =100;
     color5 =100;
     color6 =100;
   
 }else if(thi =='r'){
  
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =100;
     color5 =255;
     color6 =255;
 
     delay(500);
 
     color1 =255;
     color2 =100;
     color3 =255;
     color4 =100;
     color5 =100;
     color6 =255;
  
  }else{
     color1 =255;
     color2 =255;
     color3 =100;
     color4 =100;
     color5 =100;
     color6 =255;
   }
 
   break;
 
   case'y':
    color1 =255;
    color2 =100;
    color3 =255;
    color4 =255;
    color5 =255;
    color6 =255;
   
    break;
  }
 }else if(sec=='r'){
  switch(fir){
    
    case 'a':
    
      color1 =100;
      color2 =255;
      color3 =255;
      color4 =255;
      color5 =100;
      color6 =255;
 
      break;
    
    
    case 'i':
    
      color1 =100;
      color2 =100;
      color3 =255;
      color4 =255;
      color5 =100;
      color6 =255;
      
      break;
 
      case'u':
      
      color1 =100;
      color2 =255;
      color3 =255;
      color4 =100;
      color5 =100;
      color6 =255;
      
      break;
 
     case'e':
      color1 =100;
      color2 =100;
      color3 =255;
      color4 =100;
      color5 =100;
      color6 =255;
      
      break;
 
    case'o':
      color1 =255;
      color2 =100;
      color3 =255;
      color4 =100;
      color5 =100;
      color6 =255;
      
      break;
 
    case'r':
      color1 =255;
      color2 =100;
      color3 =255;
      color4 =255;
      color5 =255;
      color6 =255;
      
      break;
    }
  }else if(sec=='w'){
    switch(fir){
      
     case 'a':
      
      color1 =255;
      color2 =255;
      color3 =100;
      color4 =255;
      color5 =255;
      color6 =255;
      
      break;
  
     case 'i':
      
      color1 =255;
      color2 =100;
      color3 =100;
      color4 =255;
      color5 =255;
      color6 =255;
      
      break;
 
     case'e':
       color1 =255;
       color2 =100;
       color3 =100;
       color4 =255;
       color5 =100;
       color6 =255;
       
       break;
 
    case'o':
       color1 =255;
       color2 =255;
       color3 =100;
       color4 =255;
       color5 =100;
       color6 =255;
        
       break;
 
   case'w':
       color1 =255;
       color2 =100;
       color3 =255;
       color4 =255;
       color5 =255;
       color6 =255;
       
       break;
     }
   }else if(sec=='g'){
     switch(fir){
       
      case 'a':
       
       color1 =255;
       color2 =255;
       color3 =255;
       color4 =255;
       color5 =100;
       color6 =255;
       
       delay(500); 

       color1 =100;
       color2 =255;
       color3 =255;
       color4 =255;
       color5 =255;
       color6 =100;
      
       break;
  
      case 'i':
       color1 =255;
       color2 =255;
       color3 =255;
       color4 =255;
       color5 =100;
       color6 =255;
 
       delay(500); 

       color1 =100;
       color2 =100;
       color3 =255;
       color4 =255;
       color5 =255;
       color6 =100;
 
       break;
 
      case'u':
       color1 =255;
       color2 =255;
       color3 =255;
       color4 =255;
       color5 =100;
       color6 =255;
 
       delay(500); 
  
       color1 =100;
       color2 =255;
       color3 =255;
       color4 =100;
       color5 =255;
       color6 =100;
      
       break;
 

     case'e':
       color1 =255;
       color2 =255;
       color3 =255;
       color4 =255;
       color5 =100;
       color6 =255;

       delay(500); 

       color1 =100;
       color2 =100;
       color3 =255;
       color4 =100;
       color5 =255;
       color6 =100;
       break;
 
 
      case'o':
       color1 =255;
       color2 =255;
       color3 =255;
       color4 =255;
       color5 =100;
       color6 =255;
 
       delay(500); 

       color1 =255;
       color2 =100;
       color3 =255;
       color4 =100;
       color5 =255;
       color6 =100;
 
       break;     
     }
   }else if(sec=='z'){
     switch(fir){
       
       case 'a':
       
       color1 =255;
       color2 =255;
       color3 =255;
       color4 =255;
       color5 =100;
       color6 =255;
 
       delay(500); 
       
       color1 =100;
       color2 =255;
       color3 =255;
       color4 =255;
       color5 =100;
       color6 =100;
       
       break;
  
      case 'i':
       color1 =255;
       color2 =255;
       color3 =255;
       color4 =255;
       color5 =100;
       color6 =255;

       delay(500); 

      color1 =100;
      color2 =100;
      color3 =255;
      color4 =255;
      color5 =100;
      color6 =100;
 
      break;
 
     case'u':
      color1 =255;
      color2 =255;
      color3 =255;
      color4 =255;
      color5 =100;
      color6 =255;
      
      delay(500); 
      
      color1 =100;
      color2 =255;
      color3 =255;
      color4 =100;
      color5 =100;
      color6 =100;
      
      break;
 

    case'e':
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =255;
     color5 =100;
     color6 =255;

 
     delay(500); 
     color1 =100;
     color2 =100;
     color3 =255;
     color4 =100;
     color5 =100;
     color6 =100;
     
     break;
 
 
    case'o':
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =255;
     color5 =100;
     color6 =255;
    
     delay(500); 

     color1 =255;
     color2 =100;
     color3 =255;
     color4 =100;
     color5 =100;
     color6 =100;
    
     break;
    }
  }else if(sec=='d'){
    switch(fir){
      
    case 'a':
  
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =255;
     color5 =100;
     color6 =255;
 
     delay(500); 
     
     color1 =100;
     color2 =255;
     color3 =100;
     color4 =255;
     color5 =100;
     color6 =255;
     
     break;
  
    case 'i':
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =255;
     color5 =100;
     color6 =255;
     
     delay(500); 

     color1 =100;
     color2 =100;
     color3 =100;
     color4 =255;
     color5 =100;
     color6 =255;
 
     break;
 
    case'u':
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =255;
     color5 =100;
     color6 =255;
 
     delay(500); 
  
     color1 =100;
     color2 =255;
     color3 =100;
     color4 =100;
     color5 =100;
     color6 =255;

     break;
 

    case'e':
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =255;
     color5 =100;
     color6 =255;

 
     delay(500); 
     
     color1 =100;
     color2 =100;
     color3 =100;
     color4 =100;
     color5 =100;
     color6 =255;
 
     break;
 
 
    case'o':
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =255;
     color5 =100;
     color6 =255;
     delay(500); 

     color1 =255;
     color2 =100;
     color3 =100;
     color4 =100;
     color5 =100;
     color6 =255;
     break;
     
     }
 }else if(sec=='b'){
   switch(fir){
    case 'a':
 
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =255;
     color5 =100;
     color6 =255;
 
     delay(500); 

     color1 =100;
     color2 =255;
     color3 =100;
     color4 =255;
     color5 =255;
     color6 =100;

     break;
  
    case 'i':
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =255;
     color5 =100;
     color6 =255;
 
     delay(500); 

     color1 =100;
     color2 =100;
     color3 =100;
     color4 =255;
     color5 =255;
     color6 =100;
 
     break;
 
    case'u':
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =255;
     color5 =100;
     color6 =255;
 
     delay(500); 
  
     color1 =100;
     color2 =255;
     color3 =100;
     color4 =100;
     color5 =255;
     color6 =100;
 
     break;
 

    case'e':
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =255;
     color5 =100;
     color6 =255;

 
     delay(500); 
     color1 =100;
     color2 =100;
     color3 =100;
     color4 =100;
     color5 =255;
     color6 =100;

     break;
 
 
    case'o':
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =255;
     color5 =100;
     color6 =255;
     
     delay(500); 

     color1 =255;
     color2 =100;
     color3 =100;
     color4 =100;
     color5 =255;
     color6 =100;

     break;
     
   }
 }else if(sec=='p'){
   switch(fir){
     
     case 'a':
  

      color1 =255;
      color2 =255;
      color3 =255;
      color4 =255;
      color5 =255;
      color6 =100;
 
      delay(500); 

      color1 =100;
      color2 =255;
      color3 =100;
      color4 =255;
      color5 =255;
      color6 =100;

      break;
  
    case 'i':
      color1 =255;
      color2 =255;
      color3 =255;
      color4 =255;
      color5 =255;
      color6 =100;
 
      delay(500); 

      color1 =100;
      color2 =100;
      color3 =100;
      color4 =255;
      color5 =255;
      color6 =100;
 
      break;
 
     case'u':
      color1 =255;
      color2 =255;
      color3 =255;
      color4 =255;
      color5 =255;
      color6 =100;
 
      delay(500); 
  
     color1 =100;
     color2 =255;
     color3 =100;
     color4 =100;
     color5 =255;
     color6 =100;
     
     break;
 

    case'e':
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =255;
     color5 =255;
     color6 =100;

 
     delay(500); 
     color1 =100;
     color2 =100;
     color3 =100;
     color4 =100;
     color5 =255;
     color6 =100;
 
     break;
 
 
    case'o':
     color1 =255;
     color2 =255;
     color3 =255;
     color4 =255;
     color5 =255;
     color6 =100;
     
     delay(500); 
     
     color1 =255;
     color2 =100;
     color3 =100;
     color4 =100;
     color5 =255;
     color6 =100;
     break;
   }
 }
 }




void draw(){


  if (color1==100){
    
    arduino.digitalWrite(2, Arduino.HIGH);
 

    OscMessage myMessage = new OscMessage("/2");// /booはアドレス
    
    myMessage.add(1);
    oscP5.send(myMessage, myRemoteLocation);
  
  }else{
    

    arduino.digitalWrite(2, Arduino.LOW);

    OscMessage myMessage = new OscMessage("/2");// /booはアドレス
   
    myMessage.add(0);
    oscP5.send(myMessage, myRemoteLocation);

  }
  
  if (color2==100){

    arduino.digitalWrite(3, Arduino.HIGH);
 
    OscMessage myMessage = new OscMessage("/3");// /booはアドレス
   
    myMessage.add(1);
    oscP5.send(myMessage, myRemoteLocation);

  }else{

   arduino.digitalWrite(3, Arduino.LOW);
   
   OscMessage myMessage = new OscMessage("/3");// /booはアドレス
   
  myMessage.add(0);
  oscP5.send(myMessage, myRemoteLocation);

  }
  
  
  if (color3==100){
 
    arduino.digitalWrite(4, Arduino.HIGH);

    OscMessage myMessage = new OscMessage("/4");// /booはアドレス
   
    myMessage.add(1);
    oscP5.send(myMessage, myRemoteLocation);
  
  }else{
    arduino.digitalWrite(4, Arduino.LOW);
   
    OscMessage myMessage = new OscMessage("/4");// /booはアドレス
   
    myMessage.add(0);
    oscP5.send(myMessage, myRemoteLocation);
  }
  
  if (color4==100){
   arduino.digitalWrite(5, Arduino.HIGH);
 
   OscMessage myMessage = new OscMessage("/5");// /booはアドレス
   
   myMessage.add(1);
   oscP5.send(myMessage, myRemoteLocation);
  
  }else{
    arduino.digitalWrite(5, Arduino.LOW);
   
    OscMessage myMessage = new OscMessage("/5");// /booはアドレス
   
    myMessage.add(0);
    oscP5.send(myMessage, myRemoteLocation);
  }
  
  if (color5==100){
    arduino.digitalWrite(6, Arduino.HIGH);
 
    OscMessage myMessage = new OscMessage("/6");// /booはアドレス
   
    myMessage.add(1);
  
    oscP5.send(myMessage, myRemoteLocation);
   }else{
    arduino.digitalWrite(6, Arduino.LOW);
   
    OscMessage myMessage = new OscMessage("/6");// /booはアドレス
   
    myMessage.add(0);
    oscP5.send(myMessage, myRemoteLocation);
  }
  
  if (color6==100){
    arduino.digitalWrite(7, Arduino.HIGH);
 
    OscMessage myMessage = new OscMessage("/7");// /booはアドレス
   
    myMessage.add(1);
    oscP5.send(myMessage, myRemoteLocation);

   }else{
    arduino.digitalWrite(7, Arduino.LOW);
   
    OscMessage myMessage = new OscMessage("/7");// /booはアドレス
   
    myMessage.add(0);
    oscP5.send(myMessage, myRemoteLocation);

  }
  

  
  //1段目
  fill(color1);
  ellipse(200, 100, 60, 60);
  fill(color4);
  ellipse(300, 100, 60, 60);

  
  //2段目
  fill(color2);
  ellipse(200, 200, 60, 60);
  fill(color5);
  ellipse(300, 200, 60, 60);


  //3段目

   fill(color3);
  ellipse(200, 300, 60, 60);
  fill(color6);
  ellipse(300, 300, 60, 60);

  delay(500); 
}
 




