var Game ={};

Game.Level1 = function (juego) {

};

            var content2 = [
        " ",   
        "Tu misión: reintegrar la mayor",
        "cantidad posible de paramilitares",
        "que se encuentran en los montes",
        "de maría..., para hacerlo deberás",
        "saltar encima de ellos ..", 
        "deberas esperar a que termine",
        "la aparicion de imagenes...",
        "que se vera , al reintegrar",
        "a un paramilitar...",
        "y no podras saltar en mas",
        "de uno de ellos..",
        "de no hacer lo anterior",
        "empezaras de nuevo..",
        "éxitos!! … ",
        " ",
        ];


 			 // 1. Jugador
            var jugador; // Personaje principal
            var contadorSaltos = 0; // Contador de saltos, para lograr así el salto doble
            // 2. Plataformas
            var plataformas; // Lugares por los cuales el personaje se desplaza o camina
            // 3. Teclado
            var cursores; // Eventos de teclado
            // 4. arbol
            var arboles; // Imagenes que pueden permitirnos subir
            var colisionarbol = false; // Booleano para detectar que exista colisión con arbol
            var contadorarboles = 0;
            // 5. Puntaje
            var puntaje = 0; // Contador de puntos
            var puntajeTexto; // Texto que muestra el puntaje acumulado
            // 6. Potenciales enemigos
            var enemigos; // Potenciales enemigos
            var arrenemigos = []; // Arreglo de enemigos
            
            var text;
            var index2 = 0;
            var line2 = '';

            var musicaFondo;

            var imagenFondo;

            var fin;

            var emitter;
        





Game.Level1.prototype={

    updateline2 :function () {

  if (line2.length < content2[index2].length)
    {
        line2 = content2[index2].substr(0, line2.length + 1);
         text.text = line2;
         //text.setText(line2);
    }
    else
    {
      //siguiente line2a ---> espera de dos segundos
      this.time.events.add(Phaser.Timer.SECOND * 1, this.nextline2, this);
      
    }



},

nextline2:function() {

    index2++;


   if (index2 < content2.length)
    {
        line2 = '';
        this.time.events.repeat(80, content2[index2].length + 1, this.updateline2, this);
       
    }

 },

  preload:function(){
   this.load.image('fondo', '../../img/game/paisaje.gif');
   this.load.spritesheet('enemigo', '../../img/game/soldado.png',39,56);
   this.load.image('suelo', '../../img/game/tierra.png');
   this.load.image('arbol', '../../img/game/arbol.png');
   this.load.image('fin', '../../img/game/fin.png');
   this.load.spritesheet('personaje', '../../img/game/personaje.png', 42, 63);

   ///audios
   this.load.audio('magic', ['https://raw.githubusercontent.com/xiomarapulido/Colombia-Feels/gamemodulomontesmaria/audio/game/magic.mp3']);
   this.load.audio('musicaFondo', ['https://raw.githubusercontent.com/xiomarapulido/Colombia-Feels/gamemodulomontesmaria/audio/game/Composure.ogg']);

   //
    this.load.image('img1', '../../img/game/1.jpg');
    this.load.image('img2', '../../img/game/2.jpg');
    this.load.image('img3', '../../img/game/3.jpg');
    this.load.image('img4', '../../img/game/4.jpg');
    this.load.image('img5', '../../img/game/5.jpg');
    this.load.image('img6', '../../img/game/6.jpg');
    this.load.image('img7', '../../img/game/7.jpg');
    this.load.image('img8', '../../img/game/8.jpg');
    this.load.image('img9', '../../img/game/9.jpg');

  },

  create:function(){

                audio1.stop();
                
                this.add.audio('magic');

                musicaFondo=this.add.audio('musicaFondo');

                musicaFondo.loopFull(0.6);

        
    			     //  Física arcade
                this.physics.startSystem(Phaser.Physics.ARCADE);

                //imagen de fondo
                imagenFondo=this.add.sprite(0, 0, 'fondo');
                //imagenFondo.anchor.setTo(0.5, 0.5);
                imagenFondo.scale.setTo(1, 1);

                // Establecemos los límites del juego completo
                this.world.setBounds(0, 0, 1500, 1000);

                //  Grupo de plataformas
                plataformas = this.add.group();

                //  Física disponible para objetos que colisionen con ellas
                plataformas.enableBody = true;

                // Suelo
                var piso1 = plataformas.create(1, 300, 'suelo');


                piso1.scale.setTo(1,1);

                //  Objeto inmóvil, no se desplaza al caer un objeto sobre él
                piso1.body.immovable = true;


                // Otro piso
                var piso2 = plataformas.create(700, 500, 'suelo');

                //  También lo podemos econtadorEscalerasr
                piso2.scale.setTo(4, 1);

                //  Objeto móvil, sí se desplaza al caer un objeto sobre él
                piso2.body.immovable = true;



                var piso3 = plataformas.create(50, 620, 'suelo');

                //  También lo podemos econtadorEscalerasr
                piso3.scale.setTo(1, 1);

                //  Objeto móvil, sí se desplaza al caer un objeto sobre él
                piso3.body.immovable = true;



                var piso4 = plataformas.create(1, 900, 'suelo');

                //  También lo podemos econtadorEscalerasr
                piso4.scale.setTo(6, 1);

                //  Objeto móvil, sí se desplaza al caer un objeto sobre él
                piso4.body.immovable = true;


                
                //fin partida
                fin = this.add.sprite(1120, 600, 'fin');


                fin.scale.setTo(1,1);

               

                // arboles
                arboles = this.add.group();

                arboles.enableBody = true;


               var arbol = arboles.create(100,160, 'arbol');


              //  parámetros del jugador,  posición inicial
                jugador = this.add.sprite(50, 30, 'personaje');

                // permitir física al jugador
                this.physics.arcade.enable(jugador);

                this.physics.arcade.enable(fin);

                //this.physics.arcade.enable(emitter);

                // aceleración de gravedad
                jugador.body.gravity.y = 500;
                // permitir que el jugador colisione con los límites del juego
                jugador.body.collideWorldBounds = true;

                // se crea la película de animaciones para el personaje
                jugador.animations.add('left', [4, 5,6,7], 10, true);
                jugador.animations.add('right', [8,9,10, 11], 10, true);
                jugador.animations.add('jump', [0], 10, true);
                jugador.animations.add('climb', [12,13,14,15], 10, true);


                enemigos = this.add.group();
                enemigos.enableBody = true;

                this.time.events.add(3000, this.creacionEnemigos, this); 

        
                // Creacion de teclado
                cursores = this.input.keyboard.createCursorKeys();
                // Creamos un callback o una función que se dispara al soltar la tecla "UP"
                this.input.keyboard.onUpCallback = function (e) {
                    if (e.keyCode == Phaser.Keyboard.UP) {
                        contadorSaltos++;
                    }
                };

                //  Sprite para contener el texto de puntaje  fijo en relación a la cámara. (se morevera con camara)
                var sprite = this.add.sprite(0, 0);
                // fijo ante la cámara
                sprite.fixedToCamera = true;

                // creacion de texto  como hijo del objeto sprite con addChild
                puntajeTexto = this.add.text(16, 16, 'reintegrados: 0', {fontSize: '20px', fill: 'white'});
                sprite.addChild(puntajeTexto);

                // ubicacion del sprite contenedor de la cámara en las coordenadas 10, 10
                sprite.cameraOffset.x = 10;
                sprite.cameraOffset.y = 10;

                // permitir  a la cámara del juego, seguir en todo momento al jugador
                this.camera.follow(jugador);



                text = this.add.text(32, 400, '', { font: "30pt Courier", fill: "#FFFFFF", stroke: "#FFFFFF", strokeThickness: 2 });

                this.nextline2();

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
                
          	  // reinicio de variables
                colisionarbol = false;
                contadorarboles = 0;

                //  reiniciar velocidad del jugador para evitar que se acelere.
                jugador.body.velocity.x = 0;
                //  colisionar  jugador con las plataformas
                this.physics.arcade.collide(jugador, plataformas);
                // Lo mismo hacemos con las enemigos
                this.physics.arcade.collide(enemigos, plataformas);
                //  evaluacion de colisión con las arboles
                this.physics.arcade.overlap(jugador, arboles,this.collectarboles, null, this);
                // console.log('colisionarbol = ' + colisionarbol);

                // Si no hay colisión con los arboles, entonces reestablecemos la gravedad
                if (!colisionarbol) {
                    jugador.body.gravity.y = 500;
                } else {// Si hay colisión con las arboles, entonces la gravedad se lleva a cero, por lo tanto, el jugador no caerá, dando la sensación de estar suspendido en uno de sus escalones
                    jugador.body.velocity.y = 0;
                }

                if (cursores.left.isDown)// Si se presiona LEFT
                {
                    //  mover jugador a la izquierda
                    jugador.body.velocity.x = -150;

                    jugador.animations.play('left');
                }
                else if (cursores.right.isDown)// Si se presiona RIGHT
                {
                   // mover jugador a la derecha
                    jugador.body.velocity.x = 150;

                    jugador.animations.play('right');
                } else if (contadorarboles != 0) {// Si el contador de arboles es <> de cero, se esta escalando
                    jugador.animations.play('climb');// animacion escalar del jugador
                }
                else
                {
                    //  si las teclas no son presionadas
                    jugador.animations.stop();
                    jugador.frame = 0;
                }
              

                // Si se presiona el botón UP y se esta colisionando con alguna plataforma o si el contador de saltos es igual a 1 , y no hay colisión con los arboles
                if (cursores.up.isDown && (jugador.body.touching.down || contadorSaltos == 1) && !colisionarbol)
                {
                    jugador.body.velocity.y = -250;
                    jugador.animations.play('jump');
                    if (contadorSaltos == 1) {
                        contadorSaltos = 2;
                    }
                }

                // Si el jugador toca una plataforma el contador de saltos se setea en cero otra vez
                if (jugador.body.touching.down) {
                    contadorSaltos = 0;
                }

                if (contadorarboles < -1) {
                    contadorarboles = -1;
                }
                jugador.position.y += (contadorarboles*2);
                if (contadorarboles != 0) {
                    jugador.animations.play('climb');
                }

              
                this.physics.arcade.overlap(jugador, enemigos,this.collectenemigo, null, this);

                this.physics.arcade.overlap(jugador, fin,this.finpartida, null, this);


  },
         
            // Funciones complementarias

                iniEmitter :function () { 
                    emitter = this.add.emitter(this.world.centerX, 200, 5);

                    emitter.makeParticles(['img1', 'img2', 'img3','img4','img5','img6','img7','img8','img9']);
                   
                 
                    emitter.start(false, 5000, 20);

                    this.time.events.add(5000, this.destroyEmitter, this); 


                 }, 

                destroyEmitter :function () { 
                                     
                     try {
                         emitter.destroy();
                    }
                    catch(err) {
                     musicaFondo.stop();  
                     this.state.start('Level1');
                    //alert(err);
                    }
                  

                 }, 
              finpartida :function(jugador,fin){
                if(jugador.collide==fin.collide){
                  //alert('fin partida');
                    musicaFondo.stop();
                    this.state.start('Level1');
          
                }

              },

             collectenemigo :function(jugador, enemigo) {
                
                // Si los pies del jugador tocan la parte superior de la enemigo
                if ((jugador.position.y + jugador.height) <= enemigo.position.y) {
                //emitter = this.add.emitter(this.world.centerX, 200, 5);
               // emitter.makeParticles(['img1', 'img2', 'img3','img4','img5','img6','img7','img8','img9']);
                    this.time.events.add(5000, this.iniEmitter, this); 

                    //reproduccion de efecto de sonido
                    this.sound.play('magic');
                    ///desaparecer enemigo pasados 3 segundos
                    enemigo.lifespan = 3000;
                    //mostrar frame 0 del enemigo ---> reintegrado
                    enemigo.frame=0;
                    //parar animaciones
                    enemigo.animations.stop();
                    //quitar movimiento
                    enemigo.body.velocity.x=0;

                   // arrenemigos[0].enemigo.body.bounce.y = 0;
                    //  actualizacion e incrementacion de el puntaje
                    puntaje += 1;
                    puntajeTexto.text = 'reintegrados: ' + puntaje;
                    jugador.body.velocity.y = -250;
                    contadorSaltos = 0;
                }

            },
            creacionEnemigos :function(){

                 this.time.events.add(5000, this.creacionEnemigos, this); 
            
                //  Creacion de  enemigos
                for (var i = 0; i < 5; i++)
                {
                    //  se crea enemigo dentro del grupo enemigos
                   //var enemigo = enemigos.create(300+i * 70, 0, 'enemigo');
                    var enemigo=this.add.sprite(500 + Math.random() * 800,0,'enemigo');
                    enemigos.add(enemigo);

                    //pelicula de animaciones para los enemigos
                    enemigo.animations.add('caminar', [8,9,10, 11], 10, true);
                    enemigo.animations.play('caminar');

                    //  gravedad del enemigo
                    enemigo.body.gravity.y = 300;
                    // movimiento de los enemigos
                    enemigo.body.velocity.x = 70;

                    // se crea objeto JSON
                    var estrella = {
                        "enemigo": enemigo,
                        "gravity_y": 300
                    };
                    //agregar objetos a arreglo
                    arrenemigos.push(estrella);

                }
            },

             collectarboles :function(jugador, arbol) {
                //
                if ((jugador.position.y + jugador.height) > arbol.position.y) {
                    colisionarbol = true;
                    jugador.body.gravity.y = 0;
                    if (cursores.up.isDown && (jugador.position.y + jugador.height) >= (arbol.position.y))
                    {
                        contadorarboles--;
                    }
                    if (cursores.up.isDown && (jugador.position.y + jugador.height) >= (arbol.position.y)&&(jugador.position.y + jugador.height) <= (arbol.position.y+5))
                    {
                        colisionarbol = false;
                    }
                    if (cursores.down.isDown && (jugador.position.y + jugador.height) <= (arbol.position.y + arbol.height))
                    {
                        contadorarboles++;
                    }
                }
            }

};
