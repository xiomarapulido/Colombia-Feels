
Game.MainMenu = function (juego) { 

};

var fondoMenu;
var tituloMenu;

Game.MainMenu.prototype={

  preload : function(){
    //cargar todos los recursos
    //juego.stage.backgroundColor="#000";
   this.load.image('fondo','../../img/game/fondo.jpg');
   this.load.image('boton','../../img/game/boton-start.png');

   this.load.image('texto','../../img/game/texto-intro.png');

  },


  create:function(juego){
  
   //this.stage.backgroundColor='#7BF728';
   fondoMenu=this.add.tileSprite(0,0,800,550,'fondo');

   this.createButton(juego,"",juego.world.centerX,juego.world.centerY+32,500,300,
  	 function(){
      
       //alert('empezar juego');
      this.state.start('Level1');
    
  	 });

   tituloMenu=juego.add.sprite(juego.world.centerX,juego.world.centerY-50,'texto');
   tituloMenu.anchor.setTo(0.5,0.5);
  },

  update:function(){

  	fondoMenu.tilePosition.x-=1;

  },

  createButton:function(juego,string,x,y,w,h,callback){
  	var button1=juego.add.button(x,y,'boton',callback,this,2,1,0);
     
    button1.anchor.setTo(0.5,0.5);
    button1.width=w;
    button1.height=h;


  }



};	