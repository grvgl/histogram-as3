package com.shivolve.histogram.model{
	
	import com.shivolve.histogram.model.DataObj;
	
	import fl.data.DataProvider;
	
	public class GizmoDataProvider extends DataProvider{
		
		private var _xIndex: Number;
		private var _yIndex: Number;
		private static var _xIndexMax: Number;
		private static var _yIndexMax: Number;
		private var _dataObj: DataObj;
		
		public function GizmoDataProvider(n1:Number, n2:Number) {
			_xIndexMax = n1;
			_yIndexMax = n2;
			createNewData();
		}
		public function set xIndexMax(n:Number):void{
			_xIndexMax = n;
		}
		public function get xIndexMax():Number{
			return _xIndexMax;
		}
		public function set yIndexMax(n:Number):void{
			_yIndexMax = n;
		}
		public function get yIndexMax():Number{
			return _yIndexMax;
		}
		public function set xIndex(n:Number):void{
			_xIndex = n;
		}
		public function get xIndex():Number{
			return _xIndex;
		}
		public function set yIndex(n:Number):void{
			_yIndex = n;
		}
		public function get yIndex():Number{
			return _yIndex;
		}		
		private function createNewData():GizmoDataProvider{
			for (var i:int = 0; i <_xIndexMax; i++){
				var _yValue:Number = Math.floor(_yIndexMax * Math.random());
				addItem(new DataObj(i, _yValue));
			}
			return this;
		}
		public function getDataAt(i:int):DataObj{
			var _dataObj:DataObj = DataObj(getItemAt(i));
			return _dataObj;
		}
		public function setDataAt(i:int):void{
			var d:DataObj = getDataAt(i);
			d.columnValue = d.columnValue + 1;
		}
	}
}