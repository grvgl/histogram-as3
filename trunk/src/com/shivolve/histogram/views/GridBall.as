package com.shivolve.histogram.views{
	
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.events.MouseEvent;
	
	import com.shivolve.histogram.model.*;
	import com.shivolve.histogram.controller.*;
	
	public class GridBall extends Sprite{
        
		private var bgColor:uint      = 0xC00FFC;
        private var borderColor:uint  = 0x666666;
        private var borderSize:uint   = 0;

		private var xPos:Number;
		private var yPos:Number;
		private var radius:Number;
		private var containerSprite:Sprite;
		
		public function GridBall(_s:Sprite, _xPos:Number, _yPos:Number, _radius:Number) {
			containerSprite = _s;
			xPos = _xPos;
			yPos = _yPos;
			radius = _radius;
			drawBall()
		}
		private function drawBall():void{
			var ball:Shape = new Shape();
            ball.graphics.beginFill(bgColor);
            ball.graphics.lineStyle(borderSize, borderColor);
            ball.graphics.drawCircle(xPos, yPos, radius);
            ball.graphics.endFill();
            containerSprite.addChild(ball);
		}
		private function addEventListeners():void{
			this.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
		}
		private function mouseDownHandler(e:MouseEvent):void{
			trace(e.target);
		}
	}
}