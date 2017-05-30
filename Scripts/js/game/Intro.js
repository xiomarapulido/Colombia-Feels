
Game.Intro = function (juego) { 

};

var content = [
    " ",
    "Colombia feels presenta : ",
    " “Los montes de maría“ ",
    " ",
    "Tierra de luchas y contrastes",
    " ",
    "ubicada entre Bolívar y Sucre.",
    " ",
    "Una tierra a la que los ",
    "campesinos estuvieron arraigados ,",
    "una tierra de abundancia ",
    "y donde se desataron muchos ",
    "conflictos...",
    " ",
];

var text;
var index = 0;
var line = '';
var cursores; 
var fondo;
var fondo2;
var timer;
var current = 3;


Game.Intro.prototype={

  preload : function(){
  
   this.load.image('imagen1', '../../img/game/montes.jpg');

   this.load.image('imagen2', '../../img/game/montes1.jpg');

   this.load.image('imagen3', '../../img/game/montes2.jpg');

   this.load.image('imagen4', '../../img/game/montes3.jpg');
   
  },
  
  create : function(){

  	  fondo=this.add.sprite(this.world.centerX, this.world.centerY,'imagen1');
  	  fondo.anchor.setTo(0.5, 0.5);
      fondo.scale.setTo(2, 2);

  	  fondo2=this.add.sprite(this.world.centerX, this.world.centerY,'imagen2');
      fondo2.anchor.setTo(0.5, 0.5);
      fondo2.scale.setTo(2, 2);

  	  fondo2.alpha = 0;

 
	  timer = this.time.create(false);
	  timer.add(3000, this.fadePictures, this);
	  timer.start();


  	  cursores = this.input.keyboard.createCursorKeys();

  	  text = this.add.text(32, 380, '', { font: "30pt Courier", fill: "#000000", stroke: "#ffffff", strokeThickness: 2 });

   	  this.nextLine();
 
  },
  fadePictures :function () {

    var tween;

    if (fondo.alpha === 1)
    {
        tween = this.add.tween(fondo).to( { alpha: 0 }, 2000, Phaser.Easing.Linear.None, true);
        this.add.tween(fondo2).to( { alpha: 1 }, 2000, Phaser.Easing.Linear.None, true);
    }
    else
    {
        this.add.tween(fondo).to( { alpha: 1 }, 2000, Phaser.Easing.Linear.None, true);
        tween = this.add.tween(fondo2).to( { alpha: 0 }, 2000, Phaser.Easing.Linear.None, true);
    }
    tween.onComplete.add(this.changePicture, this);

},

 changePicture :function() {

    if (fondo.alpha === 0)
    {
        fondo.loadTexture('imagen' + current);
    }
    else
    {
        fondo2.loadTexture('imagen' + current);
    }

    current++;

    if (current > 4)
    {
        current = 1;
    }
    timer.add(3000, this.fadePictures, this);

},

  updateLine :function () {

  if (line.length < content[index].length)
    {
        line = content[index].substr(0, line.length + 1);
         //text.text = line;
         text.setText(line);
    }
    else
    {
      //siguiente linea ---> espera de dos segundos
      this.time.events.add(Phaser.Timer.SECOND * 1, this.nextLine, this);
      
    }



},

nextLine:function() {
    index++;


   if (index < content.length)
    {
        line = '';
        this.time.events.repeat(80, content[index].length + 1, this.updateLine, this);
       
    }

 },

  update:function(){

 
		 if(index==content.length){

		  this.state.start('Level1');

		 }   



  }


};