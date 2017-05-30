
Game.MainMenu = function (juego) { 

};

var fondoMenu;
var tituloMenu;
var audio1;
var cursores;

Game.MainMenu.prototype={

  preload : function(){


   this.load.image('fondo','../../img/game/fondo.jpg');
   this.load.image('boton','../../img/game/boton-start.png');

   this.load.image('texto','../../img/game/texto-intro.png');

   this.load.audio('intro', ['https://raw.githubusercontent.com/xiomarapulido/Colombia-Feels/gamemodulomontesmaria/audio/game/dream%20.ogg']);

  },


  create:function(){
     audio1=this.add.audio('intro');
     audio1.play();

     fondoMenu=this.add.tileSprite(0,0,840,500,'fondo');

   this.createButton(this,"",this.world.centerX,this.world.centerY+32,500,300,
  	 function(){
      
       //alert('empezar juego');
      this.state.start('Intro');

    
  	 });

   tituloMenu=this.add.sprite(this.world.centerX,this.world.centerY-50,'texto');
   tituloMenu.anchor.setTo(0.5,0.5);

   this.scale.fullScreenScaleMode = Phaser.ScaleManager.EXACT_FIT;
   cursores = this.input.keyboard.createCursorKeys();
   
   this.input.onDown.add(this.gofull, this);
  },

gofull :function () {

    if (this.scale.isFullScreen)
    {
       // this.scale.stopFullScreen();
    }
    else
    {
        this.scale.startFullScreen(false);
    }

},

  update:function(){


  	fondoMenu.tilePosition.x-=1;

  },

  createButton:function(juego,string,x,y,w,h,callback){
  	var button1=this.add.button(x,y,'boton',callback,this,2,1,0);
     
    button1.anchor.setTo(0.5,0.5);
    button1.width=w;
    button1.height=h;


  }



};	