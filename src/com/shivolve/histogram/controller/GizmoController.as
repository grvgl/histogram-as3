package com.shivolve.histogram.controller{

	import flash.ui.Mouse;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	import fl.data.DataProvider;

	import com.shivolve.histogram.model.*;
	import com.shivolve.histogram.controller.*;
	import com.shivolve.histogram.views.*;

	public class GizmoController {

		private var dp:GizmoDataProvider;
		private var _gridView:GizmoGridView;
		private var _chartView:GizmoChartView;
		
		public function GizmoController():void {
			//setDataProvider();
		}
		public function getDataProvider():GizmoDataProvider {
			return dp;
		}
		public function setDataProvider():void {
			dp = new GizmoDataProvider(20,10);
		}
		public function updateDataProvider(column:Number):void {
			dp.setDataAt(column);
			killAssets();
			createGrid();
			createChart();
		}
		public function mouseUpHandler(e:MouseEvent):void {
			setDataProvider();
			_gridView.drawCells();
			_gridView.drawBalls();
		}
		public function createGrid():void {
			gridView = new GizmoGridView(gridView.gizmo, this);
		}
		public function createChart():void {
			chartView = new GizmoChartView(gridView.gizmo, this);
		}
		public function killAssets():void {
			gridView.killAssets();
			chartView.killAssets();
		}
		public function set gridView(_g:GizmoGridView):void {
			_gridView = _g;
		}
		public function get gridView():GizmoGridView {
			return _gridView;
		}
		public function set chartView(_c:GizmoChartView):void {
			_chartView = _c;
		}
		public function get chartView():GizmoChartView {
			return _chartView;
		}
	}
}