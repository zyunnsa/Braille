  //This code has been arranged by Yasushi Noguchi. Last updated on July 1, 2009.
//oscP5plug by andreas schlegel
 
//open sound controlのライブラリを追加する（必須）
import oscP5.*;
import netP5.*;
 
 OscP5 oscP5;    
 NetAddress myRemoteLocation;    
 
 int i=0;
 int k ;
 int k1;
 int k2;
  
 int w = 400;
 int h = 400;
 int bg = 0;
 
 String fontname = "SanSerif";
 
 int fontsize = 16;
 int x = 0;
 int y = fontsize;
   
   void setup()
   {
     size(w, h);
     textFont(createFont(fontname, fontsize));
     background(bg);
     
     //受信用の変数。右の数字はポート番号。送信側のポート番号とあわせる。
     oscP5 = new OscP5(this,10000);
 
    //送信用オブジェクト。左側の数字が相手のIPアドレス、右側が相手のポート番号。
     myRemoteLocation = new NetAddress("127.0.0.1", 12000);
 

   }
   
   void draw()
   {
       
   }
   

   

  
   void keyTyped() {
     
        
   
      if(keyPressed==true && i==0){


         k=key;

         i++;
         keyPressed=false;

     }else if(keyPressed==true && i==1){

       k1 =key; 
       i++;
       
       keyPressed=false;
     
     }else if(keyPressed==true && i==2){

     k2 =key; 
     i=0;
     keyPressed=false;
  
      }
   
    
    

      OscMessage myMessage = new OscMessage("/pattern");
      myMessage.add(k);//add message
      myMessage.add(k1);//add message
      myMessage.add(k2);//add message
      oscP5.send(myMessage, myRemoteLocation); 



  
   if(key == ' '){
       delay(600);
       background(bg);        
       x=0;
       y = fontsize;

    }else{
      text(key, x+20, y+20);
      x += fontsize;
       
    if (x > w - fontsize-40) {
      x = 0;
      y += fontsize;
     }

    if (y > h - fontsize-40) {
      y = fontsize;
      background(bg);
     }
  }
  
}
