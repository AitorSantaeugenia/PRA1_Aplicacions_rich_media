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
	
	public class ScreenSearch extends MovieClip
	{
		
	//LLISTAT ELEMENTS DE LA SCREEN
		//BOTO BACK PANTALLA SCREENSEARCH
		public var bt_back:SimpleButton;
		//BOTO BUSCAR FONS TARONJA
		public var bg_titleBuscar:MovieClip;
		//FONS PANTALLA
		public var bgScreen_sp:MovieClip;
		//TITLE BUSCAR
		public var titleField_tf:TextField;
		//ALTRES TEXTOS
		public var title1_tf:TextField;
		public var title2_tf:TextField;
		public var title3_tf:TextField;
		
		//INPUTS
		public var bookTitle_appInputTF;
		public var bookAuthor_appInputTF;
		public var bookPublisher_appInputTF;
		public var bookSubject_appInputTF;
		public var bookISBN_appInputTF;
		
		//ALTRES BOTONS
		//CHECKBOX
		public var appCheckbox_sp:MovieClip;
		public var bt_searchBook:SimpleButton;
		public var bookItemArrow_sp:SimpleButton;
	//FI LLISTAT ELEMENTS SCREEN
		
		public function ScreenSearch(title:String)
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
			trace ("Refresh screenSearch");
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
				titleField_tf.x = bgScreen_sp.width/2 - gutter-10;
				
				//TEXTOS
				title1_tf.x = bgScreen_sp.width - bgScreen_sp.width +gutter;
				title1_tf.y = bgScreen_sp.height - bgScreen_sp.height + (gutter*3+15);
				
				title2_tf.x = 430;
				title2_tf.y = bgScreen_sp.height - bgScreen_sp.height + (gutter*3+15);
				
				//inputBg_sp.x=30;
				
				
				//INPUTSTF
				bookISBN_appInputTF.x= 430;
				bookISBN_appInputTF.y= bgScreen_sp.height - bgScreen_sp.height + (gutter*5+20);
				
				bookTitle_appInputTF.width = 340;
				bookSubject_appInputTF.width = 340;
				bookPublisher_appInputTF.width = 340;
				bookAuthor_appInputTF.width = 340;
				
				bookISBN_appInputTF.width = 340;
				//inputBg_sp.width=420;
				
				
				//CHECK BOX + TEXTCHECK BOX
				title3_tf.x = 515;
				title3_tf.y= 228;
				appCheckbox_sp.x = 430;
				appCheckbox_sp.y= 220;
				
				bt_searchBook.x = 430;
				bt_searchBook.y = 320;
				
			} else {
				// CASO PORTRAIT
				// En este caso puede ser preferible situar los botones
				// en vertical
				
				//BUSCAR + BOTON TITLE
				bg_titleBuscar.width = stageW;
				titleField_tf.x= bgScreen_sp.width/2 - gutter-10;
				
				//TEXTOS
				title1_tf.x = bgScreen_sp.width - bgScreen_sp.width +gutter;
				title1_tf.y = bgScreen_sp.height - bgScreen_sp.height + (gutter*3+15);
				
				title2_tf.x =  bgScreen_sp.width - bgScreen_sp.width +gutter;
				title2_tf.y = bgScreen_sp.height/2 + gutter +15;
				
				
				//INPUTSTF
				bookISBN_appInputTF.x= 30;
				bookISBN_appInputTF.y= 500;
				
				//inputBg_sp.width=420;
				
				bookTitle_appInputTF.width = 420;
				bookSubject_appInputTF.width = 420;
				bookPublisher_appInputTF.width = 420;
				bookAuthor_appInputTF.width = 420;
				
				bookISBN_appInputTF.width = 420;
				
				//inputBg_sp.width= 200;
				
				
				//CHECK BOX + TEXTCHECK BOX
				title3_tf.x = 93.7;
				title3_tf.y= 592;
				
				appCheckbox_sp.x = 31;
				appCheckbox_sp.y=589.4;
				
				bt_searchBook.x = 80;
				bt_searchBook.y = 680;
			}	
		}
		
		//EXERCICI PUNT 5
		/*
		private function addInput(ev:Event=null):void {	
			//var _placeholder = "Titulo";
			//--------------------------------------------------------------
			//bookTitle_appInputTF
			var bookTitle_appInputTF:AppInputTF = new AppInputTF("Titulo");
			
			bookTitle_appInputTF.width = 420;
			bookTitle_appInputTF.height = 38;
			bookTitle_appInputTF.x = 30;
			bookTitle_appInputTF.y = 170;

			//--------------------------------------------------------------
			//bookSubject_appInputTF
			var bookAuthor_appInputTF:AppInputTF = new AppInputTF("Autor");
			
			//addChild(inputField);
			
			//inputField.border = true;
			bookAuthor_appInputTF.width = 420;
			bookAuthor_appInputTF.height = 38;
			bookAuthor_appInputTF.x = 30;
			bookAuthor_appInputTF.y = 220;
			//inputField.type = "input";
			//stage.focus = inputField;
			//--------------------------------------------------------------
			//bookPublisher_appInputTF
			var bookPublisher_appInputTF:AppInputTF = new AppInputTF("Editorial");
			
			//addChild(inputField);
			
			//inputField.border = true;
			bookPublisher_appInputTF.width = 420;
			bookPublisher_appInputTF.height = 38;
			bookPublisher_appInputTF.x = 30;
			bookPublisher_appInputTF.y = 270;
			//inputField.type = "input";
			//stage.focus = inputField;
			//--------------------------------------------------------------
			//bookPublisher_appInputTF
			var bookSubject_appInputTF:AppInputTF = new AppInputTF("Tematica");
			
			//addChild(inputField);
			
			//inputField.border = true;
			bookSubject_appInputTF.width = 420;
			bookSubject_appInputTF.height = 38;
			bookSubject_appInputTF.x = 30;
			bookSubject_appInputTF.y = 320;
			//inputField.type = "input";
			//stage.focus = inputField;
			//--------------------------------------------------------------
			//bookPublisher_appInputTF
			var bookISBN_appInputTF:AppInputTF = new AppInputTF("ISBN");
			
			//addChild(inputField);
			
			//inputField.border = true;
			bookISBN_appInputTF.width = 420;
			bookISBN_appInputTF.height = 38;
			bookISBN_appInputTF.x = 30;
			bookISBN_appInputTF.y = 500;
			//inputField.type = "input";
			//stage.focus = inputField;
			//--------------------------------------------------------------
			
			
			bgScreen_sp.addChild(bookTitle_appInputTF);
			bgScreen_sp.addChild(bookSubject_appInputTF);
			bgScreen_sp.addChild(bookPublisher_appInputTF);
			bgScreen_sp.addChild(bookAuthor_appInputTF);
			bgScreen_sp.addChild(bookISBN_appInputTF);
			
			//POSICIONS X
			//220
			//270
			//320
			//500
			stage.addEventListener(Event.RESIZE, refreshScreen);
		}*/
}
}