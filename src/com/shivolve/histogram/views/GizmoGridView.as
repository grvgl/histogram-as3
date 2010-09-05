package com.shivolve.histogram.views{

	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.events.*;
	import fl.data.DataProvider;

	import com.shivolve.histogram.model.*;
	import com.shivolve.histogram.controller.*;
	import com.shivolve.histogram.views.*;

	public class GizmoGridView extends Sprite {

		private var dp:GizmoDataProvider;
		private var _gizmo:Sprite;
		private var _grid:Shape;
		private var gridWidth:Number;
		private var gridHeight:Number;
		private var cells:Array;
		private var balls:Array;
		private var gridSize:Number;
		private var controller:GizmoController;
		public function GizmoGridView(_g:Sprite,_controller:GizmoController) {
			controller=_controller;
			controller.gridView=this;
			dp=controller.getDataProvider();
			gridSize=15;
			_gizmo=_g;
			_grid=new Shape  ;
			gridWidth=20 * 15;
			gridHeight=10 * 15;
			x=gridWidth;
			y=5;
			drawCells();
			drawBalls();
			addChild(_grid);
			gizmo.addChild(this);
			addEventListeners();
		}
		public function drawCells():void {
			cells=new Array  ;
			for (var i:int=0; i < dp.xIndexMax; i++) {
				cells[i]=new Array  ;
				for (var j:int=0; j < dp.yIndexMax; j++) {
					var gridCell:GridCell=new GridCell(this,i * gridSize - gridWidth,gridHeight - j * gridSize,gridSize,gridSize);
					cells[i][j]=gridCell;
				}
			}
		}
		private function onGridCellRelease(e:MouseEvent):void {
			for (var i:int=0; i < cells.length; i++) {
				for (var j:int=0; j < cells[i].length; j++) {
					if (cells[i][j].getChildMC().name == e.target.name) {
						if (j >= dp.getDataAt(i).columnValue) {
							controller.updateDataProvider(i);
						}
						break;
					}
				}
			}
		}
		private function addBall(column:Number):void {
			var gridBall:GridBall=new GridBall(this,column * gridSize - gridWidth + gridSize / 2,gridHeight - dp.getDataAt(column).columnValue * gridSize + gridSize / 2,gridSize / 3);
		}
		public function drawBalls():void {
			balls=new Array  ;
			for (var i:int=0; i < dp.xIndexMax; i++) {
				balls[i]=new Array  ;
				for (var j:int=0; j < dp.getDataAt(i).columnValue; j++) {
					var gridBall:GridBall=new GridBall(this,i * gridSize - gridWidth + gridSize / 2,gridHeight - j * gridSize + gridSize / 2,gridSize / 3);
					balls[i][j]=gridBall;
				}
			}
		}
		private function addEventListeners():void {
			addEventListener("GridCell_CLICK",onGridCellRelease);
		}
		public function get gizmo():Sprite {
			return _gizmo;
		}
		//TODO
		public function killAssets():void {
		}
	}
}