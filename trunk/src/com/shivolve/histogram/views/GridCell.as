package com.shivolve.histogram.views{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.events.*;

	import com.shivolve.histogram.model.*;
	import com.shivolve.histogram.controller.*;

	public class GridCell extends Sprite {
		private var bgColor:uint      = 0xFFCC00;
		private var borderColor:uint  = 0x666666;
		private var borderSize:uint   = 0;

		private var xPos:Number;
		private var yPos:Number;
		private var w:Number;
		private var h:Number;
		private var containerSprite:Sprite;
		private var cell_mc:MovieClip;

		public function GridCell(_s:Sprite, _xPos:Number, _yPos:Number, _w:Number, _h:Number) {
			containerSprite = _s;
			xPos = _xPos;
			yPos = _yPos;
			w = _w;
			h = _h;
			drawCell();
		}
		private function drawCell():void {
			cell_mc = new MovieClip();
			var cell:Shape = new Shape();
			cell.graphics.beginFill(bgColor);
			cell.graphics.lineStyle(borderSize, borderColor);
			cell.graphics.drawRect(xPos, yPos, w, h);
			cell.graphics.endFill();
			cell_mc.addChild(cell);
			containerSprite.addChild(cell_mc);
			cell_mc.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			this.useHandCursor = true;
		}
		public function getChildMC():MovieClip{
			return cell_mc;
		}
		private function mouseDownHandler(e:MouseEvent):void {
			e.target.dispatchEvent(new MouseEvent("GridCell_CLICK"));
		}
	}
}
