package com.shivolve.histogram.views{
	
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.events.MouseEvent;
	
	import com.shivolve.histogram.model.*;
	import com.shivolve.histogram.controller.*;
	
	public class ChartCell extends Sprite{
        private var bgColor:uint      = 0xCCCCCC;
        private var borderColor:uint  = 0x666666;
        private var borderSize:uint   = 0;

		private var xPos:Number;
		private var yPos:Number;
		private var w:Number;
		private var h:Number;
		private var containerSprite:Sprite;
		public function ChartCell(_s:Sprite, _xPos:Number, _yPos:Number, _w:Number, _h:Number) {
			containerSprite = _s;
			xPos = _xPos;
			yPos = _yPos;
			w = _w;
			h = _h;
			drawCell()
		}
		private function drawCell():void{
			var cell:Shape = new Shape();
            cell.graphics.beginFill(bgColor);
            cell.graphics.lineStyle(borderSize, borderColor);
            cell.graphics.drawRect(xPos, yPos, w, h);
            cell.graphics.endFill();
            containerSprite.addChild(cell);

		}
		private function addEventListeners():void{
			addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
		}
		private function mouseDownHandler(e:MouseEvent):void{
			trace(e.target);
		}
	}
}