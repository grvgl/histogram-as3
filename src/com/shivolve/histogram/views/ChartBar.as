package com.shivolve.histogram.views{
	
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.events.MouseEvent;
	
	import com.shivolve.histogram.model.*;
	import com.shivolve.histogram.controller.*;
	
	public class ChartBar extends Sprite{
        
		private var bgColor:uint      = 0xCC77AA;
        private var borderColor:uint  = 0x660066;
        private var borderSize:uint   = 0;

		private var xPos:Number;
		private var yPos:Number;
		private var w:Number;
		private var h:Number;
		
		private var containerSprite:Sprite;
		
		public function ChartBar(_s:Sprite, _xPos:Number, _yPos:Number, _w:Number, _h:Number) {
			containerSprite = _s;
			xPos = _xPos;
			yPos = _yPos;
			w = _w;
			h = _h;
			drawBar()
		}
		private function drawBar():void{
			var bar:Shape = new Shape();
            bar.graphics.beginFill(bgColor);
            bar.graphics.lineStyle(borderSize, borderColor);
            bar.graphics.drawRect(xPos, yPos, w, h);
            bar.graphics.endFill();
            containerSprite.addChild(bar);
		}
		private function addEventListeners():void{
			//this.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
		}
		private function mouseDownHandler(e:MouseEvent):void{
			//trace(e.target);
		}
	}
}