package
{
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.engine.TextBaseline;
	
	public class ScreenSearchResult extends MovieClip
	{
		//LLISTAT ELEMENTS DE LA SCREEN
			//FONS PANTALLA
			public var bgScreen_sp:MovieClip;
			//BOTO BACK PANTALLA SCREENSEARCH
			public var bt_backScreenSearchResult:SimpleButton;
			//BOTO BUSCAR FONS TARONJA
			public var bg_titleBuscar:MovieClip;
			//TITLE BUSCAR
			public var titleField_tf:TextField;
			//Botó screenBookDetail
			public var bookItemArrow_sp:SimpleButton;
			//INPUTS
			public var book1_appBookItem_sp;
			public var book2_appBookItem_sp;
			public var book3_appBookItem_sp;
			public var book4_appBookItem_sp;
			public var book5_appBookItem_sp;
			public var book6_appBookItem_sp;
			public var book7_appBookItem_sp;
			public var book8_appBookItem_sp;
			
			//Camps dins input
			public var bookItemAuthor_tf;
			public var bookItemTitle_tf;
			
			//QUERY
			public var query_tf;
		//FI LLISTAT ELEMENTS SCREEN
		
		public function ScreenSearchResult(title:String)
		{
			super();
			// En este ejemplo recibimos el título de la aplicación
			// como parámetro y se lo asignamos al campo title_tf
			//title_tf.text = title;
			
			// Para que se realice el cambio de cursor al sobrevolar los botones de navegación
			//screenSearch_sp_btSearch_sp.buttonMode = true;
			//btBack_sp.buttonMode = true;
			
			// Nos aseguramos que la clase del documento ha sido instanciada
			// y añadida a stage
			addEventListener(Event.ADDED_TO_STAGE, init);	
			
			// También es importante hacer limpieza al retirar la instancia de la displayList.
			// Para por ejemplo limpiar los escuchadores que ya no se utilizarán
			addEventListener(Event.REMOVED_FROM_STAGE, dispose);	
			
			//ESCOLTADOR PER EL REFRESH
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
			//stage.addEventListener(Event.RESIZE, 
			
			//CRIDADA ETAPA 5, DEFORMA PANTALLA
			//addInput();
			
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
		
		public function refreshScreen(ev:Event=null):void {
			/* En un principi varem voler realitzar el refresh per a qualsevol tipus de pantalla, és a dir
			més enllà del portrait o landscape, posteriorment, per la dificultat i per parlar amb altres companys
			varem adjustar els elements a landscape y portrait només */
			
			// Reposicionamos los elementos a las nuevas medidas de la pantalla 
			trace ("Refresh screenSearchResult");
			//trace(bgScreen_sp.width);
			//trace(fons_title.y);
			
			// Para más comodidad recuperamos las nuevas medidas de nuestra aplicación
			var stageW:int = stage.stageWidth;
			var stageH:int = stage.stageHeight;
			// También puede ser interesante el uso de una variable 
			// para obtener espaciados iguales entre ciertos elementos
			var gutter:int = 30;
			
			// Adaptamos el fondo al espacio disponible
			bgScreen_sp.width = stageW;
			bgScreen_sp.height = stageH;
			
			if ( stageW>stageH ) {
				// CASO LANDSCAPE
				// En este caso puede ser preferible situar los botones
				// en horizontal
				
				//BUSCAR + BOTON TITLE
				bg_titleBuscar.width = stageW;
				titleField_tf.x= bgScreen_sp.width/2 - gutter-100;
				
				//INPUTS
				book1_appBookItem_sp.width = bgScreen_sp.width;
				book2_appBookItem_sp.width = bgScreen_sp.width;
				book3_appBookItem_sp.width = bgScreen_sp.width;
				book4_appBookItem_sp.width = bgScreen_sp.width;
				book5_appBookItem_sp.width = bgScreen_sp.width;
				book6_appBookItem_sp.width = bgScreen_sp.width;
				book7_appBookItem_sp.width = bgScreen_sp.width;
				book8_appBookItem_sp.width = bgScreen_sp.width;

			} else {
				// CASO PORTRAIT
				// En este caso puede ser preferible situar los botones
				// en vertical
				
				//BUSCAR + BOTON TITLE
				bg_titleBuscar.width = stageW;
				titleField_tf.x = 60;
				
				//INPUTS
				book1_appBookItem_sp.width = 480;
				book2_appBookItem_sp.width = 480;
				book3_appBookItem_sp.width = 480;
				book4_appBookItem_sp.width = 480;
				book5_appBookItem_sp.width = 480;
				book6_appBookItem_sp.width = 480;
				book7_appBookItem_sp.width = 480;
				book8_appBookItem_sp.width = 480;
				
				
			}	
		}
	}
}

