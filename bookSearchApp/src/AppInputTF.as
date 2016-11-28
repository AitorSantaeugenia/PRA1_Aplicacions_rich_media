package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.engine.TextBaseline;
	
	public class AppInputTF extends Sprite
	{
		
		public var _inputBg_s;
		public var _input_tf;
		
		
		//var _placeholder:TextField;
		
		public function AppInputTF(/*input_tf*/)
		{
			/*
			//_placeholder=placeholder;
			
			_input_tf=input_tf;
			//trace(_input_tf);
			
			super();
			// We assure the class has been instantiated 
			// and added to the aplication displayList
			addEventListener(Event.ADDED_TO_STAGE, init);	
			
			getInputTxt(_input_tf);*/
			
		}
		
		//FUNCIO QUE ENS DEMANA L'ANUNCIAT
		public function getInputTxt(_input_tf)
		{
			/*
			var _placeholder = _input_tf;
			//IMPRIMEIX TOTS ELS PLACEHOLDER - HO FA CORRECTE
			trace(_placeholder);
			
			
			// Nos aseguramos que la clase del documento ha sido instanciada
			// y añadida a stage
			addEventListener(Event.ADDED_TO_STAGE, init);	*/
			
		}
		
		private function init(ev:Event):void {
			
			// Hacemos antes un poco de limpieza
			// y eliminamos el escuchador que ya no utilizamos
			removeEventListener(Event.ADDED_TO_STAGE,init);
			
			//getInputTxt();			
			
		}
	}
}