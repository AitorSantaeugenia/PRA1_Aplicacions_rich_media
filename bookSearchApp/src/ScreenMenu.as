package
{
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.text.TextField;
	
	public class ScreenMenu extends MovieClip
	{
	//LLISTAT ELEMENTS DE LA SCREEN
		// Declaramos como públicos los elementos presentes en la timeline:
		// El título de nuestra pantalla
		public var title_tf:TextField = new TextField();
		private var title_tf_text:String = "Aitor J Santaeugenia Marí"; 
		
		// Sus botones de navegación
		//public var optionB_sp:Sprite;
		//public var optionC_sp:Sprite;
		
		//ScreenMenu variables a emprar
			//Logo
			public var logoGbooks_sp:MovieClip;
			//Botons
			public var btSearch_sp:SimpleButton;
			public var btMyFavorites_sp:SimpleButton;
			public var bgScreen_sp:MovieClip;
	//FI LLISTAT ELEMENTS SCREEN
		
		public function ScreenMenu(title:String)
		{
			//title_tf.text = 'Aitor Javier Santaeugenia Marí';
			super();
			// Nos aseguramos que la clase del documento ha sido instanciada
			// y añadida a stage
			addEventListener(Event.ADDED_TO_STAGE, init);	
			
			// También es importante hacer limpieza al retirar la instancia de la displayList.
			// Para por ejemplo limpiar los escuchadores que ya no se utilizarán
			addEventListener(Event.REMOVED_FROM_STAGE, dispose);

			//LISTENER PER EL REFRESC DE PANTALLA
			addEventListener(Event.ADDED_TO_STAGE, refreshScreen);
			
		}
		
		private function init(ev:Event):void {
			
			// Hacemos antes un poco de limpieza
			// y eliminamos el escuchador que ya no utilizamos
			removeEventListener(Event.ADDED_TO_STAGE,init);
			
			// Siempre es aconsejable gestionar nosotros mismos el escalado de nuestra aplicación.
			// Por ello situaremos siempre nuestra aplicación en la esquina superior izquierda
			stage.align = StageAlign.TOP_LEFT;
			// y inhabilitaremos el escalado automático
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			// Añadimos el escuchador de eventos para detectar cualquier cambio del as medidas de la pantalla
			// Nota: Esto incluye los cambio de orientación. 
			stage.addEventListener(Event.RESIZE, refreshScreen);
			
		}
		
		private function dispose(ev:Event):void {
			
			// Eliminamos los escuchadores que ya no utilizamos
			// Empezando por el propio que ha ejecutado dispose()
			removeEventListener(Event.REMOVED_FROM_STAGE,dispose);
			// y el que escucha los cambios de dimensiones de la pantalla
			// Nota: recordad que hay que indicar correctamente quién lo está escuchando 
			// para eliminarlo correctamente
			stage.removeEventListener(Event.RESIZE, refreshScreen);
			
		}
		
		private function refreshScreen(ev:Event= null):void {
			
			// Reposicionamos los elementos a las nuevas medidas de la pantalla 
			trace ("Refresh de la pantalla screenMenu");
			
			// Para más comodidad recuperamos las nuevas medidas de nuestra aplicación
			var stageW:int = stage.stageWidth;
			var stageH:int = stage.stageHeight;
			// También puede ser interesante el uso de una variable 
			// para obtener espaciados iguales entre ciertos elementos
			var gutter:int = 30;
			
			// Adaptamos el fondo al espacio disponible
			bgScreen_sp.width = stageW;
			bgScreen_sp.height = stageH;
			
			// Situamos el título de la pantalla
			// Nota: fijaros que el campo del título es un texto justificado,
			// luego bastará que ocupe todo el ancho
			// y centrarlo verticalmente
			//title_tf.x = 0;
			//title_tf.width = stageW;
			//title_tf.y = stageH/2 - title_tf.height - gutter;
			
			// CAMBIO DE LAYOUT SEGÚN ORIENTACIÓN
			// A veces nos interesa cambiar directamente el layout completo del a pantalla
			// cuando cambiamos de modo de visualización (Portrait vs Landscape).
			// Para ello podemos, comparando ancho y altura de la aplicación poner un tipo de layout u otro
			if ( stageW>stageH ) {
				// CASO LANDSCAPE
				// En este caso puede ser preferible situar los botones
				// en horizontal
				
				logoGbooks_sp.x = stageH/2+gutter*3;
				title_tf.x = stageH/2 - gutter*4+50;
				title_tf.y = stageH/2 +200;
				logoGbooks_sp.y= 50;
				
				
				
				// Situamos los tres botones a la misma altura
				btSearch_sp.y = stageH/2;
				btMyFavorites_sp.y = stageH/2;
				btMyFavorites_sp.x = btSearch_sp.width+gutter*4-20 ;//+ btMyFavorites_sp.width;

				// Centraremos el botónB para luego ajustar los dos otros botones a sus lados
				//optionB_sp.x = stageW/2 - optionB_sp.width/2;
				//optionA_sp.x = optionB_sp.x - optionA_sp.width - gutter/2;
				//optionC_sp.x = optionB_sp.x + optionB_sp.width + gutter/2; 
				title_tf.text = title_tf_text;
				
				
			} else {
				// CASO PORTRAIT
				// En este caso puede ser preferible situar los botones
				// en vertical
				
				logoGbooks_sp.x = 154.2;
				title_tf.x = 0;
				
				btSearch_sp.x = 80;
				btSearch_sp.y = 397,5;
				btMyFavorites_sp.x =	80;
				btMyFavorites_sp.y = 497,5;
				// Situamos los botones centrados horizontalmente
				//optionA_sp.x = stageW/2 - optionA_sp.width/2;
				//optionB_sp.x = stageW/2 - optionB_sp.width/2;
				//optionC_sp.x = stageW/2 - optionC_sp.width/2;
				// y uno debajo del otro
				// Nota: podemos situar el primero y el resto con respecto a este primero
				//optionA_sp.y = stageH/2;
				//optionB_sp.y = optionA_sp.y + optionA_sp.height + gutter/2;
				//optionC_sp.y = optionB_sp.y + optionB_sp.height + gutter/2;
				title_tf.text = title_tf_text;
			}
			
		}
	}
}