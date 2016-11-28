package edu.uoc.bookSearchApp
{	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Main extends Sprite
	{
		// Todas las instancias ya presentes en la timeline
		// deben declararse como públicas
		public var screenContainer_sp:Sprite;
		public var bgApp_sp:Sprite;
		
		// Nota: en la timeline existe también el texto "Aplicación Demo Pantallas"
		// pero dado que no lo manipularemos no nos hace falta declararlo.
		// Dicho esto sí es importante ver la disposición en relación a screenContainer 
		// y así comprender porqué aparecerá siempre por encima de la pantalla.
		
		// Variables privadas 
		// _screenReference es la instancia actualmente visible
		private var _screenReference:Sprite;
		// _actualScreen es un id que nos permitirá saber que pantalla es visible actualmente 
		private var _actualScreen:int;
		
		// Declaración de variables
		// Por convención empezaremos con "_" (underscore)
		// los nombres de variables privadas
		private var _books:Array;
		
		public function Main()
		{
			super();
			
			// Nos aseguramos que la clase del documento 
			// ha sido intanciada (creación de root)
			// y añadida a stage
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init( ev:Event ):void {
			
			// Variable que podéis utilizar para esta primera parte de la Práctica Final para enviar como parámetro:
			// - a la pantalla "Resultados búsqueda" (la variable _books)
			// - a la pantalla "Detalle libro" (por ejemplo el libro _books[0]) 
			// Nota para la segunda parte de la Práctica final: 
			// Una vez hecha una petición de búsqueda y recibida la respuesta del servidor,
			// deberíamos recuperar solo la información que nos interesa para crear una Array de objetos
			// con la información indispensable de cada libro.
			_books = [ 
						{
							title:"Libro1", 
							author:"Autor1", 
							publisher:"Editorial1", 
							numPages:"34", 
							rating:"3.4", 
							freeAvailability:"true", 
							coverUrl:"portada1.jpg", 
							description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce in suscipit justo. Quisque in ex molestie ex finibus commodo quis at ante. In aliquam in urna vitae elementum."
						},
						{
							title:"Libro2", 
							author:"Autor2", 
							publisher:"Editorial2", 
							numPages:"56", 
							rating:"2", 
							freeAvailability:"false", 
							coverUrl:"portada2.jpg", 
							description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce in suscipit justo. Quisque in ex molestie ex finibus commodo quis at ante. In aliquam in urna vitae elementum."
						},
						{
							title:"Libro3", 
							author:"Autor3", 
							publisher:"Editorial3", 
							numPages:"67", 
							rating:"4", 
							freeAvailability:"false", 
							coverUrl:"portada3.jpg", 
							description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce in suscipit justo. Quisque in ex molestie ex finibus commodo quis at ante. In aliquam in urna vitae elementum."
						},
						{
							title:"Libro4", 
							author:"Autor4", 
							publisher:"Editorial4", 
							numPages:"23", 
							rating:"2.3", 
							freeAvailability:"true", 
							coverUrl:"portada4.jpg", 
							description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce in suscipit justo. Quisque in ex molestie ex finibus commodo quis at ante. In aliquam in urna vitae elementum."
						}
					 ];
			
			//////////////////////
			
			trace ("App init");
			// Ya no necesitamos este eventListener
			// Nota: recordad que siempre es bueno optimizar una aplicación
			// eliminando los escuchadores que ya no utilizamos.
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// Inicializamos la navegación
			// (para que cada botón de navegación haga el cambio de pantalla apropiado)
			initNavigation();
			
			// Inicializamos la variable privada _actualScreen
			// 0-->pantallaA
			// 1-->pantallaB
			// 2-->pantallaC
			_actualScreen = 0;
			
			// Actualizamos la pantalla que tiene que aparecer,
			// pantalla indicada por _actualScreen
			refreshScreen();
			
			
		}
		private function initNavigation():void
		{
			
			// Aprovechando el event flow podemos escuchar desde screenContainer_sp
			// los MouseEvent.CLICK que se realicen dentro de las instancias que integran su displayList.
			// El método changeScreen comprobará si ha clicado un botón de navegación entre pantallas y
			// si es así realizará el cambio de pantalla.
			this.screenContainer_sp.addEventListener(MouseEvent.CLICK, changeScreen);
			
		}
		
		private function changeScreen(ev:MouseEvent = null):void
		{
			var newScreen:int;
			var buttonClicked:String;
			
			// Para saber que botón se ha presionado aprovecharemos el propio  nombre de la instancia del botón.
			buttonClicked = ev.target.name;
			trace("Hemos clicado sobre: "+buttonClicked);
			
			// Recuperando ev.target.name podemos saber si se trata de alguno de los botones de navegación
			switch(buttonClicked)
			{
				//PANTALLA screenMenU
				case 'btSearch_sp': newScreen = 1; break;
					//Afegim el de favorits pero no farà res - Cómo prueba va a pantalla screenMenu
					//case 'btMyFavorites_sp': newScreen = 0;break;
				
				//PANTALLA screenSearch
				case 'bt_back': newScreen = 0;break;
				case 'bt_searchBook': newScreen = 2;break;
				
				//PANTALLA screenSearchResult
				
				case 'bt_backScreenSearchResult': newScreen=1;break;
				case 'bookItemArrow_sp': newScreen=3; break;
				
				//PANTALLA screenBookDetail
				case 'bt_back_BookDetail': newScreen=2;break;
				
				case 'ScreenSearch': newScreen = 1; break;
				case 'ScreenSearchResult': newScreen = 2; break;
				case 'ScreenBookDetail': newScreen = 3; break;
				// En caso de ser un botón interno a la pantalla, un botón que no realiza un cambio de pantalla, 
				// nos mantendremos en la pantalla actual
				default: newScreen = _actualScreen; break; 
			}
			
			// Solo nos interesa cambiar de pantalla si el botón clicado indica otra pantalla que la actual.
			if (newScreen != _actualScreen)
			{
				// Actualizamos el id de la pantalla visible
				_actualScreen = newScreen;
				// Hacemos el cambio de pantalla
				refreshScreen();
			}
		}
		
		private function refreshScreen():void
		{
			// _screenReference es la referencia a la pantalla actualment visible
			// La primera vez que ejecutemos la aplicación no tenemos aún ninguna pantalla visible.
			// Luego _screenReference será igual a null, no se refiere aún a ninguna de las pantallas.
			// Pero más adelante sí. A cada cambio de pantalla habrá entonces que quitar esta pantalla 
			// de la displayList de screenContainer_sp antes de poner la nueva.
			if (_screenReference != null) { screenContainer_sp.removeChild(_screenReference); }
			
			// Asignamos la nueva pantalla a _screenReference
			switch (_actualScreen)
			{
				case 0: _screenReference = new ScreenMenu('ScreenMenu'); break;
				case 1: _screenReference = new ScreenSearch('Pantalla B'); break;
				case 2: _screenReference = new ScreenSearchResult('Pantalla C'); break;
				case 3: _screenReference = new ScreenBookDetail('Pantalla C'); break;
			}
			
			// y la añadirmos a la displayList de screenContainer_sp
			screenContainer_sp.addChild(_screenReference);
			
			// Para comprobar que en screenContainer_sp tenemos siempre una sola pantalla
			// haremos un simple trace.
			trace("Número de hijos dentro de screenContainer_sp: "+ screenContainer_sp.numChildren );
			
		}
	}
}