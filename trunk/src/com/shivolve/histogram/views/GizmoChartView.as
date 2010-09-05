package com.shivolve.histogram.views{

	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.events.MouseEvent;
	import fl.data.DataProvider;

	import com.shivolve.histogram.model.*;
	import com.shivolve.histogram.controller.*;
	import com.shivolve.histogram.views.*;

	public class GizmoChartView extends Sprite {

		private var dp:GizmoDataProvider;
		private var _gizmo:Sprite;
		private var _chart:Shape;
		private var chartWidth:Number;
		private var chartHeight:Number;
		private var cells:Array;
		private var bars:Array;
		private var barWidth:Number;
		private var controller:GizmoController;
		public function GizmoChartView(_g:Sprite, _controller:GizmoController) {
			controller = _controller;
			controller.chartView = this;
			dp = controller.getDataProvider();
			barWidth = 15;
			_gizmo = _g;
			_chart = new Shape();
			chartWidth = 20 * 15;
			chartHeight = 10 * 15;
			x = chartWidth;
			y = 180;
			drawCells();
			drawBars();
			addChild(_chart);
			gizmo.addChild(this);
		}
		public function drawCells():void {
			cells = new Array();
			for (var i:int=0; i < dp.xIndexMax; i++) {
				cells[i] = new Array();
				for (var j:int=0; j < dp.yIndexMax; j++) {
					var chartCell:ChartCell = new ChartCell(this, i*barWidth - chartWidth, chartHeight - j*barWidth, barWidth, barWidth);
					cells[i][j] = chartCell;
				}
			}
		}
		public function drawBars():void {
			bars = new Array();
			for (var i:int=0; i < dp.xIndexMax; i++) {
				var barHeight:Number = barWidth * dp.getDataAt(i).columnValue;
				var chartBar:ChartBar = new ChartBar(this, (i * barWidth) - chartWidth, chartHeight - barHeight + barWidth, barWidth, barHeight);
			}
		}
		public function get gizmo():Sprite {
			return _gizmo;
		}
		//TODO
		public function killAssets():void{
		}
	}
}