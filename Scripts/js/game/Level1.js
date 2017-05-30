var Game ={};

Game.Level1 = function (juego) {

};


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

            var enemigo;
            var total=0;


Game.Level1.prototype={

  preload:function(){
   this.load.image('fondo', '../../img/game/paisaje.gif');
   this.load.spritesheet('enemigo', '../../img/game/soldado.png',39,56);
   this.load.image('suelo', '../../img/game/tierra.png');
   this.load.image('arbol', '../../img/game/arbol.png');
   this.load.spritesheet('personaje', '../../img/game/personaje.png', 42, 63);

  },

  create:function(){

   //this.stage.backgroundColor='#7BF728';

    			     //  Física arcade
                this.physics.startSystem(Phaser.Physics.ARCADE);

                //imagen de fondo
                this.add.sprite(0, 0, 'fondo');

                // Establecemos los límites del this completo
                this.world.setBounds(0, 0, 2000, 384);

                //  Grupo de plataformas
                plataformas = this.add.group();

                //  Física disponible para objetos que colisionen con ellas
                plataformas.enableBody = true;

                // Suelo
                var piso = plataformas.create(50, this.world.height - 100, 'suelo');


                piso.scale.setTo(1,1);

                //  Objeto inmóvil, no se desplaza al caer un objeto sobre él
                piso.body.immovable = true;

                // Otro piso
                var piso = plataformas.create(850, this.world.height - 200, 'suelo');


                piso.scale.setTo(1, 1);

                //  Objeto móvil, sí se desplaza al caer un objeto sobre él
                piso.body.immovable = true;

                // arboles
                arboles = this.add.group();

                arboles.enableBody = true;


              var arbol = arboles.create(100,140, 'arbol');


              //  parámetros del jugador,  posición inicial
                jugador = this.add.sprite(32, this.world.height - 350, 'personaje');

                // permitir física al jugador
                this.physics.arcade.enable(jugador);

                // aceleración de gravedad
                jugador.body.gravity.y = 500;
                // permitir que el jugador colisione con los límites del this
                jugador.body.collideWorldBounds = false;

                // se crea la película de animaciones para el personaje
                jugador.animations.add('left', [4, 5,6,7], 10, true);
                jugador.animations.add('right', [8,9,10, 11], 10, true);
                jugador.animations.add('jump', [0], 10, true);
                jugador.animations.add('climb', [12,13,14,15], 10, true);


                enemigos = this.add.group();
                enemigos.enableBody = true;

                 //  Creacion de  enemigos
                for (var i = 0; i < 4; i++)
                {
                    //  se crea enemigo dentro del grupo enemigos

                   //var enemigo = enemigos.create(300+i * 70, 0, 'enemigo');
                    var enemigo=this.add.sprite(300 + Math.random() * 320,0,'enemigo');
                    enemigos.add(enemigo);

                    //pelicula de animaciones para los enemigos
                    enemigo.animations.add('caminar', [8,9,10, 11], 10, true);
                    enemigo.animations.play('caminar');

                    //  gravedad del enemigo
                    enemigo.body.gravity.y = 300;
                    // movimiento de los enemigos
                    enemigo.body.velocity.x = 50;

                    // se crea objeto JSON
                    var estrella = {
                        "enemigo": enemigo,
                        "gravity_y": 300
                    };
                    //agregar objetos a arreglo
                    arrenemigos.push(estrella);

                }



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
                puntajeTexto = this.add.text(16, 16, 'puntaje: 0', {fontSize: '32px', fill: 'white'});
                sprite.addChild(puntajeTexto);

                // ubicacion del sprite contenedor de la cámara en las coordenadas 10, 10
                sprite.cameraOffset.x = 10;
                sprite.cameraOffset.y = 10;

                // permitir  a la cámara del juego, seguir en todo momento al jugador
                this.camera.follow(jugador);




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




  },

   // Funciones complementarias

             collectenemigo :function(jugador, enemigo) {

                // Si los pies del jugador tocan la parte superior de la enemigo
                if ((jugador.position.y + jugador.height) <= enemigo.position.y) {
                    // se elimina el enemigo de la pantalla
                   // enemigo.kill();
                    ///desaparecer enemigo pasados 3 segundos
                    enemigo.lifespan = 3000;
                    //mostrar frame 0 del enemigo ---> reintegrado
                    enemigo.frame=0;
                    //parar animaciones
                    enemigo.animations.stop();
                    //quitar movimiento
                    enemigo.body.velocity.x=0;

                    arrenemigos[0].enemigo.body.bounce.y = 0;

                    //  actualizacion e incrementacion de el puntaje
                    puntaje += 1;
                    puntajeTexto.text = 'puntaje: ' + puntaje;
                    jugador.body.velocity.y = -250;
                    contadorSaltos = 0;
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
